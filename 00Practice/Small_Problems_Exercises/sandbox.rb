MAX_FEATURED_NUMBER = 9_876_543_201

def featured(number)
  return error_message if number >= MAX_FEATURED_NUMBER
  starting_number = find_next_odd_multiple_of_seven(number + 1)
  next_featured_number(starting_number)
end

def error_message
  'There is no possible number that fulfills those requirements'
end

def find_next_odd_multiple_of_seven(number)
  number += 1 until number.odd? && number % 7 == 0
  number
end

def next_featured_number(starting_number)
  (starting_number..MAX_FEATURED_NUMBER).step(14).each do |number|
    return number if unique_digits?(number)
  end
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
