def fibonacci_last(nth)
  pattern = fibonacci_pattern_finder
  index = (nth % pattern.size) - 1
  pattern[index]
end

def fibonacci_pattern_finder
  last_digits = [1, 1]
  nth = 3

  loop do
    last_digits << find_last_digit(nth)
    nth += 1
    next if last_digits.size.odd?

    half = last_digits.size / 2
    break if last_digits.take(half) == last_digits.drop(half)
  end

  last_digits.take(last_digits.size / 2)
end

def find_last_digit(nth)
  (3..nth).inject([1, 1]) do |last_two, _|
    [last_two.last, last_two.sum].map { |num| num % 10 }
  end.last
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4
p fibonacci_last(123_456_789_987_745)




# FIB_PATTERN = '112358314594370774156178538190998752796516730336954932572910'

# def fibonacci_last(nth)
#   index = (nth % FIB_PATTERN.size) - 1
#   FIB_PATTERN[index].to_i
# end

# p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
# p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
# p fibonacci_last(100)       # -> 5
# p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
# p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# p fibonacci_last(123456789) # -> 4
# p fibonacci_last(123_456_789_987_745) # -> 5
