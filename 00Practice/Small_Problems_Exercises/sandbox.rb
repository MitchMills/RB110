
matrix = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

# [0]
#   [0] 1 => 1 [0][0]
#   [1] 2 => 4 [1][0]
#   [2] 3 => 7 [2][2]
# [1]
#   [0] 4 => 2 [0][1]
#   [1] 5 => 5 [1][1]
#   [2] 6 => 8 [2][1]
# [2]
#   [0] 7 => 3 [0][2]
#   [1] 8 => 6 [1][2]
#   [2] 9 => 9 [2][2]

transposed = [
  [1, 4, 7],
  [2, 5, 8],
  [3, 6, 9]
]

# def transpose!(array)
#   array.each_with_index do |subarray, row_index|
#     subarray.each_index do |column_index|
#       row = array[row_index]
#       column = array[column_index]
#       if row_index > column_index
#         row[column_index], column[row_index] = column[row_index], row[column_index]
#       end
#     end
#   end
#   array
# end

# def transpose!(array)
#   array.each_index do |row_index|
#     (0..row_index).each do |column_index|
#       row = array[row_index]
#       column = array[column_index]
#       row[column_index], column[row_index] = column[row_index], row[column_index]
#     end
#   end
#   array
# end

def transpose!(array)
  array.each_index do |row_index|
    (0..row_index).each do |column_index|
      element1 = array[row_index][column_index]
      element2 = array[column_index][row_index]

      element1, element2 = element2, element1
    end
  end
  array
end

p matrix
transpose!(matrix)
p matrix


def transpose!(matrix)
  size = matrix.size

  size.times do |row|
    size.times do |col|
      matrix[col] << matrix[row].shift
    end
  end
  matrix
end
