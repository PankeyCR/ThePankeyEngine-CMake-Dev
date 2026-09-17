# Repo_AI.cmake

# ============================================================
# Repository
# ============================================================

pankey_repository(
    ThePankeyEngine-Library-AI
    https://github.com/PankeyCR/ThePankeyEngine-Library-AI
)

# ============================================================
# Levels
# ============================================================

pankey_level(
    ThePankeyEngine_Level_AI

    ThePankeyEngine-Library-AI
)

# ============================================================
# Dependency Order
# ============================================================

pankey_dependency(
    ThePankeyEngine_Level_AI
)