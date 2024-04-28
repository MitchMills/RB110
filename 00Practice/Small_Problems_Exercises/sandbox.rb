STRING_INTEGERS = ('0'..'9').to_a

def signed_integer_to_string1(integer)
  number = integer.abs
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(STRING_INTEGERS[remainder])
    break if number == 0
  end
  return result if integer == 0
  integer > 0 ? result.prepend('+') : result.prepend('-')
end

def signed_integer_to_string2(integer)
  result = integer.abs.digits.reverse.join
  return result if integer.zero?
  integer.positive? ? result.prepend('+') : result.prepend('-')
end

def signed_integer_to_string3(integer)
  sign = ['', '+', '-'][integer <=> 0]
  number = integer.abs.digits.reduce('') do |result, digit|
    result.prepend(STRING_INTEGERS[digit])
  end
  sign + number
end

def signed_integer_to_string4(integer)
  sign = ['', '+', '-'][integer <=> 0]
  number = integer.abs.digits.reverse.join
  sign + number
end

def signed_integer_to_string5(integer)
  number = [integer].join
  integer > 0 ? "+#{number}" : number
end

def signed_integer_to_string6(integer)
  integer > 0 ? "+#{integer}" : "#{integer}"
end
