# Engine.cmake

# ============================================================
# Levels
# ============================================================

pankey_level(
    ThePankeyEngine_Level_Utility

    ThePankeyEngine-Utility-Base
    ThePankeyEngine-Utility-Log
    ThePankeyEngine-Utility-SafeCode
    ThePankeyEngine-Utility-Test
)

pankey_level(
    ThePankeyEngine_Level_Meta

    ThePankeyEngine-Meta-Reflection
    ThePankeyEngine-Meta-Transform
)

pankey_level(
    ThePankeyEngine_Level_Memory

    ThePankeyEngine-Memory-Allocator
)

pankey_level(
    ThePankeyEngine_Level_Ownership

    ThePankeyEngine-Ownership-Holder
    ThePankeyEngine-Ownership-Object
)

pankey_level(
    ThePankeyEngine_Level_DataStructure

    ThePankeyEngine-DataStructure-Array
    ThePankeyEngine-DataStructure-List
    ThePankeyEngine-DataStructure-Map
)

pankey_level(
    ThePankeyEngine_Level_Type

    ThePankeyEngine-Type-Array
    ThePankeyEngine-Type-Invoke
    ThePankeyEngine-Type-List
    ThePankeyEngine-Type-Map
    ThePankeyEngine-Type-Pixel
)

pankey_level(
    ThePankeyEngine_Level_Support

    ThePankeyEngine-Support-File
    ThePankeyEngine-Support-Image
    ThePankeyEngine-Support-Logger
    ThePankeyEngine-Support-Print
    ThePankeyEngine-Support-Reflection
    ThePankeyEngine-Support-Serialization
    ThePankeyEngine-Support-Thread
    ThePankeyEngine-Support-Math
)

pankey_level(
    ThePankeyEngine_Level_Event

    ThePankeyEngine-Event-Map
    ThePankeyEngine-Event-Policy
)

pankey_level(
    ThePankeyEngine_Level_Runtime

    ThePankeyEngine-Runtime-List
    ThePankeyEngine-Runtime-Map
    ThePankeyEngine-Runtime-Policy
)

pankey_level(
    ThePankeyEngine_Level_System

    ThePankeyEngine-System-Application-Holder
    ThePankeyEngine-System-Application-Object
    ThePankeyEngine-System-Application-Policy
    ThePankeyEngine-System-ECS
)

# pankey_level(
#     ThePankeyEngine_Level_Library

#     ThePankeyEngine-Library-AI
#     ThePankeyEngine-Library-File
#     ThePankeyEngine-Library-IO
#     ThePankeyEngine-Library-Llama
#     ThePankeyEngine-Library-Network
#     ThePankeyEngine-Library-Render
#     ThePankeyEngine-Library-Tools
# )

# ============================================================
# Dependency Order
# ============================================================

pankey_dependency(
    ThePankeyEngine_Level_Utility
    ThePankeyEngine_Level_Meta
    ThePankeyEngine_Level_Memory
    ThePankeyEngine_Level_Ownership
    ThePankeyEngine_Level_DataStructure
    ThePankeyEngine_Level_Type
    ThePankeyEngine_Level_Support
    ThePankeyEngine_Level_Event
    ThePankeyEngine_Level_Runtime
    ThePankeyEngine_Level_System
    # ThePankeyEngine_Level_Library
)