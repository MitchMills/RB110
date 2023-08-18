# 10. Greet Your Friends
friends = ['Sarah', 'John', 'Hannah', 'Dave']

for friend in friends
  puts "Hello, #{friend}!"
end

# 9. That's Odd
# for i in 1..100
#   puts i if i.odd?
# end

# 8. Print Until
# numbers = [7, 9, 13, 25, 18]
# index = 0

# until index == numbers.length
#   puts numbers[index]
#   index += 1
# end

# 7. Count Up
# count = 1

# until count > 10
#   puts count
#   count += 1
# end

# 6. Print While
# numbers = []

# while numbers.length < 5
#   numbers << rand(100)
# end

# puts numbers

# 5. Say Hello
# say_hello = true
# iterations = 1

# while say_hello
#   puts 'Hello!'
#   say_hello = false if iterations >= 5
#   iterations += 1
# end

# 4. Loop on Command
# loop do
#   puts 'Should I stop looping?'
#   answer = gets.chomp
#   break if answer == 'yes'
#   puts "Answer 'yes' to stop looping."
# end

# 3. Control the Loop
# iterations = 1

# loop do
#   puts "number of iterations = #{iterations}"
#   break if iterations >= 5
#   iterations += 1
# end

# 2.  Loopception
# loop do
#   puts 'This is the outer loop.'

#   loop do
#     puts 'This is the inner loop.'
#     break
#   end

#   break
# end

# puts 'This is outside all loops.'

# 1. Runaway Loop
# loop do
#   puts 'Just keep printing...'
#   break
# end
