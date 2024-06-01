def greatest_product(number)
  digits = number.digits.reverse
  final_index = digits.size - 5
  sequences = (0..final_index).map { |index| digits[index, 5] }
  products = sequences.map { |sequence| sequence.inject(:*) }
  products.max
end

p greatest_product(123456) #== 720 # (2 * 3 * 4 * 5 * 6)
p greatest_product(923456) #== 1080 # (9 * 2 * 3 * 4 * 5)
p greatest_product(1234567890) #== 15120 # (5 * 6 * 7 * 8 * 9)
p greatest_product(2494037820244202221011110532909999) #== 0
