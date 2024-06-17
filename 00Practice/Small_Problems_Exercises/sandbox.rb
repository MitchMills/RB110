def delete_digit(number)
  last_index = number.to_s.size - 1

  (0..last_index).map do |index|
    digits = number.to_s.chars
    digits.delete_at(index)
    digits.join.to_i
  end.max
end
