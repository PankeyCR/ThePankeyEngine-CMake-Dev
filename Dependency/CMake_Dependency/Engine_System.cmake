# Engine_Utility.cmake

# ============================================================
# Repository
# ============================================================

# pankey_repository(
#     ThePankeyEngine-System-Application-Holder
#     https://github.com/PankeyCR/ThePankeyEngine-System-Application-Holder
# )

pankey_repository(
    ThePankeyEngine-System-Application-Object
    https://github.com/PankeyCR/ThePankeyEngine-System-Application-Object
)

pankey_repository(
    ThePankeyEngine-System-Application-Policy
    https://github.com/PankeyCR/ThePankeyEngine-System-Application-Policy
)

pankey_repository(
    ThePankeyEngine-System-ECS
    https://github.com/PankeyCR/ThePankeyEngine-System-ECS
)

pankey_repository(
    ThePankeyEngine-System-Hardware
    https://github.com/PankeyCR/ThePankeyEngine-System-Hardware
)

# ============================================================
# Levels
# ============================================================

pankey_level(
    ThePankeyEngine_Level_System

    # ThePankeyEngine-System-Application-Holder
    ThePankeyEngine-System-Application-Object
    ThePankeyEngine-System-Application-Policy
    ThePankeyEngine-System-ECS
    ThePankeyEngine-System-Hardware
)

# ============================================================
# Dependency Order
# ============================================================

pankey_dependency(
    ThePankeyEngine_Level_System
)