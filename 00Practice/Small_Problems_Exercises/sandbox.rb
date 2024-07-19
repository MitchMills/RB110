def star(size)
  all_rows = get_all_rows(size)
  puts all_rows
end

def get_all_rows(star_size)
  top_rows = get_top_rows(star_size)
  middle_row = ['*' * star_size]
  bottom_rows = top_rows.reverse
  top_rows + middle_row + bottom_rows
end

def get_top_rows(star_size)
  number_of_rows = star_size / 2
  last_index = star_size - 1

  number_of_rows.times.map do |row_number|
    star_indexes = get_star_indexes(row_number, last_index)
    get_one_row(star_size, star_indexes)
  end
end

def get_star_indexes(row_number, last_index)
  first_star_index = row_number
  middle_star_index = last_index / 2
  last_star_index = last_index - first_star_index
  [first_star_index, middle_star_index, last_star_index]
end

def get_one_row(star_size, star_indexes)
  star_size.times.map { |index| star_indexes.include?(index) ? '*' : ' ' }.join
end

star(7)
