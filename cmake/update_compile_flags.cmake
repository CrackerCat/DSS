
# This function appends the given compile flags to a list of source files

function (UPDATE_SOURCE_FILES_COMPILE_FLAGS SourceFiles CompileFlags)
   foreach (filename ${SourceFiles})
      get_source_file_property (OLD_FLAGS ${filename} COMPILE_FLAGS)

      if (${OLD_FLAGS} STREQUAL "NOTFOUND")
         set_source_files_properties (${filename} PROPERTIES COMPILE_FLAGS "${CompileFlags}")
      else ()
         set_source_files_properties (${filename} PROPERTIES COMPILE_FLAGS "${OLD_FLAGS} ${CompileFlags}")
      endif ()
   endforeach (filename)   
endfunction (UPDATE_SOURCE_FILES_COMPILE_FLAGS)



# These functions append the given compile flags to all subsequent targets of the indicated configuration

  # All configs
  
function (UPDATE_COMPILE_FLAGS CompileFlags)
   add_compile_options ("${CompileFlags}") 
endfunction (UPDATE_COMPILE_FLAGS)

  # Just release config
  
function (UPDATE_RELEASE_COMPILE_FLAGS CompileFlags)
   add_compile_options ("$<$<CONFIG:RELEASE>:${CompileFlags}>")
endfunction (UPDATE_RELEASE_COMPILE_FLAGS)

  # Just relwithdebuginfo config
  
function (UPDATE_RELWITHDEBUGINFO_COMPILE_FLAGS CompileFlags)
   add_compile_options ("$<$<CONFIG:RELWITHDEBUGINFO>:${CompileFlags}>")
endfunction (UPDATE_RELWITHDEBUGINFO_COMPILE_FLAGS)

  # Just debug config

function (UPDATE_DEBUG_COMPILE_FLAGS LinkFlags)
   add_compile_options ("$<$<CONFIG:DEBUG>:${CompileFlags}>")
endfunction (UPDATE_DEBUG_COMPILE_FLAGS)




# These functions append the given link flags to all subsequent targets of the indicated configuration

  # All configs
  
function (UPDATE_LINK_FLAGS LinkFlags)
   set (CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${LinkFlags}" PARENT_SCOPE)
endfunction (UPDATE_LINK_FLAGS)

  # Just release config
  
function (UPDATE_RELEASE_LINK_FLAGS LinkFlags)
   set (CMAKE_EXE_LINKER_FLAGS_RELEASE "${CMAKE_EXE_LINKER_FLAGS_RELEASE} ${LinkFlags}" PARENT_SCOPE)
endfunction (UPDATE_RELEASE_LINK_FLAGS)

  # Just relwithdebuginfo config
  
function (UPDATE_RELWITHDEBUGINFO_LINK_FLAGS LinkFlags)
   set (CMAKE_EXE_LINKER_FLAGS_RELWITHDEBUGINFO "${CMAKE_EXE_LINKER_FLAGS_RELWITHDEBUGINFO} ${LinkFlags}" PARENT_SCOPE)
endfunction (UPDATE_RELWITHDEBUGINFO_LINK_FLAGS)

  # Just debug config

function (UPDATE_DEBUG_LINK_FLAGS LinkFlags)
   set (CMAKE_EXE_LINKER_FLAGS_DEBUG "${CMAKE_EXE_LINKER_FLAGS_DEBUG} ${LinkFlags}" PARENT_SCOPE)
endfunction (UPDATE_DEBUG_LINK_FLAGS)
