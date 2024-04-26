DIGITS = ('0'..'9').to_a + ('a'..'f').to_a

def string_to_integer(string, base)
  return base_error_message if base_error(string, base)
  digits = convert_to_digits(string)
  combine_digits(digits, base)
end

def base_error_message
  "Cannot convert to a decimal number: input string contains letters."
end

def base_error(string, base)
  base == 10 && string.downcase.chars.any? { |char| ('a'..'z').include?(char) }
end

def convert_to_digits(string)
  string.downcase.chars.map { |char| DIGITS.index(char) }
end

def combine_digits(digits, base)
  digits.reverse.map.with_index { |digit, index| digit * (base**index) }.sum
end
