# Engine_Tests.cmake

# ============================================================
# Repository
# ============================================================

pankey_repository(
    ThePankeyEngine-Support-Data-Test
    https://github.com/PankeyCR/ThePankeyEngine-Support-Data-Test
)

pankey_repository(
    ThePankeyEngine-DataStructure-Array-Test
    https://github.com/PankeyCR/ThePankeyEngine-DataStructure-Array-Test
)

pankey_repository(
    ThePankeyEngine-Type-Array-Test
    https://github.com/PankeyCR/ThePankeyEngine-Type-Array-Test
)

pankey_repository(
    ThePankeyEngine-Type-Map-Test
    https://github.com/PankeyCR/ThePankeyEngine-Type-Map-Test
)
# ============================================================
# Levels
# ============================================================

pankey_level(
    ThePankeyEngine_Level_Engine_Tests

    ThePankeyEngine-Support-File-Windows-Test
    ThePankeyEngine-Support-Data-Test
    ThePankeyEngine-DataStructure-Array-Test
    ThePankeyEngine-Type-Array-Test
    ThePankeyEngine-Type-Map-Test
)

# ============================================================
# Dependency Order
# ============================================================

pankey_dependency(
    ThePankeyEngine_Level_Engine_Tests
)