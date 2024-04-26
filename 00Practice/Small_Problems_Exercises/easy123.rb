DIGITS = ('0'..'9').to_a + ('a'..'f').to_a

def string_to_integer(string, base = 10)
  return error_message(string, base) if input_error?(string, base)
  digits = convert_to_digits(string)
  combine_digits(digits, base)
end

def error_message(string, base)
  error_type = input_error(string, base)
  error_messages = {
    wrong_base: "Error: base must be either 10 or 16.",
    string_error: "Error: input string contains invalid characters.",
    base10: "Error: cannot convert to a decimal number: input string contains letters."
  }
  error_messages[error_type]
end

def input_error?(string, base)
  !!input_error(string, base)
end

def input_error(string, base)
  chars = string.downcase.chars
  return :wrong_base unless [10, 16].include?(base)
  return :string_error unless chars.all? { |char| DIGITS.include?(char) }
  return :base10 if base == 10 && chars.any? { |char| 'abcdef'.include?(char) }
  nil
end

def convert_to_digits(string)
  string.downcase.chars.map { |char| DIGITS.index(char) }
end

def combine_digits(digits, base)
  digits.reverse.map.with_index { |digit, index| digit * (base**index) }.sum
end
