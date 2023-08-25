def sum_row(last_row_number)
  last_row = get_last_row(last_row_number)
  last_row.sum
end

def get_last_row(last_row_number)
  last_row_start_number = get_start_number(last_row_number)
  create_row(last_row_number, last_row_start_number)
end

def get_start_number(row_number)
  start_number = 2
  (1..row_number).map do |current_row_number|
    start_number += (2 * current_row_number)
  end.last
end

def get_next_start_number(row_number, start_number)
  start_number + (2 * row_number)
end

def create_row(row_number, start_number)
  (0...row_number).map do |index|
    start_number + (2 * index)
  end
end

p get_start_number(1)
p get_start_number(2)
p get_start_number(3)
p get_start_number(4)

# p sum_row(1)# == 2
# p sum_row(2)# == 10
# p sum_row(3)# == 30
# p sum_row(4)# == 68

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
