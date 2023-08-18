
array = [
  { name: 'fred lopez' }
]
p array[0][:name].capitalize

# QUESTION 9
# array = [2, 4, 6, 8, 10]
# nilled = array.map { |num| nil }
# falsed = array.map { |num| num > 12 }
# p nilled
# p falsed

# QUESTION 8
# array = [1, 2, 3, 4, 5]
# truthy = array.select { |num| num < 6 }
# falsey = array.select { |num| num > 5 }
# p array
# p array.object_id
# p truthy
# p truthy.object_id
# p falsey
# p falsey.object_id


# QUESTIONS 4 - 6
# def change_case(sentence, new_case)
#   case new_case
#   when :snake
#     snake(sentence)
#   when :camel
#     camel(sentence)
#   when :upper_snake
#     upper_snake(sentence)
#   else
#     puts 'Invalid case type'
#   end
# end

# Question 6
# def upper_snake(str)
#   words = str.split
#   current_word = 0

#   loop do
#     break if current_word == words.size

#     words[current_word].upcase!
#     current_word += 1
#   end

#   words.join('_')
# end

# sentence = 'The sky was blue'
# p upper_snake(sentence) # => 'THE_SKY_WAS_BLUE'

# Question 5
# def camel(str)
#   words = str.split(' ')
#   counter = 0

#   while counter < words.size
#     words[counter] = words[counter].capitalize

#     counter = counter + 1
#   end

#   words.join
# end
# sentence = "The sky was blue"
# p camel(sentence)

# Question 4
# def snake(str)
#   words = str.split
#   current_word = 0

#   loop do
#     words[current_word].downcase!

#     current_word += 1
#     break if current_word >= words.size
#   end

#   words.join('_')
# end

# sentence = "The sky was blue"
# p snake(sentence)