# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/fmt-src"
  "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/fmt-build"
  "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/fmt-subbuild/fmt-populate-prefix"
  "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/fmt-subbuild/fmt-populate-prefix/tmp"
  "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/fmt-subbuild/fmt-populate-prefix/src/fmt-populate-stamp"
  "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/fmt-subbuild/fmt-populate-prefix/src"
  "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/fmt-subbuild/fmt-populate-prefix/src/fmt-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/fmt-subbuild/fmt-populate-prefix/src/fmt-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "A:/repos/jngl-starter-main/out/build/x64-Debug/_deps/fmt-subbuild/fmt-populate-prefix/src/fmt-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
