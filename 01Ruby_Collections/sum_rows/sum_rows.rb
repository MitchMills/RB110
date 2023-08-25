def sum_row(last_row_number)
  last_row = get_last_row(last_row_number)
  last_row.sum
end

def get_last_row(last_row_number)
  last_row_start_number = get_next_start_number(last_row_number - 1)
  create_row(last_row_number, last_row_start_number)
end

def get_next_start_number(previous_row_number)
  return 2 if previous_row_number == 0
  (1..previous_row_number).inject(2) do |start_number, current_row_number|
    start_number += (2 * current_row_number)
  end
end

def create_row(row_number, start_number)
  (0...row_number).map do |index|
    start_number + (2 * index)
  end
end

p sum_row(1)
p sum_row(2)
p sum_row(3)
p sum_row(4)

#####
# def sum_even_rows(row_number)
#   row_length = 1
#   start_number = 2
#   loop do
#     current_row = []
#     current_row << start_number
#     until current_row.size == row_length
#       current_row << (start_number += 2)
#     end
#     return current_row.sum if row_length == row_number

#     start_number = current_row.last + 2
#     row_length += 1
#   end
# end

#####
# def sum_even_rows(row_number)
#   rows = create_rows(row_number)
#   rows.last.sum
# end

# def create_rows(row_number)
#   start_integer = 2
#   (1..row_number).map do |current_row|
#     row = create_row(current_row, start_integer)
#     start_integer = row.last + 2
#     row
#   end
# end

# def create_row(row_length, start_integer)
#   (1..row_length).to_a.each_index.map do |index|
#     start_integer + (2 * index)
#   end
# end
#####

# p sum_even_rows(1)# == 2
# p sum_even_rows(2)# == 10
# p sum_even_rows(3)# == 30
# p sum_even_rows(4)# == 68
