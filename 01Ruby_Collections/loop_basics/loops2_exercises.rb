# 10. Greeting
def greeting
  puts 'Hello!'
end

number_of_greetings = 2

while number_of_greetings > 0
  greeting
  number_of_greetings -= 1
end

# 9. First to Five
# number_a = 0
# number_b = 0

# loop do
#   number_a += rand(2)
#   number_b += rand(2)
#   puts "a = #{number_a}"
#   puts "b = #{number_b}"
#   if number_a == 5 || number_b == 5
#     puts "5 was reached!"
#     break
#   end
# end

# 8. Only Even
# number = 0

# until number == 10
#   number += 1
#   next if number.odd?
#   puts number
# end

# 7. Stop Counting
# 5.times do |index|
#   puts index
#   break if index < 7
# end

# 6. Empty the Array
# names = ['Sally', 'Joe', 'Lisa', 'Henry']

# loop do
#   puts names.pop
#   break if names.empty?
# end

# 5. Insert Numbers
# numbers = []

# loop do
#   puts 'Enter any number:'
#   input = gets.chomp.to_i

#   numbers << input
#   puts "Current state: #{numbers}"
#   break if numbers.length == 5
# end
# puts numbers

# 4. Get the Sum
# loop do
#   puts 'What does 2 + 2 equal?'
#   answer = gets.chomp.to_i

#   if answer == 4
#     puts "That's correct!"
#     break
#   end

#   puts "Wrong answer. Try again!"
  
# end

# 3. Conditional Loop
# process_the_loop = [true, false].sample
# p process_the_loop

# if process_the_loop
#   loop do
#     puts "The loop was processed"
#     break
#   end
# else
#   puts "The loop wasn't processed!"
# end

# 2. Catch the Number
# loop do
#   number = rand(100)
#   puts number
#   break if number.between?(0, 10)
# end

# 1. Even or Odd?
# count = 1

# loop do
#   sentence = "#{count} is "
#   sentence << "odd!" if count.odd?
#   sentence << "even!" if count.even? 
#   puts sentence
#   break if count == 5
#   count += 1
# end