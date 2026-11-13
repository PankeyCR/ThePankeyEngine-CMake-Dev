cmake_minimum_required(VERSION 3.15)

project(App)

if(NOT TARGET App)

    add_library(App INTERFACE)

    target_include_directories(
        App
          INTERFACE
            ${CMAKE_CURRENT_SOURCE_DIR}
    )

endif()

