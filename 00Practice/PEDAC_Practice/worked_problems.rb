
##### ALPHABETIZED ORDER OF APPEARANCE #####
# ALPHABET = ('A'..'Z').to_a + ('a'..'z').to_a

# def alphabetized(string)
#   only_alphas = string.strip.chars.select { |char| ALPHABET.include?(char) }
#   only_alphas.each_with_index.sort_by do |char, idx|
#     [char.downcase, idx]
#   end.to_h.keys.join
# end

# p alphabetized("") == ""
# p alphabetized(" ") == ""
# p alphabetized(" a") == "a"
# p alphabetized("a ") == "a"
# p alphabetized(" a ") == "a"
# p alphabetized("A b B a") == "AabB"
# p alphabetized("A?b.B#a") == "AabB" 
# p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z") == "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"
#########


# string = 'abc'
# letter = string[0]
# letter #=> 'a'
# p letter.object_id #=> 60
# letter.upcase! #=> 'A'
# p letter.object_id #=> 60
# p string


# p string.object_id #=> 60
# p string[0].object_id #=> 80
# p string[0].object_id #=> 100

# string[0].upcase! #=> 'A'
# string[0] #=> 'a'
# string #=> 'abc'
# p string.object_id #=> 60

# string[0] = string[0].upcase
# string[0] #=> 'A'
# string #=> 'Abc'
# p string.object_id #=> 60
# p string[0].object_id #=> 120
# p string[0].object_id #=> 140



### *** EACH_CONS v COMBINATION v PRODUCT v PERMUTATION
# p [7, 1, 0, 2].each_cons(2).to_a
# # [[7, 1], [1, 0], [0, 2]]
# p [7, 1, 0, 2].each_cons(3).to_a
# # [[7, 1, 0], [1, 0, 2]]
# ### returns each consecutive grouping of elements
# puts

# p [7, 1, 0, 2].combination(4).to_a
# # [[7, 1, 0, 2]]
# p [7, 1, 0, 2].combination(3).to_a
# # [[7, 1, 0], [7, 1, 2], [7, 0, 2], [1, 0, 2]]
# p [7, 1, 0, 2].combination(2).to_a
# # [[7, 1], [7, 0], [7, 2], [1, 0], [1, 2], [0, 2]]
# ### returns every possible combination of the elements without considering order: i.e. [7, 1] and [1, 7] are the same combination (they contain the same two elements) so only one is returned
# puts


# p [7, 1, 0, 2].product([7, 1, 0, 2])
# # [[7, 7], [7, 1], [7, 0], [7, 2], [1, 7], [1, 1], [1, 0], [1, 2], [0, 7], [0, 1], [0, 0], [0, 2], [2, 7], [2, 1], [2, 0], [2, 2]]
# ### returns combinations of each element of calling array with each element of argument array(s)
# puts

# p [7, 1, 0, 2].permutation(4).to_a.sort
# [[0, 1, 2, 7], [0, 1, 7, 2], [0, 2, 1, 7], [0, 2, 7, 1], [0, 7, 1, 2], [0, 7, 2, 1], [1, 0, 2, 7], [1, 0, 7, 2], [1, 2, 0, 7], [1, 2, 7, 0], [1, 7, 0, 2], [1, 7, 2, 0], [2, 0, 1, 7], [2, 0, 7, 1], [2, 1, 0, 7], [2, 1, 7, 0], [2, 7, 0, 1], [2, 7, 1, 0], [7, 0, 1, 2], [7, 0, 2, 1], [7, 1, 0, 2], [7, 1, 2, 0], [7, 2, 0, 1], [7, 2, 1, 0]]
### returns every possible grouping of the elements in every possible order: i.e. [0, 1, 2, 7] and [0, 1, 7, 2] are separate permutations


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
