# Windows_File.cmake

pankey_level(
    ThePankeyEngine_Level_File_Windows_Base

    ThePankeyEngine-Utility-Base
    ThePankeyEngine-Memory-Allocator
    ThePankeyEngine-DataStructure-Array
    ThePankeyEngine-Type-Array
    ThePankeyEngine-Support-File
)

pankey_level(
    ThePankeyEngine_Level_File_Windows

    ThePankeyEngine-Support-File-Windows
)

pankey_dependency(
    ThePankeyEngine_Level_File_Windows_Base
    ThePankeyEngine_Level_File_Windows
)