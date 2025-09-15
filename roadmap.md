
# MiniFrame — Step-by-Step C++ Learning Roadmap

A practical project to learn modern C++ by building a tiny DataFrame / numeric library and linear models.
Start with a minimal MVP and grow it step by step.

---

## ✅ MVP — Minimal Working Version
**Goal:**
Implement a simple `Matrix<double>` class, a tiny CSV loader, a Gaussian elimination solver, and a `linear_regression::fit()` function using the normal equation.

**What you’ll learn:**
- Classes & RAII
- `std::vector`
- Stream I/O
- Exceptions
- Basic algorithms & small linear algebra

---

## 🗺 Roadmap — Step-by-Step Progression

### Step 1 — MVP (done)
- Learn: basics of classes, RAII, STL containers, building & running.
- Deliverable: `Matrix`, CSV loader, linear regression.
- Stretch: add command-line CSV reading + simple evaluation (MSE).

### Step 2 — Project Hygiene, Build System & Tests
- Learn: CMake, unit testing with Google Test, `clang-tidy`, `clang-format`.
- Deliverable: `CMakeLists.txt`, tests for `Matrix` ops & `gaussian_solve`.
- Stretch: GitHub Actions CI that runs tests on pushes.

### Step 3 — API Design & Idiomatic C++
- Learn: good API design, iterators, `begin()/end()`, range-for, `const` correctness.
- Deliverable: add `Matrix::begin()` iterators, `at()` vs `operator()`, `operator==`.
- Stretch: add `span`-like view for rows (C++20 `std::span`).

### Step 4 — Performance Basics
- Learn: complexity, cache friendliness, loop order, `reserve`, move semantics.
- Deliverable: optimize multiplication (blocking / k-first), add `-O3` benchmarks.
- Stretch: add simple microbenchmark harness (timing runs).

### Step 5 — Generic and Header-Only Design
- Learn: templates, `Matrix<T>`, header-only API, compile-time checks.
- Deliverable: make the library header-only, templated on `T`, document API.
- Stretch: add explicit instantiations or a small tests matrix types (float/double).

### Step 6 — Numerical Stability & Linear Algebra Improvements
- Learn: numerical considerations, pivoting, conditioning; implement more robust solvers (QR, SVD optionally).
- Deliverable: add QR solver (Householder) or call into LAPACK (via CMake find_package).
- Stretch: implement Tikhonov (ridge) regularization.

### Step 7 — Modern C++20 Features
- Learn: `concepts`, `ranges`, `constexpr` improvements, `std::span`.
- Deliverable: add `concept` constraints to templates, use ranges for CSV parsing.
- Stretch: create `constexpr` small-matrix operations where possible.

### Step 8 — Expression Templates / Lazy Evaluation
- Learn: eliminate temporaries, CRTP, expression templates pattern (like Eigen).
- Deliverable: implement a small expression framework so `A + B * C` doesn’t allocate intermediate matrices.
- Stretch: extend to lazy evaluation for chained operations.

### Step 9 — Concurrency & Parallel Algorithms
- Learn: `std::thread`, `std::async`, `std::execution` policies, thread-safety concerns.
- Deliverable: parallel matrix multiply and parallel CSV loading.
- Stretch: benchmark single-thread vs multi-thread.

### Step 10 — Tooling for Robustness
- Learn: sanitizers (ASan/UBSan), valgrind, profiling with `perf`/instruments.
- Deliverable: CI job that runs sanitizers, add performance regression tests.
- Stretch: add static analysis to CI (e.g., clang-tidy).

### Step 11 — Packaging & Distribution
- Learn: packaging strategies (header-only tarball, CMake export), semantic versioning.
- Deliverable: publish minimal package (release artifacts), doc generation (Doxygen).
- Stretch: set up `vcpkg` or `conan` packaging.

### Step 12 — Advanced: GPU / Vectorization / Metaprogramming
- Learn: SIMD intrinsics, OpenMP, CUDA or SYCL integration, advanced template metaprogramming.
- Deliverable: add a fast SIMD path or CUDA kernel for gemm; optional `constexpr` expression tuning.
- Stretch: integrate with BLAS (OpenBLAS/Intel MKL).

---

## 📝 How I’ll Guide You
For each step:
1. Show minimal code changes required, and **why** they’re written that way.
2. Point out common bugs and pitfalls.
3. Provide small exercises to solidify the concept.
4. Optionally provide test cases and performance checks.
