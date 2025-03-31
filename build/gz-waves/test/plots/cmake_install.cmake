# Install script for directory: /Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/gz-waves/test/plots

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

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/bin/PLOT_GnuPlotExample")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/PLOT_GnuPlotExample" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/PLOT_GnuPlotExample")
    execute_process(COMMAND "/usr/bin/install_name_tool"
      -change "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/lib/libgz-waves.1.dylib" "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/install/lib/libgz-waves.1.dylib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/PLOT_GnuPlotExample")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/homebrew/lib"
      -delete_rpath "/opt/homebrew/opt/gz-common5/lib"
      -delete_rpath "/opt/homebrew/opt/gz-transport13/lib"
      -delete_rpath "/opt/homebrew/opt/gz-msgs10/lib"
      -delete_rpath "/opt/homebrew/opt/protobuf/lib"
      -delete_rpath "/opt/homebrew/opt/sdformat14/lib"
      -delete_rpath "/opt/homebrew/opt/gz-math7/lib"
      -delete_rpath "/opt/homebrew/opt/gz-utils2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/PLOT_GnuPlotExample")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -u -r "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/PLOT_GnuPlotExample")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/bin/PLOT_LinearRandomFFTWaves")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/PLOT_LinearRandomFFTWaves" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/PLOT_LinearRandomFFTWaves")
    execute_process(COMMAND "/usr/bin/install_name_tool"
      -change "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/lib/libgz-waves.1.dylib" "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/install/lib/libgz-waves.1.dylib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/PLOT_LinearRandomFFTWaves")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/homebrew/lib"
      -delete_rpath "/opt/homebrew/opt/gz-common5/lib"
      -delete_rpath "/opt/homebrew/opt/gz-transport13/lib"
      -delete_rpath "/opt/homebrew/opt/gz-msgs10/lib"
      -delete_rpath "/opt/homebrew/opt/protobuf/lib"
      -delete_rpath "/opt/homebrew/opt/sdformat14/lib"
      -delete_rpath "/opt/homebrew/opt/gz-math7/lib"
      -delete_rpath "/opt/homebrew/opt/gz-utils2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/PLOT_LinearRandomFFTWaves")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -u -r "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/PLOT_LinearRandomFFTWaves")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/bin/PLOT_LinearRandomWaves")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/PLOT_LinearRandomWaves" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/PLOT_LinearRandomWaves")
    execute_process(COMMAND "/usr/bin/install_name_tool"
      -change "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/lib/libgz-waves.1.dylib" "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/install/lib/libgz-waves.1.dylib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/PLOT_LinearRandomWaves")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/homebrew/lib"
      -delete_rpath "/opt/homebrew/opt/gz-common5/lib"
      -delete_rpath "/opt/homebrew/opt/gz-transport13/lib"
      -delete_rpath "/opt/homebrew/opt/gz-msgs10/lib"
      -delete_rpath "/opt/homebrew/opt/protobuf/lib"
      -delete_rpath "/opt/homebrew/opt/sdformat14/lib"
      -delete_rpath "/opt/homebrew/opt/gz-math7/lib"
      -delete_rpath "/opt/homebrew/opt/gz-utils2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/PLOT_LinearRandomWaves")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -u -r "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/PLOT_LinearRandomWaves")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/bin/PLOT_LinearRegularWaves")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/PLOT_LinearRegularWaves" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/PLOT_LinearRegularWaves")
    execute_process(COMMAND "/usr/bin/install_name_tool"
      -change "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/lib/libgz-waves.1.dylib" "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/install/lib/libgz-waves.1.dylib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/PLOT_LinearRegularWaves")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/homebrew/lib"
      -delete_rpath "/opt/homebrew/opt/gz-common5/lib"
      -delete_rpath "/opt/homebrew/opt/gz-transport13/lib"
      -delete_rpath "/opt/homebrew/opt/gz-msgs10/lib"
      -delete_rpath "/opt/homebrew/opt/protobuf/lib"
      -delete_rpath "/opt/homebrew/opt/sdformat14/lib"
      -delete_rpath "/opt/homebrew/opt/gz-math7/lib"
      -delete_rpath "/opt/homebrew/opt/gz-utils2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/PLOT_LinearRegularWaves")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -u -r "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/PLOT_LinearRegularWaves")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/bin/PLOT_WaveSpectrum")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/PLOT_WaveSpectrum" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/PLOT_WaveSpectrum")
    execute_process(COMMAND "/usr/bin/install_name_tool"
      -change "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/lib/libgz-waves.1.dylib" "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/install/lib/libgz-waves.1.dylib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/PLOT_WaveSpectrum")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/homebrew/lib"
      -delete_rpath "/opt/homebrew/opt/gz-common5/lib"
      -delete_rpath "/opt/homebrew/opt/gz-transport13/lib"
      -delete_rpath "/opt/homebrew/opt/gz-msgs10/lib"
      -delete_rpath "/opt/homebrew/opt/protobuf/lib"
      -delete_rpath "/opt/homebrew/opt/sdformat14/lib"
      -delete_rpath "/opt/homebrew/opt/gz-math7/lib"
      -delete_rpath "/opt/homebrew/opt/gz-utils2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/PLOT_WaveSpectrum")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -u -r "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/PLOT_WaveSpectrum")
    endif()
  endif()
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/test/plots/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
