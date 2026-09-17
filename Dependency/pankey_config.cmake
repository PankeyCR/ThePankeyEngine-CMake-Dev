# ============================================================
# Workspace
# ============================================================

get_filename_component(
    PANKEY_WORKSPACE_ROOT
    "${CMAKE_CURRENT_LIST_DIR}/.."
    ABSOLUTE
)

# ============================================================
# Paths
# ============================================================

set(PANKEY_DEPENDENCY_ROOT
    "${PANKEY_WORKSPACE_ROOT}/Dependency/CMake_Dependency"
)

set(PANKEY_LIBRARIES_ROOT
    "${PANKEY_WORKSPACE_ROOT}/libraries"
)

set(PANKEY_DATA_ROOT
    "${PANKEY_WORKSPACE_ROOT}/Data"
)

set(PANKEY_BUILD_SUFFIX "_build")

# ============================================================
# Context
# ============================================================

set(PANKEY_CURRENT_LOAD_TARGET "")