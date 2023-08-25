def select_letter(string, target_letter)
  answer = ''
  index = 0

  loop do
    current_letter = string[index]
    answer << current_letter if current_letter == target_letter
    index += 1
    break if index >= string.size
  end
  answer
end

question = 'How many times does a particular character appear in this sentence?'
p select_letter(question, 'a') # => 
p "aaaaaaaa"
p select_letter(question, 't') # => 
p "ttttt"
p select_letter(question, 'z') # => 
p ""



# def multiply(numbers, multiplier)
#   multiplied_numbers = []
#   index = 0

#   loop do
#     multiplied_numbers << numbers[index] *= multiplier
#     index += 1
#     break if index >= numbers.size
#   end

#   multiplied_numbers
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# p multiply(my_numbers, 3) # => 
# p [3, 12, 9, 21, 6, 18]



# def double_odd_indexes(numbers)
#   doubled_odd_indexes = []
#   index = 0

#   loop do
#     current_number = numbers[index]
#     current_number *= 2 if index.odd?  
#     doubled_odd_indexes << current_number
#     index += 1
#     break if index >= numbers.size
#   end

#   doubled_odd_indexes
# end

# my_numbers = [1, 4, 3, 7, 2, 6]

# p my_numbers
# p double_odd_indexes(my_numbers)  # => [1, 8, 3, 14, 2, 12]
# p my_numbers



# def double_numbers!(numbers)
#   counter = 0

#   loop do
#     numbers[counter] *= 2
#     counter += 1
#     break if counter == numbers.size
#   end

#   numbers
# end

# my_numbers = [1, 4, 3, 7, 2, 6]

# p my_numbers
# p my_numbers.object_id
# puts
# p double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]
# puts
# p my_numbers
# p my_numbers.object_id

# def double_numbers(numbers)
#   doubled_numbers = []
#   counter = 0

#   loop do
#     break if counter == numbers.size

#     current_number = numbers[counter]
#     doubled_numbers << current_number * 2

#     counter += 1
#   end

#   doubled_numbers
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# p double_numbers(my_numbers) # => [2, 8, 6, 14, 4, 12]


# def select_fruit(produce)
#   fruit = {}
#   items = produce.keys # ['apple', 'carrot', 'pear', 'broccoli']
#   index = 0

#   loop do
#     current_item = items[index]
#     current_type = produce[current_item]

#     if current_type == 'Fruit'
#       fruit[current_item] = current_type
#     end
#     index += 1
#     break if index >= items.size
#   end

#   fruit
# end

# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }

# produce2 = {}

# p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
# p select_fruit(produce2)
