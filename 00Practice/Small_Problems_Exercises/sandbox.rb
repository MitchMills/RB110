def multiply_all_pairs1(array1, array2)
  products = []

  array1.each do |number1|
    array2.each { |number2| products << (number1 * number2) }
  end

  products.sort
end

def multiply_all_pairs(array1, array2)
  array1.each_with_object([]) do |number1, products|
    array2.each { |number2| products << (number1 * number2) }
  end.sort
end

p multiply_all_pairs([3], [1, 3, 2]) == [3, 6, 9]
p multiply_all_pairs([1, 2], [3, 4]) == [3, 4, 6, 8]
p multiply_all_pairs([1, 2], [4, 3, 1, 2]) == [1, 2, 2, 3, 4, 4, 6, 8]
