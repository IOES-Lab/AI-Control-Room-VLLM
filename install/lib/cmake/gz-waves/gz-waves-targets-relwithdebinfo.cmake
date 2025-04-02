#----------------------------------------------------------------
# Generated CMake target import file for configuration "RelWithDebInfo".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "gz-waves::gz-waves" for configuration "RelWithDebInfo"
set_property(TARGET gz-waves::gz-waves APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(gz-waves::gz-waves PROPERTIES
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/libgz-waves.1.0.0.dylib"
  IMPORTED_SONAME_RELWITHDEBINFO "/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/install/lib/libgz-waves.1.dylib"
  )

list(APPEND _cmake_import_check_targets gz-waves::gz-waves )
list(APPEND _cmake_import_check_files_for_gz-waves::gz-waves "${_IMPORT_PREFIX}/lib/libgz-waves.1.0.0.dylib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
