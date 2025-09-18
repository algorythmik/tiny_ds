cmake_minimum_required(VERSION 3.15)
project(TinyDS VERSION 0.1.0 LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
include_directories(include)
add_executable(main main.cpp)

# --- GoogleTest ---
include(FetchContent)
FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/refs/heads/main.zip
)
FetchContent_MakeAvailable(googletest)

enable_testing()

# --- Your tests ---
add_executable(matrix_tests tests/matrix_tests.cpp)
target_include_directories(matrix_tests PRIVATE ${CMAKE_SOURCE_DIR}/include)
target_link_libraries(matrix_tests gtest_main)

include(GoogleTest)
gtest_discover_tests(matrix_tests)
