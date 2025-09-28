## Overview

In this step, we enhanced our custom Matrix class to support advanced operations commonly found in numerical computing libraries like NumPy. The focus was on implementing elementwise operations with broadcasting. We also updated the LinearRegression implementation to use the new matrix functionality and expanded our test coverage.

## Key Concepts Learned

### Elementwise Operations with Broadcasting

#### What is Broadcasting?

Broadcasting allows elementwise operations (like addition and multiplication) between matrices of different shapes, as long as their dimensions are compatible (e.g., adding a row vector to each row of a matrix).

#### How was it implemented?

Added a generic elementwise method that accepts a binary operation and applies it with broadcasting rules.
Overloaded operator+ and operator* to use broadcasting, making syntax intuitive (A + B, A * B).

### Generalized Matrix Multiplication (matmul)

Introduced a matmul method for standard matrix multiplication (dot product), separate from elementwise multiplication.
Overloaded usage in the code so that A \* B performs elementwise multiplication (with broadcasting), while A.matmul(B) performs matrix multiplication.

### Reshape and Resize

Added reshape method to return a new matrix with a different shape (without changing the data order).
Added resize method to mutate the matrix in-place to the new shape (also without changing the data order).

### Improved Type Flexibility

Used C++ template metaprogramming (std::common_type) to allow operations between matrices of different numeric types (e.g., Matrix<int> + Matrix<double>).

### More Robust and Clear Matrix Inversion
Changed the matrix inversion to always return Matrix<double>, ensuring numerical stability.
Improved error handling and made sure only square matrices can be inverted.
Code Quality and Usability Improvements
Constructor accepting different matrix types: Now you can easily convert between, e.g., Matrix<int> and Matrix<double>.
Better error messages for dimension mismatches and invalid operations.
Test Coverage: Comprehensive unit tests for broadcasting, elementwise operations, matrix multiplication, reshape, and resize.
Example Usage
C++
Matrix<double> a = {{1, 1}};
Matrix<int> b = {{1, 0}, {0, 1}};
auto result = a + b; // Broadcasting: result is {{2, 1}, {1, 2}}

Matrix<double> c = {{1, 2}, {3, 4}};
Matrix<double> d = {{2, 0}, {1, 2}};
auto matmul_result = c.matmul(d); // Standard matrix multiplication

auto reshaped = c.reshape(1, 4); // Reshapes 2x2 to 1x4
Summary
This step established a solid foundation for numerical computations in C++, mirroring features from popular data science libraries. By learning and implementing broadcasting, advanced operator overloading, and robust matrix operations, you are now equipped to build more powerful mathematical models and algorithms in C++.
