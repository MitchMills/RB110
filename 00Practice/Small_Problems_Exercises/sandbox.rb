def sum_of_multiples(number, divisors)
  (1...number).select { |num| divisors.any? { |div| num % div == 0 } }.sum
end

p sum_of_multiples(10, [7, 11]) == 7
p sum_of_multiples(11, [7, 11]) == 7
p sum_of_multiples(12, [7, 11]) == 18
p sum_of_multiples(25, [7, 11]) == 75
p sum_of_multiples(100, [7, 11]) == 1153
p sum_of_multiples(0, [7, 11]) == 0
p sum_of_multiples(-100, [7, 11]) == 0
