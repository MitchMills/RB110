def diamond(size, hollow: false)
  rows = get_rows(size, hollow)
  puts rows
end

def get_rows(size, hollow)
  row_numbers = (1..size).step(2).to_a + (1..(size - 2)).step(2).to_a.reverse
  hollow ? hollow_rows(row_numbers) : full_rows(row_numbers)
end

def hollow_rows(row_numbers)
  rows = row_numbers.map { |row| row == 1 ? '*' : "*#{' ' * (row - 2)}*" }
  rows.map { |row| row.center(row_numbers.size) }
end

def full_rows(row_numbers)
  row_numbers.map { |row_number| ('*' * row_number).center(row_numbers.size) }
end
