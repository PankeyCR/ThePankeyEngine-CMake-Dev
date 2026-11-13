# Engine_Meta.cmake

# ============================================================
# Repository
# ============================================================

pankey_repository(
    ThePankeyEngine-Meta-Reflection
    https://github.com/PankeyCR/ThePankeyEngine-Meta-Reflection
)

pankey_repository(
    ThePankeyEngine-Meta-Transform
    https://github.com/PankeyCR/ThePankeyEngine-Meta-Transform
)

# ============================================================
# Levels
# ============================================================

pankey_level(
    ThePankeyEngine_Level_Meta

    ThePankeyEngine-Meta-Reflection
    ThePankeyEngine-Meta-Transform
)

# ============================================================
# Dependency Order
# ============================================================

pankey_dependency(
    ThePankeyEngine_Level_Meta
)