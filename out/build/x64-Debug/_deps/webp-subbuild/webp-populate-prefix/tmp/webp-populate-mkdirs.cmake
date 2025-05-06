# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/webp-src"
  "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/webp-build"
  "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/webp-subbuild/webp-populate-prefix"
  "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/webp-subbuild/webp-populate-prefix/tmp"
  "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/webp-subbuild/webp-populate-prefix/src/webp-populate-stamp"
  "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/webp-subbuild/webp-populate-prefix/src"
  "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/webp-subbuild/webp-populate-prefix/src/webp-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/webp-subbuild/webp-populate-prefix/src/webp-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/webp-subbuild/webp-populate-prefix/src/webp-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
