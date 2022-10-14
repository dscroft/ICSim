cmake_minimum_required (VERSION 3.11)
set(CMAKE_CXX_STANDARD 17)

# --- Fetch FTXUI --------------------------------------------------------------
include(FetchContent)

set(FETCHCONTENT_UPDATES_DISCONNECTED TRUE)
FetchContent_Declare(ftxui
  GIT_REPOSITORY https://github.com/ArthurSonzogni/ftxui
  GIT_TAG v3.0.0
)

FetchContent_GetProperties(ftxui)
if(NOT ftxui_POPULATED)
  FetchContent_Populate(ftxui)
  add_subdirectory(${ftxui_SOURCE_DIR} ${ftxui_BINARY_DIR} EXCLUDE_FROM_ALL)
endif()
# ------------------------------------------------------------------------------

project(icsim
  LANGUAGES C CXX
  VERSION 1.0.0
)

add_executable( controls controls.c )
target_include_directories( controls 
  PRIVATE /usr/include/SDL2 
)
target_link_libraries( controls
  PRIVATE SDL2 
  PRIVATE SDL2_image
)

add_executable( icsim icsim.c )
target_include_directories( icsim 
  PRIVATE /usr/include/SDL2 
)
target_link_libraries( icsim
  PRIVATE SDL2 
  PRIVATE SDL2_image
)

add_executable( controls_terminal controls_terminal.cpp )
target_link_libraries( controls_terminal
  PRIVATE ftxui::screen
  PRIVATE ftxui::dom
  PRIVATE ftxui::component
)

add_executable( icsim_terminal icsim_terminal.cpp )
target_link_libraries( icsim_terminal
  PRIVATE ftxui::screen
  PRIVATE ftxui::dom
  PRIVATE ftxui::component
)


