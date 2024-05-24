array8 = [[8, 13, 27], ['apple', 'banana', 'cantaloupe']]

selected = array8.map do |sub_array|
  sub_array.select do |item|
    if item.to_s.to_i == item    # if it's an integer
      item > 13
    else
      item.size < 6
    end
  end
end

p selected
p array8
