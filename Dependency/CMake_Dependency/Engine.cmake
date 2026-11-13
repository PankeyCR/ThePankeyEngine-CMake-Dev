# Engine.cmake

pankey_load(pankey_utility          Engine_Utility.cmake)
pankey_load(pankey_meta             Engine_Meta.cmake)
pankey_load(pankey_memory           Engine_Memory.cmake)
pankey_load(pankey_ownership        Engine_Ownership.cmake)
pankey_load(pankey_datastructure    Engine_DataStructure.cmake)
pankey_load(pankey_type             Engine_Type.cmake)
pankey_load(pankey_support          Engine_Support.cmake)
pankey_load(pankey_event            Engine_Event.cmake)
pankey_load(pankey_runtime          Engine_Runtime.cmake)
pankey_load(pankey_system           Engine_System.cmake)
pankey_load(pankey_library          Engine_Library.cmake)

pankey_dependency(
    pankey_utility
    pankey_meta         
    pankey_memory       
    pankey_ownership    
    pankey_datastructure
    pankey_type         
    pankey_support      
    pankey_event        
    pankey_runtime
    pankey_system
    pankey_library
)