# def sum_of_multiples(number, divisors)
#   (1...number).select do |candidate|
#     divisors.any? { |divisor| candidate % divisor == 0 }
#   end.sum
# end

# def seven_eleven(number)
#   (1...number).select { |num| num % 7 == 0 || num % 11 == 0 }.sum
# end

def seven_eleven(number)
  (1...number).select do |candidate|
    [7, 11].any? { |divisor| candidate % divisor == 0 }
  end.sum
end

p seven_eleven(10) == 7
p seven_eleven(11) == 7
p seven_eleven(12) == 18
p seven_eleven(25) == 75
p seven_eleven(100) == 1153
p seven_eleven(0) == 0
p seven_eleven(-100) == 0

# p sum_of_multiples(10, [7, 11]) == 7
# p sum_of_multiples(11, [7, 11]) == 7
# p sum_of_multiples(12, [7, 11]) == 18
# p sum_of_multiples(25, [7, 11]) == 75
# p sum_of_multiples(100, [7, 11]) == 1153
# p sum_of_multiples(0, [7, 11]) == 0
# p sum_of_multiples(-100, [7, 11]) == 0
