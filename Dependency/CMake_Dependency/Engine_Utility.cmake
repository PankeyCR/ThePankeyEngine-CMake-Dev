# Engine_Utility.cmake

# ============================================================
# Repository
# ============================================================

pankey_repository(
    ThePankeyEngine-Utility-Base
    https://github.com/PankeyCR/ThePankeyEngine-Utility-Base
)

pankey_repository(
    ThePankeyEngine-Utility-Log
    https://github.com/PankeyCR/ThePankeyEngine-Utility-Log
)

pankey_repository(
    ThePankeyEngine-Utility-Test
    https://github.com/PankeyCR/ThePankeyEngine-Utility-Test
)

# ============================================================
# Levels
# ============================================================

pankey_level(
    ThePankeyEngine_Level_Utility

    ThePankeyEngine-Utility-Base
    ThePankeyEngine-Utility-Log
    ThePankeyEngine-Utility-Test
)

# ============================================================
# Dependency Order
# ============================================================

pankey_dependency(
    ThePankeyEngine_Level_Utility
)