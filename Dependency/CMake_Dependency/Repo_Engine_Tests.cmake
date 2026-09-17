# Repo_Engine_Tests.cmake

# ============================================================
# Repository
# ============================================================

pankey_repository(
    ThePankeyEngine-Library-AI-Test
    https://github.com/PankeyCR/ThePankeyEngine-Library-AI-Test
)
# ============================================================
# Levels
# ============================================================

pankey_level(
    ThePankeyEngine_Level_Engine_Tests

    ThePankeyEngine-Library-AI-Test
)

# ============================================================
# Dependency Order
# ============================================================

pankey_dependency(
    ThePankeyEngine_Level_Engine_Tests
)