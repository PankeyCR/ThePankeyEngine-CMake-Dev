# =========================
# Platform: Windows - x64 - 
# Build: ThePankeyEngine - App - Llama - 
# Folders: AIModels -  
# =========================
cmake_minimum_required(VERSION 3.15)

include("${CMAKE_SOURCE_DIR}/../../Dependency/pankey_cmake_lib.cmake")

project(LlamaExample)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static-libgcc -static-libstdc++ -static")

pankey_load(pankey_engine Repo_Engine.cmake)

pankey_load(pankey_engine_library Repo_Engine_Library.cmake)

# pankey_load(pankey_engine_tests Repo_Engine_Tests.cmake)

pankey_load(pankey_windows Repo_Windows.cmake)

pankey_load(pankey_llama Repo_Llama.cmake)

pankey_load(pankey_ai Repo_AI.cmake)

add_subdirectory(
    "${CMAKE_SOURCE_DIR}/App"
    App_build
)

add_executable(LlamaExample main.cpp)

if(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
    target_compile_options(
        LlamaExample
        PRIVATE
            -O3
            -march=native
            -mtune=native
    )
endif()

pankey_link(
    App
    
    pankey_ai
    pankey_windows
    pankey_llama
    #pankey_engine_tests
    pankey_engine_library
    pankey_engine
)

target_link_libraries(
    LlamaExample
    PRIVATE
        App
)