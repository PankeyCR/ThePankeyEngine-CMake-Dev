# Engine.cmake

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