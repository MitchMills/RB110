


###### select vowels: non-mutating
# def select_vowels(string)
#   vowels = 'AEIOUaeiou'
#   selected_vowels = ''
#   index = 0

#   loop do
#     current_character = string[index]
#     if vowels.include?(current_character)
#       selected_vowels << current_character
#     end
#     index += 1
#     break if index >= string.size
#   end

#   selected_vowels
# end

### select vowels: MUTATING
# def select_vowels(string)
#   vowels = 'AEIOUaeiou'
#   index = 0
#   selected_vowels = ''

#   loop do
#     current_character = string[index]
#     if vowels.include?(current_character)
#       selected_vowels << current_character
#       string[index] = ''
#     end
#     index += 1
#     break if index >= string.size
#   end
  
#   selected_vowels
# end

# p sentence = 'I wandered lonely as a cloud'
# p sentence.object_id
# puts
# p select_vowels(sentence) #== "Iaeeoeaaou"
# puts
# p sentence
# p sentence.object_id

###### add s: non-mutating
# def add_s(words)
#   plurals = []
#   index = 0

#   loop do
#     current_element = words[index]
#     plurals << (current_element + 's')
#     index += 1
#     break if index >= words.size
#   end

#   plurals
# end

# ### add s: MUTATING
# def add_s(words)
#   index = 0

#   loop do
#     words[index] = words[index] + 's'
#     index += 1
#     break if index >= words.size
#   end
#   words
# end

# fruits = %w(apple banana pear)

# p fruits
# p fruits.object_id
# puts
# p add_s(fruits)
# puts
# p fruits
# p fruits.object_id

###### select all gs: non-mutating
# def get_number_of_gs(string)
#   index = 0
#   number_of_gs = 0

#   loop do
#     current_character = string[index]
#     if current_character == 'g'
#       number_of_gs += 1
#     end
#     index += 1
#     break if index >= string.size
#   end

#   number_of_gs
# end

### select all gs: MUTATING (doesn't really make sense for this program, but wevs)
# def get_number_of_gs(string)
#   index = 0
#   number_of_gs = []

#   loop do
#     current_character = string[index]
#     if current_character == 'g'
#       number_of_gs << string.delete!(current_character)
#     end
#     index += 1
#     break if index >= string.size
#   end

#   number_of_gs.size
# end

# p string = "living laughing loving coding"
# p string.object_id
# puts
# p get_number_of_gs(string)
# puts
# p string
# p string.object_id
