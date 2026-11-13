# Engine_Utility.cmake

# ============================================================
# Repository
# ============================================================

pankey_repository(
    ThePankeyEngine-Type-Array
    https://github.com/PankeyCR/ThePankeyEngine-Type-Array
)

pankey_repository(
    ThePankeyEngine-Type-Invoke
    https://github.com/PankeyCR/ThePankeyEngine-Type-Invoke
)

pankey_repository(
    ThePankeyEngine-Type-List
    https://github.com/PankeyCR/ThePankeyEngine-Type-List
)

pankey_repository(
    ThePankeyEngine-Type-Map
    https://github.com/PankeyCR/ThePankeyEngine-Type-Map
)

pankey_repository(
    ThePankeyEngine-Type-Color
    https://github.com/PankeyCR/ThePankeyEngine-Type-Color
)

# ============================================================
# Levels
# ============================================================

pankey_level(
    ThePankeyEngine_Level_Type

    ThePankeyEngine-Type-Array
    ThePankeyEngine-Type-Invoke
    ThePankeyEngine-Type-List
    ThePankeyEngine-Type-Map
    ThePankeyEngine-Type-Color
)

# ============================================================
# Dependency Order
# ============================================================

pankey_dependency(
    ThePankeyEngine_Level_Type
)