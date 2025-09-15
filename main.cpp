#include "include/matrix.hpp"
#include "include/csv_loader.hpp"
#include "include/linear_regression.hpp"
#include <iostream>
int main() {
  Matrix<double> A(3, 3, 5);
  A(1, 2) = 0;
  A.print();
  Matrix<double> T = {{1, 2}, {3, 4}};
  T.print();
  std::cout << "After transposing" << std::endl;
  A.transpose().print();
  Matrix<int> C = {{1, 0}, {0, 1}};
  Matrix<int> D = {{1, 2}, {3, 4}};
  Matrix<int> res = C * D;
  res.print();
  Matrix<double> mat = load_csv("./data/test.csv", false);
  std::cout << "Reading from the file" << std::endl;
  mat.print();
  std::cout << "Testing inversion" << std::endl;
  Matrix<int> C_inv = C.inverse();
  C_inv.print();
  std::cout << "Testing a new matrix of int" << std::endl;
  Matrix<int> X(2, 2);
  X(0, 0) = 2;
  X(0, 1) = 3;
  X(1, 0) = 1;
  X(1, 1) = 2;

  X.inverse().print();
  std::cout << "Now testing linear regression class" << std::endl;
  Matrix<double> Xy = load_csv("./data/lr.csv", false);
  LinearRegression lr = LinearRegression(false);
  size_t n = Xy.rows();
  size_t m = Xy.cols();
  Matrix<double> XX(n, m - 1);
  Matrix<double> y(n, 1);
  for (size_t i = 0; i < n; ++i) {
    for (size_t j = 0; j < m - 1; ++j)
      XX(i, j) = Xy(i, j);

    y(i, 0) = Xy(i, m - 1);
  }
  Xy.print();
  std::cout << "XX: " << std::endl;
  XX.print();
  std::cout << "y: " << std::endl;
  y.print();

  lr.fit(XX, y);
  lr.get_coeffs().print();
}
