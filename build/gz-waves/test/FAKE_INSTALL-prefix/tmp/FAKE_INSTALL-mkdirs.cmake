# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION ${CMAKE_VERSION}) # this file comes with cmake

# If CMAKE_DISABLE_SOURCE_CHANGES is set to true and the source directory is an
# existing directory in our source tree, calling file(MAKE_DIRECTORY) on it
# would cause a fatal error, even though it would be a no-op.
if(NOT EXISTS "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/gz-waves")
  file(MAKE_DIRECTORY "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/gz-waves")
endif()
file(MAKE_DIRECTORY
  "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/test/FAKE_INSTALL-prefix/src/FAKE_INSTALL-build"
  "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/test/FAKE_INSTALL-prefix"
  "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/test/FAKE_INSTALL-prefix/tmp"
  "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/test/FAKE_INSTALL-prefix/src/FAKE_INSTALL-stamp"
  "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/test/FAKE_INSTALL-prefix/src"
  "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/test/FAKE_INSTALL-prefix/src/FAKE_INSTALL-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/test/FAKE_INSTALL-prefix/src/FAKE_INSTALL-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/test/FAKE_INSTALL-prefix/src/FAKE_INSTALL-stamp${cfgdir}") # cfgdir has leading slash
endif()
