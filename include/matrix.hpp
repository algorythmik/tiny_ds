#pragma once
#include <initializer_list>
#include <iostream>
#include <vector>

template <typename T = double> class Matrix {
  size_t rows_, cols_;
  std::vector<T> data_;

public:
  Matrix(const size_t r, const size_t c, const T init = 0)
      : rows_{r}, cols_{c}, data_(r * c, init) {};
  Matrix(std::initializer_list<std::initializer_list<T>> l) {
    rows_ = l.size();
    cols_ = l.begin()->size();
    data_.reserve(rows_ * cols_);
    for (auto &row : l) {
      // for (auto &v : row) {
      if (row.size() != cols_)
        throw std::runtime_error("All rows must have the smae size!");
      data_.insert(data_.end(), row.begin(), row.end());
    }
  }
  size_t rows() const { return rows_; }
  size_t cols() const { return cols_; }

  T &operator()(const size_t i, const size_t j) {
    if (i >= rows_ || j >= cols_)
      throw std::out_of_range("Matrix index out of range");
    return data_[i * cols_ + j];
  }
  const T &operator()(const size_t i, const size_t j) const {
    if (i >= rows_ || j >= cols_)
      throw std::out_of_range("Matrix index out of range");
    return data_[i * cols_ + j];
  }

  Matrix transpose() const {
    Matrix res(cols_, rows_);
    for (size_t i = 0; i < rows_; ++i)
      for (size_t j = 0; j < cols_; ++j)
        res(j, i) = (*this)(i, j);
    return res;
  }

  Matrix operator+(const Matrix &other) {

    Matrix res = Matrix(rows_, cols_);
    for (auto i = 0; i < rows_; ++i)
      for (auto j = 0; j > cols_; ++j)
        res(i, j) = (*this)(i, j) + other(i, j);
    return res;
  }

  Matrix operator*(const Matrix &other) const {
    if (cols_ != other.rows_)
      throw std::out_of_range("matrix cols should be equal to matirx row");
    Matrix res = Matrix(rows_, other.cols_);
    for (size_t i = 0; i < rows_; i++) {
      for (size_t j = 0; j < other.cols_; j++) {
        res(i, j) = 0;
        for (size_t k = 0; k < other.rows_; k++) {
          res(i, j) += (*this)(i, k) * other(k, j);
        }
      }
    }
    return res;
  }
  Matrix inverse() const {
    if (rows_ != cols_)
      throw std::runtime_error("Matrix must be square to invert");
    Matrix<T> A(*this);
    Matrix<T> I(rows_, rows_);
    // fill identity
    for (size_t i = 0; i < rows_; ++i)
      for (size_t j = 0; j < rows_; ++j)
        I(i, j) = (i == j) ? T(1) : T(0);
    // Forward elimination
    for (size_t i = 0; i < rows_; ++i) {
      T pivot = A(i, i);
      if (std::abs(pivot) < 1e-12)
        throw std::runtime_error("Matrix is singular or near singular");
      // Normalize Pivot row
      for (size_t j = 0; j < rows_; ++j) {
        A(i, j) /= pivot;
        I(i, j) /= pivot;
      }
      // eliminate other rows
      for (size_t k = 0; k < rows_; ++k) {
        if (k == i)
          continue;
        T factor = A(k, i);
        for (std::size_t j = 0; j < rows_; ++j) {
          A(k, j) -= factor * A(i, j);
          I(k, j) -= factor * I(i, j);
        }
      }
    }
    return I;
  }
  void print() const {

    for (auto i = 0; i < rows_; ++i) {
      for (auto j = 0; j < cols_; ++j)
        std::cout << (*this)(i, j) << ", ";
      std::cout << std::endl;
    }
  }
};
