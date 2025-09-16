# Adding a CMakeLists.txt

In this step, CMakeLists.txt is added to configure cmake to build and test the project.

In order to build

```bash
mkdir build
cd build
cmake ..
cmkae --buid .
```

To run:

```bash
./build/main
```
# Adding GoogleTest to the project


[GoogleTest](https://github.com/google/googletest) is Google’s open-source C++ testing framework.
It lets you write unit tests quickly using simple macros like `TEST()` and `EXPECT_EQ()`, then run them all from one executable.

Key features:
- **Header-only style macros**: write tests directly in `.cpp` files.
- **Built-in test runner**: `gtest_main` supplies a ready-to-use `main()` so you don’t have to.
- **Rich assertions**: `EXPECT_EQ`, `EXPECT_THROW`, `ASSERT_TRUE`, etc.
- **Automatic discovery and reporting**: no need to register tests manually.
- **Integrates easily with CMake** and `ctest`.

It’s widely used in the C++ community and is a de-facto standard for writing unit tests.

