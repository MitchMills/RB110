def create_row(start_integer, row_length)
  row = []
  current_integer = start_integer

  loop do
    row << current_integer
    current_integer += 2
    break if row.length == row_length
  end
  
  row
end

def sum_row(row_number)
  all_rows = []
  start_integer = 2

  (1..row_number).each do |current_row_number|
    all_rows << create_row(start_integer, current_row_number)
    start_integer = all_rows.last.last + 2
  end

  all_rows.last.sum
end

# ALGORITHM: sum_row
# 1. Create an empty array 'all_rows' to contain all the rows
# Loop
#   2. Create an array 'row' and add it to the 'all_rows' array
#   3. Repeat step 2 until all the necessary rows have been created
#       - All rows have been created when length of 'all_rows' equals row_number input
# End loop
# 4. Sum the final row
# 5. Return the sum 

# [
#   [2],
#   [4, 6],
#   [8, 10, 12],
#   [14, 16, 18, 20],
#   ...
# ]

# Calculating start_integer
# Rule: first integer of row == last integer of preceding row + 2
# Algorithm: calculate start_integer
#   - Get last row of all_rows array
#   - Get last integer of that row
#   - Add 2 to the integer

# TESTS: sum_row
# row number: 1 --> sum of integers in row: 2
# row number: 2 --> sum of integers in row: 10
# row number: 4 --> sum of integers in row: 68
p sum_row(1) == 2
p sum_row(2) == 10
p sum_row(4) == 68

# ALGORITHM: create_row
# 1. Create an empty array 'row' to contain the integers
# Loop (see notes below):
#  2. Add the starting integer to the 'row' array
#  3. Increment the starting integer by 2 to get the next integer in the sequence
#  4. Repeat steps 2 and 3 until the array has reached the correct length
#    - The correct length of the array is equal to the input integer
# End loop
# 5. Return the 'row' array

# Steps 2 - 4 Loop:
# Start the loop
#   - Add  start_integer to 'row'
#   - Increment start_integer by 2
#   - Break when length of 'row' == row_length
# End the loop

# TESTS: create_row
# starting integer: 2, length: 1 --> `[2]`
# starting integer: 4, length: 2 --> `[4, 6]`
# starting integer: 8, length: 3 --> `[8, 10, 12]`
# p create_row(2, 1) == [2]
# p create_row(4, 2) == [4, 6]
# p create_row(8, 3) == [8, 10, 12]
