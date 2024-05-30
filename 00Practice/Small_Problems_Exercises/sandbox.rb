def rotate_rightmost_digits(number, digits_to_rotate)
  return number if digits_to_rotate > number.to_s.size
  sign = number.positive? ? 1 : -1
  leftmost, rightmost = separate_digits(number.abs, digits_to_rotate)
  (leftmost + rotate_array(rightmost)).join.to_i * sign
end

def separate_digits(number, digits_to_rotate)
  leftmost = number.digits.drop(digits_to_rotate).reverse
  rightmost = number.digits.take(digits_to_rotate).reverse
  [leftmost, rightmost]
end

def rotate_array(array)
  array.empty? ? array : array[1..-1] + array[0, 1]
end
