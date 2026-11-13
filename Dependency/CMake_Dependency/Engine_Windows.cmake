# Windows.cmake

# ============================================================
# Repository
# ============================================================

# pankey_repository(
#     ThePankeyEngine-Utility-Base-Windows
#     https://github.com/PankeyCR/ThePankeyEngine-Utility-Base-Windows
# )

pankey_repository(
    ThePankeyEngine-Utility-Log-Windows
    https://github.com/PankeyCR/ThePankeyEngine-Utility-Log-Windows
)

pankey_repository(
    ThePankeyEngine-Support-File-Windows
    https://github.com/PankeyCR/ThePankeyEngine-Support-File-Windows
)

pankey_repository(
    ThePankeyEngine-Library-Network-Windows
    https://github.com/PankeyCR/ThePankeyEngine-Library-Network-Windows
)

pankey_repository(
    ThePankeyEngine-Library-Print-Windows
    https://github.com/PankeyCR/ThePankeyEngine-Library-Print-Windows
)

# pankey_repository(
#     ThePankeyEngine-Library-Render-Windows
#     https://github.com/PankeyCR/ThePankeyEngine-Library-Render-Windows
# )

pankey_repository(
    ThePankeyEngine-Library-Thread-Windows
    https://github.com/PankeyCR/ThePankeyEngine-Library-Thread-Windows
)

pankey_repository(
    ThePankeyEngine-System-Hardware-Windows
    https://github.com/PankeyCR/ThePankeyEngine-System-Hardware-Windows
)

# ============================================================
# Levels
# ============================================================

pankey_level(
    ThePankeyEngine_Level_Platform_Windows

    # ThePankeyEngine-Utility-Base-Windows
    ThePankeyEngine-Utility-Log-Windows
    ThePankeyEngine-Support-File-Windows
    ThePankeyEngine-System-Hardware-Windows
    ThePankeyEngine-Library-Network-Windows
    ThePankeyEngine-Library-Print-Windows
    # ThePankeyEngine-Library-Render-Windows
    ThePankeyEngine-Library-Thread-Windows
)

# ============================================================
# Dependency Order
# ============================================================

pankey_dependency(
    ThePankeyEngine_Level_Platform_Windows
)

pankey_external(
    ws2_32
)