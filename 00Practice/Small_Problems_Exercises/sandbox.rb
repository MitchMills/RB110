def sum_square_difference(number)
  sum_squared(number) - squares_summed(number)
end

def sum_squared(number)
  (1..number).sum.abs2
end

def squares_summed(number)
  (1..number).map(&:abs2).sum
end

p sum_square_difference(3) == 22 # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
