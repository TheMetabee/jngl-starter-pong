# Install script for directory: A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/webp-src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "A:/repos/jngl-starter-main/out/install/x64-Debug")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/webp-build/sharpyuv/libsharpyuv.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/webp-build/libsharpyuv.lib")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/webp/sharpyuv" TYPE FILE FILES
    "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/webp-src/sharpyuv/sharpyuv.h"
    "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/webp-src/sharpyuv/sharpyuv_csp.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/webp-build/src/libwebpdecoder.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/webp-build/src/libwebp.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/webp-build/src/demux/libwebpdemux.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/webp-build/libwebpdecoder.lib")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/webp" TYPE FILE FILES
    "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/webp-src/src/webp/decode.h"
    "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/webp-src/src/webp/types.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/webp-build/libwebp.lib")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/webp" TYPE FILE FILES
    "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/webp-src/src/webp/decode.h"
    "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/webp-src/src/webp/encode.h"
    "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/webp-src/src/webp/types.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/webp-build/libwebpdemux.lib")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/webp" TYPE FILE FILES
    "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/webp-src/src/webp/decode.h"
    "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/webp-src/src/webp/demux.h"
    "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/webp-src/src/webp/mux_types.h"
    "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/webp-src/src/webp/types.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/WebP/cmake/WebPTargets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/WebP/cmake/WebPTargets.cmake"
         "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/webp-build/CMakeFiles/Export/3dd5097d708f2adcdf4871ccc089782a/WebPTargets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/WebP/cmake/WebPTargets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/WebP/cmake/WebPTargets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/WebP/cmake" TYPE FILE FILES "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/webp-build/CMakeFiles/Export/3dd5097d708f2adcdf4871ccc089782a/WebPTargets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/WebP/cmake" TYPE FILE FILES "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/webp-build/CMakeFiles/Export/3dd5097d708f2adcdf4871ccc089782a/WebPTargets-debug.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/WebP/cmake" TYPE FILE FILES
    "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/webp-build/WebPConfigVersion.cmake"
    "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/webp-build/WebPConfig.cmake"
    )
endif()

