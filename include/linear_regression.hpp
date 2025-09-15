#pragma once
#include "matrix.hpp"
#include <optional>
#include <stdexcept>
class LinearRegression {
  bool fit_intercept_ = true;
  std::optional<Matrix<double>> theta_;

public:
  LinearRegression(bool fit_intercept) : fit_intercept_(false) {};
  LinearRegression &fit(const Matrix<double> &X, const Matrix<double> &y) {
    size_t x_n_rows = X.rows();
    size_t x_n_cols = X.cols();
    size_t y_n_rows = y.rows();
    size_t y_n_cols = y.cols();
    if (y_n_cols != 1)
      throw std::runtime_error("Y must have dimension nx1");
    if (y_n_rows != x_n_rows)
      throw std::runtime_error("X andy  must have the same number of rows");
    Matrix<double> XtX = X.transpose() * X;
    Matrix<double> inv_XtX = (XtX).inverse();
    theta_ = inv_XtX * X.transpose() * y;
    return *this;
  }
  Matrix<double> predict(const Matrix<double> &X) {
    if (!theta_)
      throw std::runtime_error("Model not fitted yet!");

    return X * theta_.value();
  }
  Matrix<double> get_coeffs() const {

    if (!theta_)
      throw std::runtime_error("Model not fitted yet!");

    return theta_.value();
  }
};
