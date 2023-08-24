### 6 


### 5 SAY HELLO
# say_hello = true

# while say_hello
#   5.times { puts 'Hello!' }
#   say_hello = false
# end

# count = 0

# while say_hello
#   puts 'Hello!'
#   count += 1
#   say_hello = false if count >= 5
# end

### 4 LOOP ON COMMAND
# loop do
#   puts 'Should I stop looping?'
#   answer = gets.chomp
#   break if answer == 'yes'
# end

### 3 CONTROL THE LOOP
# iterations = 1

# loop do
#   puts "Number of iterations = #{iterations}"
#   break if iterations >= 5
#   iterations +=1
# end

### 2 LOOPCEPTION
# loop do
#   puts 'This is the outer loop.'
#   loop do
#     puts 'This is the inner loop.'
#     break
#   end
#   break
# end

# puts 'This is outside all loops.'

### 1 RUNAWAY LOOP
# loop do
#   puts 'Just keep printing...'
#   break
# end
