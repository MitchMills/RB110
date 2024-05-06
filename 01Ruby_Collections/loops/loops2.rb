### 10 GREETING
# def greeting
#   puts 'Hello!'
# end

# number_of_greetings = 2

# while number_of_greetings > 0
#   greeting
#   number_of_greetings -= 1
# end

### 9 FIRST TO FIVE
# number_a = 0
# number_b = 0

# loop do
#   number_a += rand(2)
#   number_b += rand(2)
#   puts "a: #{number_a}, b: #{number_b}"

#   break puts "5 was reached!" if [number_a, number_b].include?(5)
# end

### 8 ONLY EVEN
# number = 0

# until number == 10
#   number += 1
#   next if number.odd?
#   puts number
# end

### 7 STOP COUNTING
# 5.times do |index|
#   puts index
#   break if index < 7
# end

### 6 EMPTY THE ARRAY
# names = ['Sally', 'Joe', 'Lisa', 'Henry']

# while !names.empty?
#   puts names.shift
# end

# until names.empty?
#   puts names.shift
# end

# loop do
#   puts names.shift
#   break if names.empty?
# end

### 5 INSERT NUMBERS
# numbers = []

# loop do
#   puts 'Enter any number:'
#   input = gets.chomp.to_i
#   numbers << input
#   break if numbers.size >= 5
# end
# puts numbers

### 4 GET THE SUM
# loop do
#   puts 'What does 2 + 2 equal?'
#   answer = gets.chomp.to_i
#   break puts "That's correct!" if answer == 4
#   puts "Wrong answer. Try again!"
# end

### 3 CONDITIONAL LOOP
# process_the_loop = [true, false].sample
# p process_the_loop

# if process_the_loop
#   loop do
#     puts "The loop was processed."
#     break
#   end
# else
#   puts "The loop wasn't processed"
# end

### 2 CATCH THE NUMBER
# loop do
#   number = rand(100)
#   puts number
#   break if (0..10).include?(number)
# end

### 1 EVEN OR ODD?
# count = 1

# loop do
#   break if count > 5
#   type = count.odd? ? 'odd' : 'even'
#   puts "#{count} is #{type}!"
#   count += 1
# end
