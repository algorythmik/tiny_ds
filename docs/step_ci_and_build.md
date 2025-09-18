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

# Continuous Integration with GitHub Actions

We use **GitHub Actions** to automatically build and test our C++ project on every commit and pull request against main.

## How it works

1. **Trigger**: The workflow runs on every push to any branch and on pull requests targeting `main`.
2. **Checkout**: The code is cloned into a fresh virtual machine runner.
3. **Install dependencies**: CMake is installed using the `lukka/get-cmake` action. GoogleTest is handled by `FetchContent` in `CMakeLists.txt`.
4. **Configure**: CMake generates the build system in the `build/` folder.
5. **Build**: The project is compiled using all available CPU cores.
6. **Test**: All unit tests (e.g., `matrix_tests`) are executed using `ctest`. Failures are reported immediately.

This ensures that every change is automatically verified, keeping the project reliable and reducing the risk of broken code being merged.
