include(FetchContent)
cmake_minimum_required(VERSION 3.1...3.26)

project(
  OpenGLTemplate
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
find_package(OpenGl REQUIRED)
find_package(GLEW REQUIRED)

add_executable(OpenGLTemplate src/main.cpp)
target_link_libraries(OpenGLTemplate ${OPENGL_LIBRARIES} glfw OpenGl GLEW)
