def create_row(row_length, start_integer)
  current_row = []
  current_integer = start_integer
  loop do
    current_row << current_integer
    break if current_row.length == row_length
    current_integer += 2
  end
  current_row
end
# TESTS: create_row
# p create_row(1, 2) == [2]
# p create_row(2, 4) == [4, 6]
# p create_row(3, 8) == [8, 10, 12]
# p create_row(4, 14) == [14, 16, 18, 20]

def create_sequence(row_number)
  sequence = []
  row_length = 1
  start_integer = 2
  loop do
    current_row = create_row(row_length, start_integer)
    sequence << current_row
    break if sequence.length == row_number
    row_length += 1
    start_integer = current_row.last + 2
  end
  sequence
end
# TESTS: create_sequence
# p create_sequence(1) == [[2]]
# p create_sequence(2) == [[2], [4, 6]]
# p create_sequence(3) == [[2], [4, 6], [8, 10, 12]]
# p create_sequence(4) == [[2], [4, 6], [8, 10, 12], [14, 16, 18, 20]]

def get_last_row(sequence)
  sequence.last
end
# TESTS: get_last_row
# p get_last_row([[2], [4, 6], [8, 10, 12]])

def sum_last_row(row_number)
  sequence = create_sequence(row_number)
  last_row = get_last_row(sequence)
  last_row.sum
end
#TESTS: sum_last_row
p sum_last_row(1) == 2
p sum_last_row(2) == 10
p sum_last_row(3) == 30
p sum_last_row(4) == 68
