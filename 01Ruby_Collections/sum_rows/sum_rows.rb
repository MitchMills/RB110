def sum_even_rows(row_number)
  last_row = get_last_row(row_number)
  last_row.sum
end

def get_last_row(row_number)
  start_number = 2
  (1..row_number).each_with_object([]) do |current_row_number, current_row|
    current_row << create_row(current_row_number, start_number)
    start_number = current_row.last.last + 2
  end.last
end

def create_row(row_length, start_number)
  (0...row_length).map do |element|
    start_number + (2 * element)
  end
end

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

p sum_even_rows(1)# == 2
p sum_even_rows(2)# == 10
p sum_even_rows(3)# == 30
p sum_even_rows(4)# == 68
