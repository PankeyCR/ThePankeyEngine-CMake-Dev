# Repo_Engine_Library.cmake

# ============================================================
# Repository
# ============================================================

pankey_repository(
    ThePankeyEngine-Library-AI
    https://github.com/PankeyCR/ThePankeyEngine-Library-AI
)

pankey_repository(
    ThePankeyEngine-Library-File
    https://github.com/PankeyCR/ThePankeyEngine-Library-File
)

pankey_repository(
    ThePankeyEngine-Library-IO
    https://github.com/PankeyCR/ThePankeyEngine-Library-IO
)

pankey_repository(
    ThePankeyEngine-Library-Network
    https://github.com/PankeyCR/ThePankeyEngine-Library-Network
)

pankey_repository(
    ThePankeyEngine-Library-Render
    https://github.com/PankeyCR/ThePankeyEngine-Library-Render
)

pankey_repository(
    ThePankeyEngine-Library-Tools
    https://github.com/PankeyCR/ThePankeyEngine-Library-Tools
)

# ============================================================
# Levels
# ============================================================

pankey_level(
    ThePankeyEngine_Level_Engine_Library

    ThePankeyEngine-Library-AI
    ThePankeyEngine-Library-File
    ThePankeyEngine-Library-IO
    ThePankeyEngine-Library-Network
    ThePankeyEngine-Library-Render
    ThePankeyEngine-Library-Tools
)

# ============================================================
# Dependency Order
# ============================================================

pankey_dependency(
    ThePankeyEngine_Level_Engine_Library
)
