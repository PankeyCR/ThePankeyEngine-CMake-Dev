# Engine_Utility.cmake

# ============================================================
# Repository
# ============================================================

pankey_repository(
    ThePankeyEngine-Event-Map
    https://github.com/PankeyCR/ThePankeyEngine-Event-Map
)

pankey_repository(
    ThePankeyEngine-Event-Policy
    https://github.com/PankeyCR/ThePankeyEngine-Event-Policy
)

# ============================================================
# Levels
# ============================================================

pankey_level(
    ThePankeyEngine_Level_Event

    ThePankeyEngine-Event-Map
    ThePankeyEngine-Event-Policy
)

# ============================================================
# Dependency Order
# ============================================================

pankey_dependency(
    ThePankeyEngine_Level_Event
)