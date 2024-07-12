def transpose!(array)
  array.each_index do |row_idx|
    (0..row_idx).each do |column_idx|
      puts "row: #{row_idx}, column: #{column_idx}"
      row = array[row_idx]
      column = array[column_idx]

      row[column_idx], column[row_idx] = column[row_idx], row[column_idx]
    end
  end
  array
end

# def transpose!(array)
#   array.each_with_index do |subarray, row_idx|
#     subarray.each_index do |column_idx|
#       row = array[row_idx]
#       column = array[column_idx]

#       if column_idx > row_idx
#         p "row: #{row_idx}, column: #{column_idx}"
#         row[column_idx], column[row_idx] = column[row_idx], row[column_idx]
#       end
#     end
#     puts
#   end
#   array
# end

matrix = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

transposed_matrix = [
  [1, 4, 7],
  [2, 5, 8],
  [3, 6, 9]
]

index_matrix = [
  ['0/0', '0/1', '0/2'],
  ['1/0', '1/1', '1/2'],
  ['2/0', '2/1', '2/2']
]

transposed_index_matrix = [
  ["0/0", "1/0", "2/0"],
  ["0/1", "1/1", "2/1"],
  ["0/2", "1/2", "2/2"]
]

p index_matrix
puts
transpose!(index_matrix)
p index_matrix #== [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
