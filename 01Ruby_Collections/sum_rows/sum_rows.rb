def sum_even_rows(row_number)
  rows = create_rows(row_number)
  sum_last_row(rows)
end

def create_rows(row_number)
  start_integer = 2
  (1..row_number).map do |current_row|
    row = create_row(current_row, start_integer)
    start_integer = row.last + 2
    row
  end
end

def create_row(row_length, start_integer)
  (1..row_length).to_a.each_index.map do |index|
    start_integer + (2 * index)
  end
end

def sum_last_row(rows)
  rows.last.sum
end

p sum_even_rows(1) == 2
p sum_even_rows(2) == 10
p sum_even_rows(3) == 30
p sum_even_rows(4) == 68


