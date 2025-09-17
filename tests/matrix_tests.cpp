#include "matrix.hpp"
#include <gtest/gtest.h>
TEST(MatrixTest, DefaultConstructor) {
  Matrix<double> m(2, 3);
  EXPECT_EQ(m.rows(), 2);
  EXPECT_EQ(m.cols(), 3);
}
