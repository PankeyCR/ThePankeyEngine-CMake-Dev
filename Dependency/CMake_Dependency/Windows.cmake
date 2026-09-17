# Windows.cmake

pankey_level(
    ThePankeyEngine_Level_Platform_Windows

    ThePankeyEngine-Utility-Base-Windows
    ThePankeyEngine-Utility-Log-Windows
    ThePankeyEngine-Support-File-Windows
    ThePankeyEngine-Library-Network-Windows
    ThePankeyEngine-Library-Print-Windows
    ThePankeyEngine-Library-Render-Windows
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