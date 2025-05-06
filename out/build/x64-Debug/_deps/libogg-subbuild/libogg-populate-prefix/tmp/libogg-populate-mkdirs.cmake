# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/libogg-src"
  "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/libogg-build"
  "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/libogg-subbuild/libogg-populate-prefix"
  "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/libogg-subbuild/libogg-populate-prefix/tmp"
  "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/libogg-subbuild/libogg-populate-prefix/src/libogg-populate-stamp"
  "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/libogg-subbuild/libogg-populate-prefix/src"
  "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/libogg-subbuild/libogg-populate-prefix/src/libogg-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/libogg-subbuild/libogg-populate-prefix/src/libogg-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/libogg-subbuild/libogg-populate-prefix/src/libogg-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
