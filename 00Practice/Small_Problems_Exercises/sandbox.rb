def transpose(matrix)
  new_matrix = Array.new(3) { [] }
  matrix.each do |subarray|
    subarray.each_with_index do |element, index|
      new_matrix[index] << element
    end
  end
  new_matrix
end

def transpose1(matrix)
  matrix.map.with_index do |subarray, row_index|
    subarray.each_index.map do |column_index|
      matrix[column_index][row_index]
    end
  end
end

matrix = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p matrix == [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
