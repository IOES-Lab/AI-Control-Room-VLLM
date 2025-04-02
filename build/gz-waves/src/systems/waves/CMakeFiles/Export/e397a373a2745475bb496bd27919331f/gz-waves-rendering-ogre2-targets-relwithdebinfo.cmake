#----------------------------------------------------------------
# Generated CMake target import file for configuration "RelWithDebInfo".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "gz-waves::gz-waves-rendering-ogre2" for configuration "RelWithDebInfo"
set_property(TARGET gz-waves::gz-waves-rendering-ogre2 APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(gz-waves::gz-waves-rendering-ogre2 PROPERTIES
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/libgz-waves-rendering-ogre2.1.0.0.dylib"
  IMPORTED_SONAME_RELWITHDEBINFO "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/install/lib/libgz-waves-rendering-ogre2.1.dylib"
  )

list(APPEND _cmake_import_check_targets gz-waves::gz-waves-rendering-ogre2 )
list(APPEND _cmake_import_check_files_for_gz-waves::gz-waves-rendering-ogre2 "${_IMPORT_PREFIX}/lib/libgz-waves-rendering-ogre2.1.0.0.dylib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
