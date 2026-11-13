include("${CMAKE_CURRENT_LIST_DIR}/pankey_config.cmake")

function(pankey_load LOAD_TARGET DEPENDENCY_FILE)

    if(NOT TARGET ${LOAD_TARGET})

        add_library(
            ${LOAD_TARGET}
            INTERFACE
        )

    endif()

    set(PANKEY_CURRENT_LOAD_TARGET
        ${LOAD_TARGET}
    )

    include("${PANKEY_DEPENDENCY_ROOT}/${DEPENDENCY_FILE}")

    set(PANKEY_CURRENT_LOAD_TARGET
        ""
    )

endfunction()

function(pankey_repository REPOSITORY_NAME REPOSITORY_URL)

    string(
        REPLACE "-"
        "_"
        REPOSITORY_TARGET
        "${REPOSITORY_NAME}"
    )

    # --------------------------------------------------------
    # Already loaded as a CMake target
    # --------------------------------------------------------

    if(TARGET ${REPOSITORY_TARGET})

        return()

    endif()


    # --------------------------------------------------------
    # Check local Pankey library
    # --------------------------------------------------------

    set(
        REPOSITORY_LOCAL_PATH
        "${PANKEY_LIBRARIES_ROOT}/${REPOSITORY_NAME}"
    )

    if(
        EXISTS
        "${REPOSITORY_LOCAL_PATH}/CMakeLists.txt"
    )

        return()

    endif()


    # --------------------------------------------------------
    # Temporary repository directory
    # --------------------------------------------------------

    if(NOT PANKEY_REPOSITORY_ROOT)

        set(
            PANKEY_REPOSITORY_ROOT
            "${CMAKE_BINARY_DIR}/pankey/repositories"
        )

    endif()


    set(
        REPOSITORY_DOWNLOAD_PATH
        "${PANKEY_REPOSITORY_ROOT}/${REPOSITORY_NAME}"
    )


    # --------------------------------------------------------
    # Already downloaded
    # --------------------------------------------------------

    if(
        EXISTS
        "${REPOSITORY_DOWNLOAD_PATH}/CMakeLists.txt"
    )

        return()

    endif()


    # --------------------------------------------------------
    # Git
    # --------------------------------------------------------

    find_package(Git REQUIRED)


    # --------------------------------------------------------
    # Remove incomplete previous download
    # --------------------------------------------------------

    if(
        EXISTS
        "${REPOSITORY_DOWNLOAD_PATH}"
    )

        file(
            REMOVE_RECURSE
            "${REPOSITORY_DOWNLOAD_PATH}"
        )

    endif()


    # --------------------------------------------------------
    # Create repository directory
    # --------------------------------------------------------

    file(
        MAKE_DIRECTORY
        "${PANKEY_REPOSITORY_ROOT}"
    )


    # --------------------------------------------------------
    # Clone repository
    # --------------------------------------------------------

    message(
        STATUS
        "Pankey: downloading repository '${REPOSITORY_NAME}'"
    )

    execute_process(
        COMMAND
            "${GIT_EXECUTABLE}"
            clone
            "${REPOSITORY_URL}"
            "${REPOSITORY_DOWNLOAD_PATH}"

        RESULT_VARIABLE
            GIT_RESULT

        OUTPUT_VARIABLE
            GIT_OUTPUT

        ERROR_VARIABLE
            GIT_ERROR
    )


    # --------------------------------------------------------
    # Check Git result
    # --------------------------------------------------------

    if(NOT GIT_RESULT EQUAL 0)

        message(
            FATAL_ERROR
            "pankey_repository(): failed to download repository "
            "'${REPOSITORY_NAME}'.\n\n"
            "URL: ${REPOSITORY_URL}\n"
            "Git output:\n${GIT_OUTPUT}\n"
            "Git error:\n${GIT_ERROR}"
        )

    endif()


    # --------------------------------------------------------
    # Verify repository
    # --------------------------------------------------------

    if(
        NOT EXISTS
        "${REPOSITORY_DOWNLOAD_PATH}/CMakeLists.txt"
    )

        message(
            FATAL_ERROR
            "pankey_repository(): repository "
            "'${REPOSITORY_NAME}' was downloaded successfully, "
            "but does not contain a CMakeLists.txt file.\n\n"
            "Path: ${REPOSITORY_DOWNLOAD_PATH}"
        )

    endif()

endfunction()

function(pankey_module MODULE_NAME)

    string(
        REPLACE "-"
        "_"
        MODULE_TARGET
        "${MODULE_NAME}"
    )


    # --------------------------------------------------------
    # 1. Target already exists
    # --------------------------------------------------------

    if(TARGET ${MODULE_TARGET})

        return()

    endif()


    # --------------------------------------------------------
    # 2. Check the normal/local library directory
    # --------------------------------------------------------

    set(
        MODULE_PATH
        "${PANKEY_LIBRARIES_ROOT}/${MODULE_NAME}"
    )

    if(
        EXISTS
        "${MODULE_PATH}/CMakeLists.txt"
    )

        add_subdirectory(
            "${MODULE_PATH}"
            "${MODULE_TARGET}${PANKEY_BUILD_SUFFIX}"
        )

        return()

    endif()


    # --------------------------------------------------------
    # 3. Check the temporary repository directory
    # --------------------------------------------------------

    if(NOT PANKEY_REPOSITORY_ROOT)

        set(
            PANKEY_REPOSITORY_ROOT
            "${CMAKE_BINARY_DIR}/pankey/repositories"
        )

    endif()

    set(
        MODULE_REPOSITORY_PATH
        "${PANKEY_REPOSITORY_ROOT}/${MODULE_NAME}"
    )


    if(
        EXISTS
        "${MODULE_REPOSITORY_PATH}/CMakeLists.txt"
    )

        add_subdirectory(
            "${MODULE_REPOSITORY_PATH}"
            "${MODULE_TARGET}${PANKEY_BUILD_SUFFIX}"
        )

        return()

    endif()

endfunction()   

function(pankey_level LEVEL_NAME)

    if(NOT TARGET ${LEVEL_NAME})

        add_library(
            ${LEVEL_NAME}
            INTERFACE
        )

    endif()

    foreach(MODULE_NAME ${ARGN})

        pankey_module(${MODULE_NAME})

        string(REPLACE "-" "_" MODULE_TARGET "${MODULE_NAME}")

        if(TARGET ${MODULE_TARGET})

            target_link_libraries(
                ${LEVEL_NAME}
                INTERFACE
                    ${MODULE_TARGET}
            )

        endif()

    endforeach()

    # if(TARGET ${PANKEY_CURRENT_LOAD_TARGET})

    #     target_link_libraries(
    #         ${PANKEY_CURRENT_LOAD_TARGET}
    #         INTERFACE
    #             ${LEVEL_NAME}
    #     )

    # endif()

endfunction()

function(pankey_dependency)

    set(PREVIOUS_LEVEL "")

    foreach(CURRENT_LEVEL ${ARGN})

        if(NOT TARGET ${CURRENT_LEVEL})
            message(FATAL_ERROR
                "pankey_dependency(): '${CURRENT_LEVEL}' has not been created. "
                "Did you forget to call pankey_level(${CURRENT_LEVEL} ...)?"
            )
        endif()

        if(PREVIOUS_LEVEL)

            target_link_libraries(
                ${CURRENT_LEVEL}
                INTERFACE
                ${PREVIOUS_LEVEL}
            )

        endif()

        set(PREVIOUS_LEVEL ${CURRENT_LEVEL})

    endforeach()

    if(PREVIOUS_LEVEL)

        target_link_libraries(
            ${PANKEY_CURRENT_LOAD_TARGET}
            INTERFACE
            ${PREVIOUS_LEVEL}
        )

    endif()

endfunction()

function(pankey_external)

    if(TARGET ${PANKEY_CURRENT_LOAD_TARGET})

        target_link_libraries(
            ${PANKEY_CURRENT_LOAD_TARGET}
            INTERFACE
                ${ARGN}
        )

    endif()

endfunction()

function(pankey_data)

    foreach(DATA_DIR ${ARGN})

        if(EXISTS "${PANKEY_DATA_ROOT}/${DATA_DIR}")

            file(
                GLOB_RECURSE DATA_FILES
                "${PANKEY_DATA_ROOT}/${DATA_DIR}/*"
            )

            foreach(FILE_PATH ${DATA_FILES})

                if(NOT IS_DIRECTORY "${FILE_PATH}")

                    file(
                        RELATIVE_PATH REL_PATH
                        "${PANKEY_DATA_ROOT}/${DATA_DIR}"
                        "${FILE_PATH}"
                    )

                    configure_file(
                        "${FILE_PATH}"
                        "${CMAKE_CURRENT_BINARY_DIR}/${DATA_DIR}/${REL_PATH}"
                        COPYONLY
                    )

                endif()

            endforeach()

        endif()

    endforeach()

endfunction()

function(pankey_link TARGET)

    set(CURRENT_TARGET ${TARGET})

    foreach(NEXT_TARGET ${ARGN})

        target_link_libraries(
            ${CURRENT_TARGET}
            INTERFACE
                ${NEXT_TARGET}
        )

        set(CURRENT_TARGET ${NEXT_TARGET})

    endforeach()

endfunction()



# ============================================================
# Testing
# ============================================================

# function(pankey_test TEST_NAME)

#     string(
#         REPLACE "-"
#         "_"
#         TEST_TARGET
#         "${TEST_NAME}"
#     )

#     if(NOT TARGET ${TEST_TARGET})
#         message(FATAL_ERROR
#             "pankey_test(): target '${TEST_TARGET}' does not exist."
#         )
#     endif()

#     get_target_property(
#         TEST_ROOT
#         ${TEST_TARGET}
#         INTERFACE_INCLUDE_DIRECTORIES
#     )

#     file(
#         GLOB TEST_FILES
#         "${TEST_ROOT}/Test_*.hpp"
#     )

#     if(NOT TEST_FILES)
#         message(FATAL_ERROR
#             "pankey_test(): no Test_*.hpp files found in "
#             "'${TEST_ROOT}'."
#         )
#     endif()

#     set(
#         MAIN_FILE
#         "${CMAKE_CURRENT_BINARY_DIR}/${TEST_TARGET}_Main.cpp"
#     )

#     file(
#         WRITE
#         "${MAIN_FILE}"
#         "#include \"PankeyTest.hpp\"\n"
#     )

#     foreach(TEST_FILE ${TEST_FILES})

#         get_filename_component(
#             TEST_FILE_NAME
#             "${TEST_FILE}"
#             NAME
#         )

#         file(
#             APPEND
#             "${MAIN_FILE}"
#             "#include \"${TEST_FILE_NAME}\"\n"
#         )

#     endforeach()

#     file(
#         APPEND
#         "${MAIN_FILE}"
#         "\n"
#         "int main()\n"
#         "{\n"
#         "    TestRunner runner;\n"
#         "    pankey_test_registry().run(runner);\n"
#         "    return runner.result();\n"
#         "}\n"
#     )

#     set(
#         TEST_RUNNER_TARGET
#         "${TEST_TARGET}_Runner"
#     )

#     if(NOT TARGET ${TEST_RUNNER_TARGET})

#         add_executable(
#             ${TEST_RUNNER_TARGET}
#             "${MAIN_FILE}"
#         )

#         target_link_libraries(
#             ${TEST_RUNNER_TARGET}
#             PRIVATE
#                 ${TEST_TARGET}
#         )

#     endif()

#     add_custom_target(
#         "${TEST_TARGET}_Test"
#         ALL
#         COMMAND
#             $<TARGET_FILE:${TEST_RUNNER_TARGET}>
#         DEPENDS
#             ${TEST_RUNNER_TARGET}
#         WORKING_DIRECTORY
#             "${TEST_ROOT}"
#         USES_TERMINAL
#     )

# endfunction()

# function(pankey_testing)

#     if(TARGET PankeyTesting)
#         return()
#     endif()

#     get_property(
#         TEST_TARGETS
#         GLOBAL
#         PROPERTY
#             PANKEY_TEST_TARGETS
#     )

#     if(NOT TEST_TARGETS)
#         return()
#     endif()

#     # --------------------------------------------------------
#     # Testing target
#     # --------------------------------------------------------

#     add_custom_target(
#         PankeyTesting
#         ALL
#     )

#     foreach(TEST_TARGET ${TEST_TARGETS})

#         add_dependencies(
#             PankeyTesting
#             "${TEST_TARGET}_Runner"
#         )

#         add_custom_command(
#             TARGET PankeyTesting
#             COMMAND
#                 $<TARGET_FILE:${TEST_TARGET}_Runner>
#             USES_TERMINAL
#         )

#     endforeach()

#     # --------------------------------------------------------
#     # Application targets
#     # --------------------------------------------------------

#     get_property(
#         APPLICATION_TARGETS
#         DIRECTORY
#         PROPERTY
#             BUILDSYSTEM_TARGETS
#     )

#     foreach(TARGET_NAME ${APPLICATION_TARGETS})

#         get_target_property(
#             TARGET_TYPE
#             ${TARGET_NAME}
#             TYPE
#         )

#         if(TARGET_TYPE STREQUAL "EXECUTABLE")

#             list(FIND TEST_TARGETS "${TARGET_NAME}" IS_TEST)

#             if(IS_TEST EQUAL -1)

#                 add_dependencies(
#                     ${TARGET_NAME}
#                     PankeyTesting
#                 )

#             endif()

#         endif()

#     endforeach()

# endfunction()