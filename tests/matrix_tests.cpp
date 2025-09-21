#include "matrix.hpp"
#include <gtest/gtest.h>
TEST(MatrixTest, DefaultConstructor) {
  Matrix<double> m(2, 3);
  EXPECT_EQ(m.rows(), 2);
  EXPECT_EQ(m.cols(), 3);
}

TEST(MatrixTest, ListInitializer) {
  Matrix<double> m = {{1, 2}, {3, 4}};
  EXPECT_EQ(m(0, 0), 1);
  EXPECT_EQ(m(0, 1), 2);
  EXPECT_EQ(m(1, 0), 3);
  EXPECT_EQ(m(1, 1), 4);
}

TEST(MatrixTest, Equality) {
  Matrix<double> a = {{1, 0}, {0, 1}};
  Matrix<double> b = {{1, 0}, {0, 1}};
  EXPECT_EQ(a == b, true);

  Matrix<double> c = {{1, 0}, {1, 1}};
  EXPECT_EQ(a == c, false);
  Matrix<double> d = {{1}, {2}};
  EXPECT_EQ(a == d, false);
}

TEST(MatrixTest, Addition) {
  Matrix<double> a = {{1, 0}, {0, 1}};
  Matrix<double> b = {{1, 0}, {0, 1}};
  Matrix<double> res = {{2, 0}, {0, 2}};
  EXPECT_EQ(a + b, res);
}
TEST(MatrixTest, AdditionBroadcast) {
  Matrix<double> a = {{1, 1}};
  Matrix<double> b = {{1, 0}, {0, 1}};
  Matrix<double> res = {{2, 1}, {1, 2}};
  EXPECT_EQ(a + b, res);
  a = {{1}, {1}};
  b = {{1, 0}, {0, 1}};
  res = {{2, 1}, {1, 2}};
  EXPECT_EQ(a + b, res);
  b = {{1}, {1}};
  a = {{1, 0}, {0, 1}};
  res = {{2, 1}, {1, 2}};
  EXPECT_EQ(a + b, res);
  a = {{1}};
  b = {{1, 0}, {0, 1}};
  res = {{2, 1}, {1, 2}};
  EXPECT_EQ(a + b, res);
}
TEST(MatrixTest, Transpose) {
  Matrix<double> m = {{1, 2}, {3, 4}};
  auto res = m.transpose();
  Matrix<double> ex = {{1, 3}, {2, 4}};
  EXPECT_EQ(res, ex);
}

TEST(MatrixTest, Inverse) {
  Matrix<double> m = {{1, 0}, {0, 1}};
  auto res = m.inverse();
  EXPECT_EQ(m, res);
  Matrix<double> a = {{-1, 3.0 / 2}, {1, -1}};
  Matrix<double> b = {{2, 3}, {2, 2}};
  EXPECT_EQ(a.inverse(), b);
  EXPECT_EQ(b.inverse(), a);
}

TEST(MatrixTest, Multiply) {
  Matrix<double> identity = {{1, 0}, {0, 1}};
  Matrix<double> a = {{-1, 3.0 / 2}, {1, -1}};
  Matrix<double> b = {{2, 3}, {2, 2}};
  EXPECT_EQ(a.matmul(b), identity);
}
TEST(MatrixTest, Reshape) {
  Matrix<double> mat = {{1, 2}, {3, 4}, {5, 6}};
  Matrix<double> expected = {{1, 2, 3}, {4, 5, 6}};
  EXPECT_EQ(mat.reshape(2, 3), expected);
}
TEST(MatrixTest, Resize) {
  Matrix<double> mat = {{1, 2}, {3, 4}, {5, 6}};
  Matrix<double> expected = {{1, 2, 3}, {4, 5, 6}};
  EXPECT_EQ(mat.resize(2, 3), expected);
  // verifying that the matrix is mutated
  EXPECT_EQ(mat, expected);
}
