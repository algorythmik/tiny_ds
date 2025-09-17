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

TEST(MatrixTest, Transpose) {
  Matrix<double> m = {{1, 2}, {3, 4}};
  auto res = m.transpose();
  Matrix<double> ex = {{1, 3}, {2, 4}};
  for (auto i = 0; i < 2; ++i)
    for (auto j = 0; j < 2; ++j)
      EXPECT_EQ(res(i, j), ex(i, j));
}

TEST(MatrixTest, Inverse) {
  Matrix<double> m = {{1, 0}, {0, 1}};
  auto res = m.inverse();
  for (auto i = 0; i < 2; ++i)
    for (auto j = 0; j < 2; ++j)
      EXPECT_EQ(res(i, j), m(i, j));
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
