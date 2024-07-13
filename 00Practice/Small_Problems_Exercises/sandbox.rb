def triple_double?(number1, number2)
  triple_digits = get_multiple_digits(number1, 3)
  return false if triple_digits.empty?

  double_digits = get_multiple_digits(number2, 2)
  return false if double_digits.empty?

  triple_digits.any? { |digit| double_digits.include?(digit) }
end

def get_multiple_digits(number, length)
  digits = number.digits.reverse
  potentials = digits.each_cons(length).to_a

  multiples = potentials.select do |potential|
    potential.all? { |digit| digit == potential.first }
  end

  multiples.map(&:first)
end

p triple_double?(12345, 12345) == false
p triple_double?(1222345, 122345) == true
p triple_double?(1222345, 123345) == false
p triple_double?(666789, 12345666) == true
p triple_double?(451999277888, 41177722899) == true
