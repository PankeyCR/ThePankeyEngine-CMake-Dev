# Engine_Runtime.cmake

# ============================================================
# Repository
# ============================================================

pankey_repository(
    ThePankeyEngine-Runtime-List
    https://github.com/PankeyCR/ThePankeyEngine-Runtime-List
)

pankey_repository(
    ThePankeyEngine-Runtime-Map
    https://github.com/PankeyCR/ThePankeyEngine-Runtime-Map
)

pankey_repository(
    ThePankeyEngine-Runtime-Policy
    https://github.com/PankeyCR/ThePankeyEngine-Runtime-Policy
)

# ============================================================
# Levels
# ============================================================

pankey_level(
    ThePankeyEngine_Level_Runtime

    ThePankeyEngine-Runtime-List
    ThePankeyEngine-Runtime-Map
    ThePankeyEngine-Runtime-Policy
)

# ============================================================
# Dependency Order
# ============================================================

pankey_dependency(
    ThePankeyEngine_Level_Runtime
)