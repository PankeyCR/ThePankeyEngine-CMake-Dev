# Engine_Memory.cmake

# ============================================================
# Repository
# ============================================================

pankey_repository(
    ThePankeyEngine-Memory-Allocator
    https://github.com/PankeyCR/ThePankeyEngine-Memory-Allocator
)

# ============================================================
# Levels
# ============================================================

pankey_level(
    ThePankeyEngine_Level_Memory

    ThePankeyEngine-Memory-Allocator
)

# ============================================================
# Dependency Order
# ============================================================

pankey_dependency(
    ThePankeyEngine_Level_Memory
)