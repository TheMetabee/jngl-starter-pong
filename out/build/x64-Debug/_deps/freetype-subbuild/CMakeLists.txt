# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.28.0-msvc1)

# Reject any attempt to use a toolchain file. We must not use one because
# we could be downloading it here. If the CMAKE_TOOLCHAIN_FILE environment
# variable is set, the cache variable will have been initialized from it.
unset(CMAKE_TOOLCHAIN_FILE CACHE)
unset(ENV{CMAKE_TOOLCHAIN_FILE})

# We name the project and the target for the ExternalProject_Add() call
# to something that will highlight to the user what we are working on if
# something goes wrong and an error message is produced.

project(freetype-populate NONE)



include(ExternalProject)
ExternalProject_Add(freetype-populate
                     "UPDATE_DISCONNECTED" "False" "DOWNLOAD_EXTRACT_TIMESTAMP" "FALSE" "EXTERNALPROJECT_INTERNAL_ARGUMENT_SEPARATOR" "URL" "https://sourceforge.net/projects/freetype/files/freetype2/2.13.3/freetype-2.13.3.tar.xz/download" "URL_HASH" "SHA256=0550350666d427c74daeb85d5ac7bb353acba5f76956395995311a9c6f063289"
                    SOURCE_DIR          "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/freetype-src"
                    BINARY_DIR          "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/freetype-build"
                    CONFIGURE_COMMAND   ""
                    BUILD_COMMAND       ""
                    INSTALL_COMMAND     ""
                    TEST_COMMAND        ""
                    USES_TERMINAL_DOWNLOAD  YES
                    USES_TERMINAL_UPDATE    YES
                    USES_TERMINAL_PATCH     YES
)


