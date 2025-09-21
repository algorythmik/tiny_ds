#pragma once
#include <initializer_list>
#include <iostream>
#include <stdexcept>
#include <type_traits>
#include <vector>
template <typename T, typename U>
using matrix_value_t = typename std::common_type<T, U>::type;

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

  template <typename U>
  Matrix(const Matrix<U> &other)
      : rows_{other.rows()}, cols_{other.cols()},
        data_(other.rows() * other.cols()) {
    for (size_t i = 0; i < rows_; ++i)
      for (size_t j = 0; j < cols_; ++j)
        (*this)(i, j) = static_cast<T>(other(i, j));
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
  // TODO: add broadcasting when other is (row, 1) or (1, col)
  // TODO: add broadcasing when other is (1, 1)
  // add broadcasting when other is scalaer
  // reshape does not mutate the object but return a new one
  Matrix reshape(size_t new_row, size_t new_col) {
    if (new_row * new_col != rows_ * cols_)
      throw std::runtime_error("The shape doesn't match");
    Matrix copy(*this);
    copy.rows_ = new_row;
    copy.cols_ = new_col;
    return copy;
  }
  // mutates the matrix
  Matrix &resize(size_t new_row, size_t new_col) {
    if (new_row * new_col != rows_ * cols_)
      throw std::runtime_error("The shape doesn't match");
    rows_ = new_row;
    cols_ = new_col;
    return (*this);
  }

  template <typename U>
  Matrix<matrix_value_t<T, U>> operator+(const Matrix<U> &other) {
    if (rows_ == other.rows_) {
      if (cols_ == other.cols_) {
        Matrix<matrix_value_t<T, U>> res = Matrix(rows_, cols_);
        for (auto i = 0; i < rows_; ++i)
          for (auto j = 0; j < cols_; ++j)
            res(i, j) = (*this)(i, j) + other(i, j);
        return res;
      } else if (cols_ == 1) {
        Matrix<matrix_value_t<T, U>> res = Matrix(rows_, other.cols_);
        for (auto i = 0; i < rows_; ++i)
          for (auto j = 0; j < other.cols_; ++j)
            res(i, j) = (*this)(i, 0) + other(i, j);
        return res;
      } else if (other.cols_ == 1) {
        // rows_ = other.rows_ > 1
        Matrix<matrix_value_t<T, U>> res = Matrix(rows_, cols_);
        for (auto i = 0; i < rows_; i++)
          for (auto j = 0; j < cols_; ++j)
            res(i, j) = (*this)(i, j) + other(i, 0);
        return res;
      }
    }
    if (cols_ == other.cols_) {
      if (rows_ == 1) {
        Matrix<matrix_value_t<T, U>> res = Matrix(other.rows_, cols_);
        for (auto i = 0; i < other.rows_; ++i)
          for (auto j = 0; j < cols_; ++j) {
            res(i, j) = (*this)(0, j) + other(i, j);
          }
        return res;
      } else if (other.rows_ == 1) {
        // rows_ = other.rows_ > 1
        Matrix<matrix_value_t<T, U>> res = Matrix(rows_, cols_);
        for (auto i = 0; i < rows_; i++)
          for (auto j = 0; j < cols_; ++j)
            res(i, j) = (*this)(i, j) + other(0, j);
        return res;
      }
    }
    if ((rows_ == 1) && (cols_ == 1)) {
      Matrix<matrix_value_t<T, U>> res = Matrix(other.rows_, other.cols_);
      for (auto i = 0; i < other.rows_; ++i)
        for (auto j = 0; j < other.cols_; ++j)
          res(i, j) = (*this)(0, 0) + other(i, j);
      return res;
    }
    if ((other.rows_ == 1) && (other.cols_ == 1)) {
      Matrix<matrix_value_t<T, U>> res = Matrix(rows_, cols_);
      for (auto i = 0; i < rows_; ++i)
        for (auto j = 0; j < cols_; ++j)
          res(i, j) = (*this)(i, j) + other(0, 0);
      return res;
    }
    throw std::runtime_error("Dimension mismatch or broadcasting not possible");
  }

  template <typename U>
  Matrix<matrix_value_t<T, U>> matmul(const Matrix<U> &other) const {
    if (cols_ != other.rows())
      throw std::out_of_range("matrix cols should be equal to matirx row");
    Matrix<matrix_value_t<T, U>> res = Matrix(rows_, other.cols());
    for (size_t i = 0; i < rows_; i++) {
      for (size_t j = 0; j < other.cols(); j++) {
        res(i, j) = 0;
        for (size_t k = 0; k < other.rows(); k++) {
          res(i, j) += (*this)(i, k) * other(k, j);
        }
      }
    }
    return res;
  }
  bool operator==(const Matrix &other) const {
    if ((rows_ != other.rows()) || (cols_ != other.cols()))
      return false;
    for (size_t i = 0; i < rows_; ++i)
      for (size_t j = 0; j < cols_; ++j) {
        if ((*this)(i, j) != other(i, j))
          return false;
      }
    return true;
  }

  Matrix<double> inverse() const {
    if (rows_ != cols_)
      throw std::runtime_error("Matrix must be square to invert");
    Matrix<double> A(*this);
    Matrix<double> I(rows_, rows_);
    // fill identity
    for (size_t i = 0; i < rows_; ++i)
      for (size_t j = 0; j < rows_; ++j)
        I(i, j) = (i == j) ? 1.0 : 0.0;
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
template <typename T, typename U>
Matrix<matrix_value_t<T, U>> matmul(const Matrix<T> &lhs,
                                    const Matrix<U> &other) {

  if (lhs.cols() != other.rows())
    throw std::out_of_range("matrix cols should be equal to matirx row");
  Matrix res = Matrix(lhs.rows(), other.cols());
  for (size_t i = 0; i < lhs.rows(); i++) {
    for (size_t j = 0; j < other.cols(); j++) {
      res(i, j) = 0;
      for (size_t k = 0; k < other.rows(); k++) {
        res(i, j) += lhs(i, k) * other(k, j);
      }
    }
  }
  return res;
}
