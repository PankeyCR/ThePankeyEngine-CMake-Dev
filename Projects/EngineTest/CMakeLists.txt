# =========================
# Platform: Windows - x64 - 
# Build: ThePankeyEngine - App - Llama - 
# Folders: AIModels -  
# =========================
cmake_minimum_required(VERSION 3.15)

include("${CMAKE_SOURCE_DIR}/../../Dependency/pankey_cmake_lib.cmake")

project(EngineTest)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static-libgcc -static-libstdc++ -static")

# pankey_load(pankey_engine Full_Engine.cmake)

pankey_load(pankey_engine Engine.cmake)

pankey_load(pankey_engine_windows Engine_Windows.cmake)

pankey_load(pankey_engine_tests Engine_Tests.cmake)

add_subdirectory(
    "${CMAKE_SOURCE_DIR}/App"
    App_build
)

add_executable(EngineTest main.cpp)

if(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
    target_compile_options(
        EngineTest
        PRIVATE
            -O3
            -march=native
            -mtune=native
    )
endif()

pankey_link(
    App
    
    pankey_engine_tests
    pankey_engine_windows
    pankey_engine
)

target_link_libraries(
    EngineTest
        PRIVATE
            App
)
