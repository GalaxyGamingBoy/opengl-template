include(FetchContent)
cmake_minimum_required(VERSION 3.1...3.26)

project(
  GLFWTemplate
  VERSION 1.0
  LANGUAGES CXX)

FetchContent_Declare(
  glfw
  GIT_REPOSITORY https://github.com/glfw/glfw.git
  GIT_TAG        master
)
FetchContent_MakeAvailable(glfw)

# add_library(MyLibExample simple_lib.cpp simple_lib.hpp)
find_package(glfw)
#target_link_libraries(GLFWTemplate PRIVATE MyLibExample)
add_executable(GLFWTemplate src/main.cpp)
target_link_libraries(GLFWTemplate PRIVATE glfw)