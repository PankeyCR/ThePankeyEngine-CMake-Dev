# Engine_Ownership.cmake

# ============================================================
# Repository
# ============================================================

pankey_repository(
    ThePankeyEngine-Ownership-Holder
    https://github.com/PankeyCR/ThePankeyEngine-Ownership-Holder
)

pankey_repository(
    ThePankeyEngine-Ownership-Object
    https://github.com/PankeyCR/ThePankeyEngine-Ownership-Object
)

# ============================================================
# Levels
# ============================================================

pankey_level(
    ThePankeyEngine_Level_Ownership

    ThePankeyEngine-Ownership-Holder
    ThePankeyEngine-Ownership-Object
)

# ============================================================
# Dependency Order
# ============================================================

pankey_dependency(
    ThePankeyEngine_Level_Ownership
)