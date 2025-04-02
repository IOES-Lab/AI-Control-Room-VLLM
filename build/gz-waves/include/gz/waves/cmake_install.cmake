# Install script for directory: /Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/gz-waves/include/gz/waves

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "RelWithDebInfo")
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

# Set path to fallback-tool for dependency-resolution.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gz/waves1/gz/waves/components" TYPE FILE FILES "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/gz-waves/include/gz/waves/components/Wavefield.hh")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gz/waves1/gz/waves" TYPE FILE FILES
    "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/gz-waves/include/gz/waves/Algorithm.hh"
    "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/gz-waves/include/gz/waves/CGALTypes.hh"
    "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/gz-waves/include/gz/waves/Convert.hh"
    "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/gz-waves/include/gz/waves/Geometry.hh"
    "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/gz-waves/include/gz/waves/Grid.hh"
    "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/gz-waves/include/gz/waves/LinearRandomFFTWaveSimulation.hh"
    "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/gz-waves/include/gz/waves/LinearRandomWaveSimulation.hh"
    "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/gz-waves/include/gz/waves/LinearRegularWaveSimulation.hh"
    "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/gz-waves/include/gz/waves/MeshTools.hh"
    "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/gz-waves/include/gz/waves/OceanTile.hh"
    "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/gz-waves/include/gz/waves/PhysicalConstants.hh"
    "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/gz-waves/include/gz/waves/Physics.hh"
    "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/gz-waves/include/gz/waves/TriangulatedGrid.hh"
    "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/gz-waves/include/gz/waves/TrochoidIrregularWaveSimulation.hh"
    "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/gz-waves/include/gz/waves/Types.hh"
    "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/gz-waves/include/gz/waves/Utilities.hh"
    "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/gz-waves/include/gz/waves/WaveParameters.hh"
    "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/gz-waves/include/gz/waves/WaveSimulation.hh"
    "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/gz-waves/include/gz/waves/WaveSpectrum.hh"
    "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/gz-waves/include/gz/waves/WaveSpreadingFunction.hh"
    "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/gz-waves/include/gz/waves/Wavefield.hh"
    "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/gz-waves/include/gz/waves/WavefieldSampler.hh"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gz/waves1/gz" TYPE FILE FILES "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/include/gz/waves/../waves.hh")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gz/waves1/gz/waves" TYPE FILE FILES "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/include/gz/waves/config.hh")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/include/gz/waves/components/cmake_install.cmake")

endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/include/gz/waves/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
