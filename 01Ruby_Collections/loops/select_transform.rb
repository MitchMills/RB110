### add s: non-mutating
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

# fruits = %w(apple banana pear)

# p fruits
# p fruits.object_id
# puts
# p add_s(fruits)
# puts
# p fruits
# p fruits.object_id

### select all gs: non-mutating
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

# p string = "living laughing loving coding"
# p string.object_id
# puts
# p get_number_of_gs(string)
# puts
# p string
# p string.object_id
