# Repo_Llama.cmake

# ============================================================
# Repository
# ============================================================

pankey_repository(
    ThePankeyEngine-Library-Llama
    https://github.com/PankeyCR/ThePankeyEngine-Library-Llama
)

# ============================================================
# Levels
# ============================================================

pankey_level(
    ThePankeyEngine_Level_Llama

    ThePankeyEngine-Library-Llama
)

# ============================================================
# Dependency Order
# ============================================================

pankey_dependency(
    ThePankeyEngine_Level_Llama
)