#pragma once
#include "matrix.hpp"
#include <fstream>
#include <sstream>

inline Matrix<double> load_csv(const std::string &path,
                               bool has_header = true) {
  std::ifstream in(path);
  if (!in)
    throw std::runtime_error("Cannot open cv file: " + path);
  std::string line;
  std::vector<std::vector<double>> rows;
  if (has_header && std::getline(in, line)) {
  }
  while (std::getline(in, line)) {
    if (line.empty())
      continue;
    std::stringstream ss(line);
    std::string cell;
    std::vector<double> row;
    while (std::getline(ss, cell, ','))
      row.push_back(std::stod(cell));

    rows.push_back(std::move(row));
  }
  if (rows.empty())
    return Matrix<double>(0, 0);
  size_t r = rows.size();
  size_t c = rows[0].size();
  Matrix<double> res(r, c);
  for (size_t i = 0; i < r; ++i) {
    if (rows[i].size() != c)
      throw std::runtime_error("Incosistent number of columns in row " + path);
    for (size_t j = 0; j < c; ++j)
      res(i, j) = rows[i][j];
  }
  return res;
}
