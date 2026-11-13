include("${CMAKE_CURRENT_LIST_DIR}/pankey_config.cmake")

# ============================================================
# Carga Global (Desde la carpeta de dependencias principal)
# ============================================================
function(pankey_load LOAD_TARGET DEPENDENCY_FILE)

    if(NOT TARGET ${LOAD_TARGET})
        add_library(
            ${LOAD_TARGET}
            INTERFACE
        )
    endif()

    # Apilar el target activo para soportar cargas recursivas
    list(APPEND PANKEY_LOAD_TARGET_STACK ${LOAD_TARGET})

    include("${PANKEY_DEPENDENCY_ROOT}/${DEPENDENCY_FILE}")

    # Desapilar el target al terminar la ejecución del archivo
    list(POP_BACK PANKEY_LOAD_TARGET_STACK)

endfunction()

# ============================================================
# Carga Local (Relativa a la posición del script que la invoca)
# ============================================================
function(pankey_load_local LOAD_TARGET DEPENDENCY_FILE)

    if(NOT TARGET ${LOAD_TARGET})
        add_library(
            ${LOAD_TARGET}
            INTERFACE
        )
    endif()

    # Apilar el target activo para soportar cargas recursivas
    list(APPEND PANKEY_LOAD_TARGET_STACK ${LOAD_TARGET})

    include("${CMAKE_CURRENT_LIST_DIR}/${DEPENDENCY_FILE}")

    # Desapilar el target al terminar la ejecución del archivo
    list(POP_BACK PANKEY_LOAD_TARGET_STACK)

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

endfunction()

function(pankey_dependency)

    # Obtener el target activo de la cima de la pila
    if(PANKEY_LOAD_TARGET_STACK)
        list(GET PANKEY_LOAD_TARGET_STACK -1 CURRENT_LOAD_TARGET)
    else()
        set(CURRENT_LOAD_TARGET "")
    endif()

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

    # Vincular el resultado de la cadena al target activo actual
    if(PREVIOUS_LEVEL AND TARGET ${CURRENT_LOAD_TARGET})
        target_link_libraries(
            ${CURRENT_LOAD_TARGET}
            INTERFACE
            ${PREVIOUS_LEVEL}
        )
    endif()

endfunction()

function(pankey_external)

    # Obtener el target activo de la cima de la pila
    if(PANKEY_LOAD_TARGET_STACK)
        list(GET PANKEY_LOAD_TARGET_STACK -1 CURRENT_LOAD_TARGET)
    else()
        set(CURRENT_LOAD_TARGET "")
    endif()

    if(TARGET ${CURRENT_LOAD_TARGET})
        target_link_libraries(
            ${CURRENT_LOAD_TARGET}
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