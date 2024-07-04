# def bouncy_count(numbers)
#   count = 0

#   numbers.each do |number|
#     digits = number.digits.reverse
#     count += 1 if ascending?(digits) && descending?(digits)
#   end

#   count
# end

# def bouncy_count(numbers)
#   numbers.map do |number|
#     digits = number.digits.reverse
#     ascending?(digits) && descending?(digits) ? 1 : 0
#   end.sum
# end

def bouncy_count(numbers)
  numbers.inject(0) do |count, number|
    digits = number.digits.reverse
    addition = ascending?(digits) && descending?(digits) ? 1 : 0
    count + addition
  end
end

def ascending?(digits_array)
  digits_array.each_cons(2).any? { |pair| pair.first < pair.last }
end

def descending?(digits_array)
  digits_array.each_cons(2).any? { |pair| pair.first > pair.last }
end

p bouncy_count([]) == 0
p bouncy_count([11, 0, 345, 21]) == 0
p bouncy_count([121, 4114]) == 2
p bouncy_count([176, 442, 80701644]) == 2
