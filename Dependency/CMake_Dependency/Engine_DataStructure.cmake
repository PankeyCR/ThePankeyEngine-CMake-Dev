# Engine_DataStructure.cmake

# ============================================================
# Repository
# ============================================================

pankey_repository(
    ThePankeyEngine-DataStructure-Array
    https://github.com/PankeyCR/ThePankeyEngine-DataStructure-Array
)

pankey_repository(
    ThePankeyEngine-DataStructure-List
    https://github.com/PankeyCR/ThePankeyEngine-DataStructure-List
)

pankey_repository(
    ThePankeyEngine-DataStructure-Map
    https://github.com/PankeyCR/ThePankeyEngine-DataStructure-Map
)

# ============================================================
# Levels
# ============================================================

pankey_level(
    ThePankeyEngine_Level_DataStructure

    ThePankeyEngine-DataStructure-Array
    ThePankeyEngine-DataStructure-List
    ThePankeyEngine-DataStructure-Map
)

# ============================================================
# Dependency Order
# ============================================================

pankey_dependency(
    ThePankeyEngine_Level_DataStructure
)