# Full_Engine.cmake

# ============================================================
# Repository
# ============================================================

pankey_repository(
    ThePankeyEngine-Utility-Base
    https://github.com/PankeyCR/ThePankeyEngine-Utility-Base
)

pankey_repository(
    ThePankeyEngine-Utility-Log
    https://github.com/PankeyCR/ThePankeyEngine-Utility-Log
)

pankey_repository(
    ThePankeyEngine-Utility-Test
    https://github.com/PankeyCR/ThePankeyEngine-Utility-Test
)

pankey_repository(
    ThePankeyEngine-Meta-Reflection
    https://github.com/PankeyCR/ThePankeyEngine-Meta-Reflection
)

pankey_repository(
    ThePankeyEngine-Meta-Transform
    https://github.com/PankeyCR/ThePankeyEngine-Meta-Transform
)

pankey_repository(
    ThePankeyEngine-Memory-Allocator
    https://github.com/PankeyCR/ThePankeyEngine-Memory-Allocator
)

pankey_repository(
    ThePankeyEngine-Ownership-Holder
    https://github.com/PankeyCR/ThePankeyEngine-Ownership-Holder
)

pankey_repository(
    ThePankeyEngine-Ownership-Object
    https://github.com/PankeyCR/ThePankeyEngine-Ownership-Object
)

pankey_repository(
    ThePankeyEngine-DataStructure-Array
    https://github.com/PankeyCR/ThePankeyEngine-DataStructure-Array
)

pankey_repository(
    ThePankeyEngine-DataStructure-List
    https://github.com/PankeyCR/ThePankeyEngine-DataStructure-List
)

pankey_repository(
    ThePankeyEngine-DataStructure-Map
    https://github.com/PankeyCR/ThePankeyEngine-DataStructure-Map
)

pankey_repository(
    ThePankeyEngine-Type-Array
    https://github.com/PankeyCR/ThePankeyEngine-Type-Array
)

pankey_repository(
    ThePankeyEngine-Type-Invoke
    https://github.com/PankeyCR/ThePankeyEngine-Type-Invoke
)

pankey_repository(
    ThePankeyEngine-Type-List
    https://github.com/PankeyCR/ThePankeyEngine-Type-List
)

pankey_repository(
    ThePankeyEngine-Type-Map
    https://github.com/PankeyCR/ThePankeyEngine-Type-Map
)

pankey_repository(
    ThePankeyEngine-Type-Color
    https://github.com/PankeyCR/ThePankeyEngine-Type-Color
)

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

pankey_repository(
    ThePankeyEngine-Event-Map
    https://github.com/PankeyCR/ThePankeyEngine-Event-Map
)

pankey_repository(
    ThePankeyEngine-Event-Policy
    https://github.com/PankeyCR/ThePankeyEngine-Event-Policy
)

pankey_repository(
    ThePankeyEngine-Runtime-List
    https://github.com/PankeyCR/ThePankeyEngine-Runtime-List
)

pankey_repository(
    ThePankeyEngine-Runtime-Map
    https://github.com/PankeyCR/ThePankeyEngine-Runtime-Map
)

pankey_repository(
    ThePankeyEngine-Runtime-Policy
    https://github.com/PankeyCR/ThePankeyEngine-Runtime-Policy
)

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

pankey_repository(
    ThePankeyEngine-Library-AI
    https://github.com/PankeyCR/ThePankeyEngine-Library-AI
)

pankey_repository(
    ThePankeyEngine-Library-File
    https://github.com/PankeyCR/ThePankeyEngine-Library-File
)

pankey_repository(
    ThePankeyEngine-Library-IO
    https://github.com/PankeyCR/ThePankeyEngine-Library-IO
)

pankey_repository(
    ThePankeyEngine-Library-Network
    https://github.com/PankeyCR/ThePankeyEngine-Library-Network
)

pankey_repository(
    ThePankeyEngine-Library-Render
    https://github.com/PankeyCR/ThePankeyEngine-Library-Render
)

pankey_repository(
    ThePankeyEngine-Library-Tools
    https://github.com/PankeyCR/ThePankeyEngine-Library-Tools
)

# ============================================================
# Levels
# ============================================================

pankey_level(
    ThePankeyEngine_Level_Utility

    ThePankeyEngine-Utility-Base
    ThePankeyEngine-Utility-Log
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
    ThePankeyEngine-Type-Color
)

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

    # ThePankeyEngine-System-Application-Holder
    ThePankeyEngine-System-Application-Object
    ThePankeyEngine-System-Application-Policy
    ThePankeyEngine-System-ECS
    ThePankeyEngine-System-Hardware
)

pankey_level(
    ThePankeyEngine_Level_Library

    ThePankeyEngine-Library-AI
    ThePankeyEngine-Library-File
    ThePankeyEngine-Library-IO
    ThePankeyEngine-Library-Network
    ThePankeyEngine-Library-Render
    ThePankeyEngine-Library-Tools
)

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
    ThePankeyEngine_Level_Library
)

# end Repo_Engine.cmake
