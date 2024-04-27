def string_to_signed_integer(string)
  digits = get_digits(string)
  combine_digits(string.chr, digits)
end

def get_digits(string)
  all_digits = ('0'..'9').to_a
  numbers = string.chars.select { |char| all_digits.include?(char) }
  numbers.map { |number| all_digits.index(number) }
end

def combine_digits(first_character, digits)
  result = digits.reverse.map.with_index { |digit, idx| digit * (10**idx) }.sum
  first_character == '-' ? -result : result
end

# def string_to_signed_integer(string)
#   unsigned_string = %w(- +).include?(string[0]) ? string[1..-1] : string
#   number = string_to_integer(unsigned_string)
#   string[0] == '-' ? -number : number
# end

# DIGITS = {
#   '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
#   '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
# }

# def string_to_integer(string)
#   digits = string.chars.map { |char| DIGITS[char] }
#   value = 0
#   digits.each { |digit| value = (10 * value) + digit }
#   value
# end

p string_to_signed_integer('4321') #== 4321
p string_to_signed_integer('-570') #== -570
p string_to_signed_integer('+100') #== 100
