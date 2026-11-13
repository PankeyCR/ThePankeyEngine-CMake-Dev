# Install script for directory: C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/EngineTest")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
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
  set(CMAKE_OBJDUMP "C:/msys64/ucrt64/bin/objdump.exe")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Utility_Base_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Utility_Log_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Utility_Test_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Meta_Reflection_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Meta_Transform_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Memory_Allocator_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Ownership_Holder_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Ownership_Object_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_DataStructure_Array_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_DataStructure_List_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_DataStructure_Map_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Type_Array_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Type_Invoke_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Type_List_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Type_Map_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Type_Color_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Support_Data_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Support_File_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Support_Image_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Support_Logger_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Support_Print_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Support_Reflection_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Support_Serialization_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Support_Thread_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Support_Math_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Event_Map_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Event_Policy_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Runtime_List_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Runtime_Map_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Runtime_Policy_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_System_Application_Object_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_System_Application_Policy_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_System_ECS_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_System_Hardware_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Library_AI_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Library_File_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Library_IO_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Library_Network_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Library_Render_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Library_Tools_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Utility_Log_Windows_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Support_File_Windows_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_System_Hardware_Windows_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Library_Network_Windows_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Library_Print_Windows_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Library_Thread_Windows_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Support_File_Windows_Test_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Support_Data_Test_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_DataStructure_Array_Test_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Type_Array_Test_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/ThePankeyEngine_Type_Map_Test_build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/App_build/cmake_install.cmake")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
if(CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_COMPONENT MATCHES "^[a-zA-Z0-9_.+-]+$")
    set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
  else()
    string(MD5 CMAKE_INST_COMP_HASH "${CMAKE_INSTALL_COMPONENT}")
    set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INST_COMP_HASH}.txt")
    unset(CMAKE_INST_COMP_HASH)
  endif()
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "C:/Users/panke/Documents/ThePankeyEngine-CMake-Dev/Projects/EngineTest/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
