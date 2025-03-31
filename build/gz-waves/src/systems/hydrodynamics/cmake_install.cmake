# Install script for directory: /Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/gz-waves/src/systems/hydrodynamics

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gz/waves1/gz/waves/hydrodynamics-system/detail" TYPE FILE FILES "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/include/gz/waves/hydrodynamics-system/detail/Export.hh")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gz/waves1/gz/waves/hydrodynamics-system" TYPE FILE FILES "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/include/gz/waves/hydrodynamics-system/Export.hh")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/lib/libgz-waves-hydrodynamics-system.1.0.0.dylib"
    "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/lib/libgz-waves-hydrodynamics-system.1.dylib"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgz-waves-hydrodynamics-system.1.0.0.dylib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgz-waves-hydrodynamics-system.1.dylib"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      execute_process(COMMAND "/usr/bin/install_name_tool"
        -id "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/install/lib/libgz-waves-hydrodynamics-system.1.dylib"
        -change "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/lib/libgz-waves.1.dylib" "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/install/lib/libgz-waves.1.dylib"
        "${file}")
      execute_process(COMMAND /usr/bin/install_name_tool
        -delete_rpath "/opt/homebrew/opt/gz-sim8/lib"
        -delete_rpath "/opt/homebrew/lib"
        -delete_rpath "/opt/homebrew/opt/gz-gui8/lib"
        -delete_rpath "/opt/homebrew/opt/gz-physics7/lib"
        -delete_rpath "/opt/homebrew/opt/gz-plugin2/lib"
        -delete_rpath "/opt/homebrew/opt/gz-rendering8/lib"
        -delete_rpath "/opt/homebrew/opt/gz-common5/lib"
        -delete_rpath "/opt/homebrew/opt/gz-transport13/lib"
        -delete_rpath "/opt/homebrew/opt/sdformat14/lib"
        -delete_rpath "/opt/homebrew/opt/gz-msgs10/lib"
        -delete_rpath "/opt/homebrew/opt/protobuf/lib"
        -delete_rpath "/opt/homebrew/opt/gz-math7/lib"
        -delete_rpath "/opt/homebrew/opt/gz-utils2/lib"
        "${file}")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "${file}")
      endif()
    endif()
  endforeach()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/lib/libgz-waves-hydrodynamics-system.dylib")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "cmake" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/gz-waves-hydrodynamics-system" TYPE FILE FILES
    "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/cmake/gz-waves-hydrodynamics-system-config.cmake"
    "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/cmake/gz-waves-hydrodynamics-system-config-version.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/gz-waves-hydrodynamics-system/gz-waves-hydrodynamics-system-targets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/gz-waves-hydrodynamics-system/gz-waves-hydrodynamics-system-targets.cmake"
         "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/src/systems/hydrodynamics/CMakeFiles/Export/82f81a2baf03d5d226352debdf4f7466/gz-waves-hydrodynamics-system-targets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/gz-waves-hydrodynamics-system/gz-waves-hydrodynamics-system-targets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/gz-waves-hydrodynamics-system/gz-waves-hydrodynamics-system-targets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/gz-waves-hydrodynamics-system" TYPE FILE FILES "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/src/systems/hydrodynamics/CMakeFiles/Export/82f81a2baf03d5d226352debdf4f7466/gz-waves-hydrodynamics-system-targets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/gz-waves-hydrodynamics-system" TYPE FILE FILES "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/src/systems/hydrodynamics/CMakeFiles/Export/82f81a2baf03d5d226352debdf4f7466/gz-waves-hydrodynamics-system-targets-relwithdebinfo.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "pkgconfig" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/install/lib/pkgconfig/gz-waves-hydrodynamics-system.pc")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/install/lib/pkgconfig" TYPE FILE FILES "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/cmake/pkgconfig/gz-waves-hydrodynamics-system.pc")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/build/gz-waves/src/systems/hydrodynamics/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
