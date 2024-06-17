def seven_eleven(number)
  (1...number).filter_map { |num| num if num % 7 == 0 || num % 11 == 0 }.sum
end

p seven_eleven(10) == 7
p seven_eleven(11) == 7
p seven_eleven(12) == 18
p seven_eleven(25) == 75
p seven_eleven(100) == 1153
p seven_eleven(0) == 0
p seven_eleven(-100) == 0
