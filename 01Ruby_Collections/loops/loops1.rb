### GREET YOUR FRIENDS
# friends = ['Sarah', 'John', 'Hannah', 'Dave']

# for friend in friends
#   puts "Hello, #{friend}!"
# end

### THAT'S ODD
# for i in 1..10
#   next if i.even?
#   puts i
# end

### PRINT UNTIL
# numbers = [7, 9, 13, 25, 18]

# index = 0
# until index >= numbers.size
#   puts numbers[index]
#   index += 1
# end

### COUNT UP
# count = 1

# until count > 10
#   puts count
#   count += 1
# end

### PRINT WHILE
# numbers = []

# while numbers.size < 5
#   numbers << rand(0..99)
# end

# puts numbers

### SAY HELLO
# say_hello = true
# counter = 1

# while say_hello
#   puts 'Hello!'
#   counter += 1
#   say_hello = false if counter > 5
# end

### LOOP ON COMMAND
# loop do
#   puts 'Should I stop looping?'
#   answer = gets.chomp
#   break if answer == 'yes'
# end

### CONTROL THE LOOP
# iterations = 1

# loop do
#   puts "Number of iterations = #{iterations}"
#   break if iterations >= 5
#   iterations += 1
# end

### LOOPCEPTION
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


### 10 GREET YOUR FRIENDS
# friends = ['Sarah', 'John', 'Hannah', 'Dave']

# for friend in friends
#   puts "Hello, #{friend}!"
# end

### 9 THAT'S ODD
# for i in 1..10
#   puts i if i.odd?
# end

### 8 PRINT UNTIL
# numbers = [7, 9, 13, 25, 18]

# until numbers.size == 0
#   puts numbers.shift
# end

# index = 0

# until index == numbers.size
#   puts numbers[index]
#   index += 1
# end

# p numbers

### 7 COUNT UP
# count = 1

# until count > 10
#   puts count
#   count += 1
# end

### 6 PRINT WHILE
# numbers = []

# while numbers.size < 5
#   numbers << rand(100)
# end

# puts numbers

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
