# Engine_Support.cmake

# ============================================================
# Repository
# ============================================================

pankey_repository(
    ThePankeyEngine-Support-Data
    https://github.com/PankeyCR/ThePankeyEngine-Support-Data
)

pankey_repository(
    ThePankeyEngine-Support-File
    https://github.com/PankeyCR/ThePankeyEngine-Support-File
)

pankey_repository(
    ThePankeyEngine-Support-Image
    https://github.com/PankeyCR/ThePankeyEngine-Support-Image
)

pankey_repository(
    ThePankeyEngine-Support-Logger
    https://github.com/PankeyCR/ThePankeyEngine-Support-Logger
)

pankey_repository(
    ThePankeyEngine-Support-Print
    https://github.com/PankeyCR/ThePankeyEngine-Support-Print
)

pankey_repository(
    ThePankeyEngine-Support-Reflection
    https://github.com/PankeyCR/ThePankeyEngine-Support-Reflection
)

pankey_repository(
    ThePankeyEngine-Support-Serialization
    https://github.com/PankeyCR/ThePankeyEngine-Support-Serialization
)

pankey_repository(
    ThePankeyEngine-Support-Thread
    https://github.com/PankeyCR/ThePankeyEngine-Support-Thread
)

pankey_repository(
    ThePankeyEngine-Support-Math
    https://github.com/PankeyCR/ThePankeyEngine-Support-Math
)

# ============================================================
# Levels
# ============================================================

pankey_level(
    ThePankeyEngine_Level_Support

    ThePankeyEngine-Support-Data
    ThePankeyEngine-Support-File
    ThePankeyEngine-Support-Image
    ThePankeyEngine-Support-Logger
    ThePankeyEngine-Support-Print
    ThePankeyEngine-Support-Reflection
    ThePankeyEngine-Support-Serialization
    ThePankeyEngine-Support-Thread
    ThePankeyEngine-Support-Math
)

# ============================================================
# Dependency Order
# ============================================================

pankey_dependency(
    ThePankeyEngine_Level_Support
)