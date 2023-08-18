array1 = [['a', 'b'], ['c', 'd'], ['e', 'f']]

array2 = array1.map do |sub_arr|
  sub_arr.map do |letter|
    letter.upcase
  end
end

p array1
p array2
