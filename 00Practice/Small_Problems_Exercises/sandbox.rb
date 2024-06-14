def multiply_all_pairs(array1, array2)
  products = []
  array1.each do |num1|
    array2.each { |num2| products << (num1 * num2) }
  end
  products.sort
end
