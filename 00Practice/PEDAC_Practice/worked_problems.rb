### *** COMBINATION v PRODUCT v PERMUTATION
numbers = 2017.digits
p numbers.combination(4).to_a
puts
prods = [2, 0, 1, 7].product([2, 0, 1], [2, 0], [2])
perms = numbers.permutation(4).to_a.sort
p prods
puts
p perms


### TWO CLOSEST
# def closest_numbers(numbers)
#   combos = numbers.combination(2).to_a
#   result = combos.sort_by { |pair| (pair.inject(:-)).abs }.first
# end

# p closest_numbers([5, 25, 15, 11, 20]) #== [15, 11]
# p closest_numbers([19, 25, 32, 4, 27, 16]) #== [25, 27]
# p closest_numbers([12, 7, 17]) #== [12, 7]

### NEXT BIGGER NUMBER
# def next_bigger_num(number)
#   digits = number.digits
#   combos = digits.permutation(digits.size).uniq.map(&:join).map(&:to_i).sort
#   index = combos.index(number)
#   combos[index + 1] || -1
# end

# p next_bigger_num(9) == -1
# p next_bigger_num(12) == 21
# p next_bigger_num(513) == 531
# p next_bigger_num(2017) == 2071
# p next_bigger_num(111) == -1
# p next_bigger_num(531) == -1
# p next_bigger_num(123456789) == 123456798

### DELETE A DIGIT
# def delete_digit(number)
#   digits = number.digits.reverse

#   possibles = (0...digits.size).map do |index|
#     digits.select.with_index { |_, idx| idx != index }
#   end

#   possibles.map(&:join).map(&:to_i).sort.last
# end

# def delete_digit(number)
#   digits = number.digits.reverse

#   possibles = digits.each_index.map do |index|
#     digits.select.with_index { |_, idx| idx != index }
#   end

#   possibles.map(&:join).map(&:to_i).sort.last
# end

# def delete_digit(number) # DOESN'T WORK
#   string = number.to_s

#   possibles = (0...string.size).map do |index|
#     current_char = string[index]
#     string.delete(current_char)
#   end

#   possibles.map(&:to_i).sort.last
# end

# p delete_digit(791983) == 91983
# p delete_digit(152) == 52
# p delete_digit(1001) == 101
# p delete_digit(10) == 1
# puts
# p delete_digit(12345) == 2345
# p delete_digit(54321) == 5432
# p delete_digit(12321) == 2321
# p delete_digit(32123) == 3223
