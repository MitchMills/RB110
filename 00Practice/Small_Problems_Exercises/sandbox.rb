def sum_square_difference(number)
  numbers = (1..number)
  sum_squared(numbers) - squares_summed(numbers)
end

def sum_squared(numbers)
  numbers.sum.abs2
end

def squares_summed(numbers)
  numbers.sum(&:abs2)
end

p sum_square_difference(3) == 22 # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
