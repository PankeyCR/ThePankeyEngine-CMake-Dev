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

function(pankey_module MODULE_NAME)

    set(MODULE_PATH
        "${PANKEY_LIBRARIES_ROOT}/${MODULE_NAME}"
    )

    string(REPLACE "-" "_" MODULE_TARGET "${MODULE_NAME}")

    if(
        NOT TARGET ${MODULE_TARGET}
        AND EXISTS "${MODULE_PATH}/CMakeLists.txt"
    )

        add_subdirectory(
            "${MODULE_PATH}"
            "${MODULE_TARGET}${PANKEY_BUILD_SUFFIX}"
        )

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