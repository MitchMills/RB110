require 'benchmark'

MAX_FEATURED_NUMBER = 9_876_543_201

def featured(number)
  return no_solution_message if number >= MAX_FEATURED_NUMBER
  next_featured_number(number)
end

def no_solution_message
  'There is no possible number that fulfills those requirements'
end

def next_featured_number(number)
  start = find_next_odd_multiple_of_seven(number + 1)
  (start..MAX_FEATURED_NUMBER).step(14).find { |num| unique_digits?(num) }
end

def find_next_odd_multiple_of_seven(number)
  number += number.odd? ? 0 : 1
  (number..(number + 14)).step(2).find { |num| num % 7 == 0 }
end

def unique_digits?(number)
  seen_digits = Array.new(10, false)
  loop do
    number, current_digit = number.divmod(10)
    return false if seen_digits[current_digit]
    seen_digits[current_digit] = true
    break if number == 0
  end
  true
end

# def unique_digits?(number)
#   number.digits.uniq == number.digits
# end

# def unique_digits?(number)
#   number.to_s.chars.uniq == number.to_s.chars
# end

# p featured(12) == 21
# p featured(20) == 21
# p featured(21) == 35
# p featured(997) == 1029
# p featured(1029) == 1043
# p featured(999_999) == 1_023_547
# p featured(9_999_999_999)
# p featured(999_999_987) == 1_023_456_987

puts Benchmark.measure { featured(999_999_987) }
