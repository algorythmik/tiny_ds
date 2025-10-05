#pragma once
#include <cstddef>
#include <initializer_list>
#include <iostream>
#include <iterator>
#include <numeric>
#include <ostream>
#include <ranges>
#include <stdexcept>
#include <string>
#include <type_traits>
#include <vector>
template <typename T, typename U>
using matrix_value_t = typename std::common_type<T, U>::type;

struct all_t {};
constexpr all_t all{};
struct range {
  size_t start;
  size_t end;
};
template <typename T> class ViewIterator {
  T *ptr_;
  size_t stride_, i_, j_, cols_;

public:
  using iterator_category = std::forward_iterator_tag;
  using value_type = T;
  using difference_type = std::ptrdiff_t;
  using pointer = T *;
  using reference = T &;
  ViewIterator(T *data, size_t stride, size_t cols, size_t i, size_t j)
      : ptr_(data), stride_(stride), cols_(cols), i_(i), j_(j) {
  };
  reference operator*() { return ptr_[i_ * stride_ + j_]; }
  pointer operator->() { return &(**this); }
  ViewIterator &operator++() {
    ++j_;
    if (j_ >= cols_) {
      j_ = 0;
      i_++;
    }

    return (*this);
  }
  ViewIterator operator++(int) {
    ViewIterator tmp = (*this);
    ++(*this);
    return tmp;
  }
  bool operator==(const ViewIterator &other) const {
    return i_ == other.i_ && j_ == other.j_;
  }
};

template <typename T> class MatrixView {
  T *data_;
  size_t rows_, cols_, stride_;

public:
  MatrixView(T *data, size_t rows, size_t cols, size_t stride,
             size_t offset = 0)
      : data_{data}, rows_{rows}, cols_{cols}, stride_{stride} {}
  size_t rows() const { return rows_; }
  size_t cols() const { return cols_; }
  T &operator()(size_t i, size_t j) { return data_[i * stride_ + j]; }
  const T &operator()(size_t i, size_t j) const {
    return data_[i * stride_ + j];
  }
  void print() {
    for (size_t i : std::views::iota(size_t(0), rows_))
      for (size_t j : std::views::iota(size_t(0), cols_))
        std::cout << (*this)(i, j) << ", ";
  }
  ViewIterator<T> begin() {
    return ViewIterator<T>(data_, stride_, cols_, 0, 0);
  }
  ViewIterator<T> end() {
    return ViewIterator<T>(data_, stride_, cols_, rows_, 0);
  }
};

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

  T *begin() { return data_.data(); }
  T *end() { return data_.data() + data_.size(); }
  const T *begin() const { return data_.data(); }
  const T *end() const { return data_.data() + data_.size(); }

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

  template <typename U, typename F>
  Matrix<matrix_value_t<T, U>> elementwise(const Matrix<U> &other, F op) {

    const size_t res_rows = std::max(rows_, other.rows());
    const size_t res_cols = std::max(cols_, other.cols());

    auto dim_pass = [](size_t a, size_t b) {
      return a == b || a == 1 || b == 1;
    };

    if (!dim_pass(rows_, other.rows()) || !dim_pass(cols_, other.cols())) {
      throw std::runtime_error(
          "Dimension mismatch or broadcasting not possible");
    }

    Matrix<matrix_value_t<T, U>> res = Matrix(res_rows, res_cols);
    auto get_elem = [](const auto &m, size_t i, size_t j) -> const auto & {
      return m(i % m.rows(), j % m.cols());
    };
    for (size_t i = 0; i < res.rows(); ++i)
      for (size_t j = 0; j < res.cols(); ++j) {
        res(i, j) = static_cast<matrix_value_t<T, U>>(
            op(get_elem((*this), i, j), get_elem(other, i, j)));
      }

    return res;
  }

  template <typename U>
  Matrix<matrix_value_t<T, U>> operator+(const Matrix<U> &other) {
    return elementwise(other, [](auto a, auto b) { return a + b; });
  }

  template <typename U>
  Matrix<matrix_value_t<T, U>> operator*(const Matrix<U> &other) {
    return elementwise(other, [](auto a, auto b) { return a * b; });
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
  T sum() const { return std::accumulate(begin(), end(), T{}); }
  auto view(all_t, size_t col) {
    if (col > cols_)
      throw std::runtime_error("Column index must be less than" +
                               std::to_string(col));
    return MatrixView<T>(data_.data() + col, rows_, 1, cols_);
  }
  auto view(size_t row, all_t) {
    if (row > rows_)
      throw std::runtime_error("Row index must be less than" +
                               std::to_string(rows_));
    return MatrixView<T>(data_.data() + row * cols_, 1, cols_, 1);
  }

  auto view(range row_range, range col_range) {
    if ((row_range.start > rows_) || (row_range.end >= rows_) ||
        (col_range.end > cols_) || (col_range.start >= cols_))
      throw std::runtime_error("Ranges are must be less than boundaries");
    size_t offset = row_range.start * cols_ + col_range.start;
    size_t view_cols_ = col_range.end - col_range.start + 1;
    size_t view_rows_ = row_range.end - row_range.start + 1;
    return MatrixView<T>(data_.data() + offset, view_rows_, view_cols_, cols_);
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
