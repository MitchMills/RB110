def dasherizer(number)
  digits = number.digits.reverse
  digits.map.with_index do |digit, index|
    consecutive_odds?(digits, index) ? "#{digit}-" : digit.to_s
  end.join
end

def consecutive_odds?(digits, index)
  next_digit = digits[index + 1] || 0
  digits[index].odd? && next_digit.odd?
end

p dasherizer(2112) == '21-12'
p dasherizer(201305742) == '201-305-742'
p dasherizer(123456789) == '123456789'
p dasherizer(217521) == '21-7-521'
