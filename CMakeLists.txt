cmake_minimum_required(VERSION 3.6)

project(jnglexample LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 17)
if(NOT MSVC)
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fdiagnostics-color -Wreorder")
endif()

if( ${CMAKE_SYSTEM_NAME} MATCHES "Emscripten")
	set(USE_FLAGS "-s USE_SDL=2 -s USE_FREETYPE=1 -s USE_VORBIS=1 -s USE_LIBPNG=1 -s DISABLE_EXCEPTION_CATCHING=0 ")
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${USE_FLAGS}")
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${USE_FLAGS}")
	set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${USE_FLAGS} -s ASSERTIONS=1 -s FULL_ES3=1 -s INITIAL_MEMORY=1024MB --source-map-base https://jhasse.gitlab.io/jnglexample/ -s FULL_ES3=1 -s MAX_WEBGL_VERSION=2 -g --preload-file data ") #-s ALLOW_MEMORY_GROWTH=1 --source-map-base http://127.0.0.1:8000/ -g
	SET(CMAKE_EXECUTABLE_SUFFIX ".html")
endif()

set(LIB_INSTALL_DIR lib${LIB_SUFFIX})

add_subdirectory(subprojects/jngl)

include_directories (
	../subprojects
	subprojects
)

include(FetchContent)
FetchContent_Declare(fmt
	URL https://github.com/fmtlib/fmt/releases/download/6.0.0/fmt-6.0.0.zip
	URL_HASH SHA256=b4a16b38fa171f15dbfb958b02da9bbef2c482debadf64ac81ec61b5ac422440)
FetchContent_MakeAvailable(fmt)

# download CPM.cmake
file(
  DOWNLOAD
  https://github.com/cpm-cmake/CPM.cmake/releases/download/v0.40.8/CPM.cmake
  ${CMAKE_CURRENT_BINARY_DIR}/cmake/CPM.cmake
  EXPECTED_HASH SHA256=78ba32abdf798bc616bab7c73aac32a17bbd7b06ad9e26a6add69de8f3ae4791
)
include(${CMAKE_CURRENT_BINARY_DIR}/cmake/CPM.cmake)

CPMAddPackage(
	NAME cereal
	URL https://github.com/USCiLab/cereal/archive/refs/tags/v1.3.2.tar.gz
	OPTIONS "SKIP_PORTABILITY_TEST ON" "JUST_INSTALL_CEREAL ON"
)

set(jnglexample_SANITIZE_ADDRESS_DEFAULT ON)
if ("${CMAKE_SYSTEM_NAME}" STREQUAL "Windows" OR ANDROID OR CMAKE_BUILD_TYPE MATCHES "Release")
	set(jnglexample_SANITIZE_ADDRESS_DEFAULT OFF)
endif()
option(jnglexample_SANITIZE_ADDRESS "Enable AddressSanitizer" ${jnglexample_SANITIZE_ADDRESS_DEFAULT})
if(jnglexample_SANITIZE_ADDRESS AND NOT EMSCRIPTEN)
	set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-omit-frame-pointer -fsanitize=address")
	set (CMAKE_LINKER_FLAGS "${CMAKE_LINKER_FLAGS} -fno-omit-frame-pointer -fsanitize=address")
endif()

file(GLOB SOURCES CONFIGURE_DEPENDS
	src/*.cpp
	src/engine/*.cpp
	src/engine/effects/*.cpp
	src/gui/*.cpp
)
if(ANDROID)
	# build native_app_glue as a static lib
	set(${CMAKE_C_FLAGS}, "${CMAKE_C_FLAGS}")
	add_library(native_app_glue STATIC
		${ANDROID_NDK}/sources/android/native_app_glue/android_native_app_glue.c)

	# now build app's shared lib
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14 -Wall")

	# Export ANativeActivity_onCreate(),
	# Refer to: https://github.com/android-ndk/ndk/issues/381.
	set(CMAKE_SHARED_LINKER_FLAGS
		"${CMAKE_SHARED_LINKER_FLAGS} -u ANativeActivity_onCreate")

	add_library(jnglexample SHARED ${SOURCES})

	target_include_directories(jnglexample PRIVATE
		${ANDROID_NDK}/sources/android/native_app_glue
		../../../../../../src
		../../../../../include
	)

	# add lib dependencies
	target_link_libraries(jnglexample
		android
		native_app_glue
		EGL
		GLESv3
		OpenSLES
		log
		z
		jngl
	)


	add_library(bootstrap SHARED android/app/src/main/cpp/bootstrap.cpp)

	target_include_directories(bootstrap PRIVATE
		${ANDROID_NDK}/sources/android/native_app_glue)

	# add lib dependencies
	target_link_libraries(bootstrap
		android
		native_app_glue
		log)
else()
	if(WIN32)
		set_source_files_properties(windows/main.rc PROPERTIES LANGUAGE RC)
		add_executable(jnglexample ${SOURCES} windows/main.rc "src/Paddle.cpp" "src/Control.cpp")
	else()
		add_executable(jnglexample ${SOURCES})
	endif()
	if(APPLE)
		target_link_libraries(jnglexample PRIVATE "-framework AppKit")
	elseif(NOT WIN32 AND NOT EMSCRIPTEN)
		target_link_libraries(jnglexample PRIVATE
			stdc++fs
		)
	endif()
	target_link_libraries(jnglexample PRIVATE
		jngl fmt cereal
	)
endif()

file(GLOB GFX_FILES RELATIVE ${CMAKE_SOURCE_DIR}/data CONFIGURE_DEPENDS data/*.webp data/*.png
                                                                        data/*/*.webp)
file(GLOB SFX_FILES RELATIVE ${CMAKE_SOURCE_DIR}/data data/sfx/*.ogg)
configure_file(src/engine/datafiles.hpp.in include/datafiles.hpp @ONLY)

if(WIN32)
	target_compile_definitions(jnglexample PRIVATE _USE_MATH_DEFINES)
endif()

if(CMAKE_BUILD_TYPE STREQUAL "Release")
	set_target_properties(jnglexample PROPERTIES WIN32_EXECUTABLE 1)
endif()
