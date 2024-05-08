### 11 LIST OF DIGITS
=begin
Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

PROBLEM 4:40
input: integer
  - positive
output: array
  - each element is a digit from the input integer
  - digits are in same order as in input integer

EXAMPLE

DATA STRUCTURES
- needs
  - way to get each successive separate digit

- input: integer
  - empty array to hold digits
  - quotient and remainder of dividing integer by 10: 1234, 5
  - remainder prepended to array, quotient becomes new number to be divided
- output: array

ALGORITHM
- create an empty array to hold digits
- divide integer by 10
- prepend remainder to array
- set integer to equal quotient
- repeat until quotient = 0
- return array
=end

# def digit_list(number)
#   result = []
#   loop do
#     number, remainder = number.divmod(10)
#     result.prepend(remainder)
#     break if number == 0
#   end
#   result
# end

# def digit_list(number)
#   number.to_s.size.times.map do
#     number, remainder = number.divmod(10)
#     remainder
#   end.reverse
# end

def digit_list(number)
  number.to_s.chars.map(&:to_i)
end

p digit_list(12345) == [1, 2, 3, 4, 5]
p digit_list(7) == [7]
p digit_list(375290) == [3, 7, 5, 2, 9, 0]
p digit_list(444) == [4, 4, 4]



### 9 DAILY DOUBLE
=begin
Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

PROBLEM 6:56
input: string
  - can be empty

output: new string
  - all consecutive duplicate characters collapsed into a single character
  - if input string is empty, return empty string
  - size cannot be determined based on size of input string

EXAMPLES

DATA STRUCTURES
- needs
  - way to consider each character individually
  - way to detect consecutive duplicate characters
  - way to remove all but one of those characters

- input: string
  - array of individual characters, with their indexes
- output: string

ALGORITHM
- create an array of individual characters in the input string
- for each character, select it unless the next character is the same
- form the selected characters into a string and return it
=end

# def crunch(string)
#   chars = string.chars
#   chars.select.with_index { |char, index| char != chars[index + 1] }.join
# end

# p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# p crunch('4444abcabccba') == '4abcabcba'
# p crunch('ggggggggggggggg') == 'g'
# p crunch('a') == 'a'
# p crunch('') == ''

### 8 ALPHABETICAL NUMBERS
# NUMBER_WORDS = %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)

# # def alphabetic_number_sort(numbers)
# #   numbers.sort_by { |number| NUMBER_WORDS[number] }
# # end

# def alphabetic_number_sort(numbers)
#   numbers.sort { |a, b| NUMBER_WORDS[a] <=> NUMBER_WORDS[b] }
# end

# p alphabetic_number_sort((0..19).to_a) == [
#   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#   6, 16, 10, 13, 3, 12, 2, 0
# ]


### 11.2 LIST OF DIGITS
# def digit_list(integer)
#   integer.digits.reverse
# end

# def digit_list(number)
#   number.to_s.chars.map(&:to_i)
# end

# def digit_list(integer)
#   digits = []
#   loop do
#     integer, remainder = integer.divmod(10)
#     digits.prepend(remainder)
#     break if integer == 0
#   end
#   digits
# end

# def digit_list(integer)
#   Array.new(integer.to_s.size).map do |digit|
#     integer, remainder = integer.divmod(10)
#     remainder
#   end.reverse
# end

# def digit_list(integer)
#   Array.new(Math.log10(integer).to_i + 1).map do |digit|
#     integer, remainder = integer.divmod(10)
#     remainder
#   end.reverse
# end

# p digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# p digit_list(7) == [7]                     # => true
# p digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# p digit_list(444) == [4, 4, 4]             # => true

### 10.2 SPIN ME AROUND IN CIRCLES
# def spin_me(str)
#   str.split.each do |word|
#     word.reverse!
#   end.join(" ")
# end

# spin_me("hello world") # "olleh dlrow"

### 9.2 DDAAIILLYY DDOOUUBBLLEE
# def crunch(string)
#   string.chars.select.with_index do |_, index|
#     string[index] != string[index + 1]
#   end.join
# end

# def crunch(string)
#   string.each_char.with_object('') do |character, result|
#     result << character unless character == result[-1]
#   end
# end

# def crunch(string)
#   string.chars.chunk { |character| character }.map(&:first).join
# end

# p crunch('4444abcabccba') == '4abcabcba'
# p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# p crunch('ggggggggggggggg') == 'g'
# p crunch('a') == 'a'
# p crunch('') == ''

### 8.2 ALPHABETICAL NUMBERS
# NUMBERS = (0..19).to_a
# NUMBER_WORDS = %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
# NUMBERS_TO_WORDS = NUMBERS.zip(NUMBER_WORDS).to_h

# def alphabetic_number_sort(numbers)
#   words = numbers.map { |number| NUMBERS_TO_WORDS[number] }.sort
#   words.map { |word| NUMBERS_TO_WORDS.key(word) }
# end

###
# NUMBER_WORDS = %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)

# def alphabetic_number_sort(numbers)
#   numbers.sort_by { |number| NUMBER_WORDS[number] }
# end
###

###
# SORTED_INTEGERS = [
#   8, 18, 11, 15, 5, 4, 14, 9, 19, 1,
#   7, 17, 6, 16, 10, 13, 3, 12, 2, 0
# ]

# def alphabetic_number_sort(numbers)
#   numbers.sort_by { |number| SORTED_INTEGERS.index(number) }
# end
###

# p alphabetic_number_sort((0..19).to_a) == [
#   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#   6, 16, 10, 13, 3, 12, 2, 0
# ]

### 7.2 LETTER COUNTER II
# def word_sizes(string)
#   clean_string = string.downcase.delete('^ a-z')
#   sizes = clean_string.split.map(&:size)
#   sizes.map { |size| [size, sizes.count(size)] }.to_h
# end

# p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
# p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
# p word_sizes('') == {}
# p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }

### 6.2 LETTER COUNTER I
# def word_sizes(words)
#   sizes = words.split.map(&:size)
#   counts = sizes.uniq.map { |size| sizes.count(size) }
#   sizes.uniq.zip(counts).to_h
# end

# def word_sizes(string)
#   sizes = string.split.map(&:size)
#   sizes.each_with_object({}) { |size, result| result[size] = sizes.count(size) }
# end

# def word_sizes(string)
#   sizes = string.split.map(&:size)
#   sizes.map { |size| [size, sizes.count(size)] }.to_h
# end

###
# def word_sizes(string)
#   sizes = get_word_sizes(string)
#   get_size_counts(sizes)
# end

# def get_word_sizes(string)
#   string.split.map(&:size)
# end

# def get_size_counts(sizes)
#   sizes.map { |size| [size, sizes.count(size)] }.to_h
# end
###

# def word_sizes(string)
#   string.split.map(&:size).tally
# end

# p word_sizes('Four score and seven.')# == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!')# == { 3 => 5, 6 => 1, 7 => 2 }
# p word_sizes("What's up doc?")# == { 6 => 1, 2 => 1, 4 => 1 }
# p word_sizes('')# == {}

### 5.2 CLEAN UP THE WORDS
# def cleanup(string)
#   string.chars.map do |character|
#     ('a'..'z').include?(character) ? character : ' '
#   end.join.squeeze(' ')
# end

# def cleanup(string)
#   string.each_char.map do |character|
#     ('a'..'z').include?(character) ? character : ' '
#   end.join.squeeze(' ')
# end

# def cleanup(text)
#   text.gsub(/[^a-z]/, ' ').squeeze(' ')
# end

# string = ("---what's my +*& line?")
# p string.object_id
# p new_string = cleanup(string)
# p string.object_id
# p new_string.object_id

### 4.2 LETTER SWAP
# def swap(string)
#   string.split.each { |word| word[0], word[-1] = word[-1], word[0] }.join(' ')
# end

# p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# p swap('Abcde') == 'ebcdA'
# p swap('a') == 'a'

####
=begin
The reason the example in Further Exploration doesn't work is because it utilizes reassignment. The values referenced by `word[0]` and `word[-1]` are passed in to the method as arguments. The local variables `a` and `b` are initialized and assigned those respective values. Then `a` and `b` are reassigned within the method to point to different objects. `word[0]` and `word[-1]` still reference the original objects and their values remain unchanged.
=end
# def swap_first_last_characters(a, b)
#   a, b = b, a
# end

# swap_first_last_characters(word[0], word[-1])

=begin
By contrast, the original method uses indexed assignment (the `[]=` method), which mutates the calling object. Each String object passed in to `swap_first_last_characters` as an argument is assigned to the variable `word`, and then that object is mutated via calls to the `[]=` method.
=end
# def swap_first_last_characters(word)
#   word[0], word[-1] = word[-1], word[0]
#   word
# end

# def swap(words)
#   result = words.split.map do |word|
#     swap_first_last_characters(word)
#   end
#   result.join(' ')
# end
=begin
For this reason you could also use `#each` instead of `#map`. The `#each` method returns its calling array, while `#map` returns a new array. Whenever we're transforming array elements `#map` seems like a natural choice. But in this instance, because the objects in the calling array are mutated, that array contains references to the same objects as the new array that `#map` would return.
=end
# def swap(words)
#   words.split.each do |word|
#     swap_first_last_characters(word)
#   end.join(' ')
# end

### 3.2 AFTER MIDNIGHT II
# require 'time'
# MINUTES_PER_HOUR = 60
# HOURS_PER_DAY = 24
# MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY # 1440

# def after_midnight(time)
#   time = Time.parse(time)
#   (time.hour * MINUTES_PER_HOUR) + time.min
# end

# def before_midnight(time)
#   delta = after_midnight(time)
#   (MINUTES_PER_DAY - delta) % MINUTES_PER_DAY
# end

###

# def after_midnight(time)
#   hours, minutes = [0, -2].map { |index| time[index, 2].to_i }
#   normalized_hours = hours % HOURS_PER_DAY
#   (normalized_hours * MINUTES_PER_HOUR) + minutes
# end

# def before_midnight(time)
#   delta = after_midnight(time)
#   (MINUTES_PER_DAY - delta) % MINUTES_PER_DAY
# end

# p after_midnight('00:00') == 0
# p before_midnight('00:00') == 0
# p after_midnight('12:34') == 754
# p before_midnight('12:34') == 686
# p after_midnight('24:00') == 0
# p before_midnight('24:00') == 0

### 2.2 AFTER MIDNIGHT I
# MIDNIGHT = Time.new(2023, 1, 1) # 1/1/23 is the first Sunday in 2023
# SECONDS_PER_MINUTE = 60

# def time_of_day(minutes)
#   time = get_time(minutes)
#   format_time(time)
# end

# def get_time(minutes)
#   seconds = minutes * SECONDS_PER_MINUTE
#   MIDNIGHT + seconds
# end

# def format_time(time)
#   time.strftime('%A %R')
# end

# p time_of_day(0) == "Sunday 00:00"
# p time_of_day(-3) == "Saturday 23:57"
# p time_of_day(35) == "Sunday 00:35"
# p time_of_day(-1437) == "Saturday 00:03"
# p time_of_day(3000) == "Tuesday 02:00"
# p time_of_day(800) == "Sunday 13:20"
# p time_of_day(-4231) == "Thursday 01:29"

###
# require 'time'

# MIDNIGHT = Time.parse("00:00") # midnight of current date
# SECONDS_PER_MINUTE = 60

# def time_of_day(minutes)
#   time = get_time(minutes)
#   format_time(time)
# end

# def get_time(minutes)
#   seconds = minutes * SECONDS_PER_MINUTE
#   MIDNIGHT + seconds
# end

# def format_time(time)
#   time.strftime('%R')
# end

###
# MINUTES_PER_DAY = 1440
# MINUTES_PER_HOUR = 60

# def time_of_day(minutes)
#   hours_and_minutes = get_hours_and_minutes(minutes)
#   format_time(hours_and_minutes)
# end

# def get_hours_and_minutes(minutes)
#   relevant_minutes = minutes % MINUTES_PER_DAY
#   relevant_minutes.divmod(MINUTES_PER_HOUR)
# end

# def format_time(hours_and_minutes)
#   hours_and_minutes.map { |unit| sprintf('%02d', unit)}.join(':')
# end

# p time_of_day(0) == "00:00"
# p time_of_day(-3) == "23:57"
# p time_of_day(35) == "00:35"
# p time_of_day(-1437) == "00:03"
# p time_of_day(3000) == "02:00"
# p time_of_day(800) == "13:20"
# p time_of_day(-4231) == "01:29"

### 1.2 ASCII STRING VALUE
# def ascii_value(string)
#   string.chars.reduce(0) { |result, char| result + char.ord }
# end

# def ascii_value(string)
#   string.chars.map(&:ord).sum
# end

# def ascii_value(string)
#   string.sum
# end

# p ascii_value('Four score') == 984
# p ascii_value('Launch School') == 1251
# p ascii_value('a') == 97
# p ascii_value('') == 0

### 11 LIST OF DIGITS
# def digit_list(int)
#   int.digits.reverse
# end

# def digit_list(int)
#   current_num = int
#   result = []
#   loop do
#     current_num, digit = current_num.divmod(10)
#     result.prepend(digit)
#     break if current_num == 0
#   end
#   result
# end


# p digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# p digit_list(7) == [7]                     # => true
# p digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# p digit_list(444) == [4, 4, 4]             # => true

### 10 SPIN ME AROUND IN CIRCLES
# def spin_me(str)
#   p "str = '#{str}', id: #{str.object_id}, start of method"
#   puts
#   result = str.split.each do |word|
#     p "str = '#{str}', id: #{str.object_id}, inside block"
#     p "word = '#{word}', id: #{word.object_id}"
#     puts
#     word.reverse!
#     p "str = '#{str}', id: #{str.object_id}, inside block"
#     p "word = '#{word}', id: #{word.object_id}"
#     puts
#     word
#   end.join(" ")
#   p "str = '#{str}', id: #{str.object_id}, end of method"
#   p "result = '#{result}', id: #{result.object_id}, end of method"
#   result
# end

# string1 = "hello world"
# p "string1 = '#{string1}', id: #{string1.object_id}, before method call"
# puts
# string2 = spin_me(string1)
# puts
# p "string2 = '#{string2}', id: #{string2.object_id}, after method call"
# p "string1 = '#{string1}', id: #{string1.object_id}, after method call"

# string1 = "hello" #1
# p string1 # => "hello"
# p string1.object_id # => 60
# puts

# array1 = string1.split #2
# p array1 # => ["hello"]
# p array1.object_id # => 80
# p array1[0] # => "hello"
# p array1[0].object_id # => 100
# puts

# array1.each do |word| #4
#   p word # => "hello"
#   p word.object_id # => 100
# end
# puts

# string2 = array1.join #6
# p string2 # => "hello"
# p string2.object_id # => 120

### 9 DDAAIILLYY DDOOUUBBLLEE
# def crunch(string)
#   new_string = ''
#   string.each_char do |char|
#     new_string << char unless char == new_string[-1]
#   end
#   new_string
# end

# def crunch(input_string)
#   input_string.each_char.with_object("") do |char, new_string|
#     new_string << char unless char == new_string[-1]
#   end
# end

# p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# p crunch('4444abcabccba') == '4abcabcba'
# p crunch('ggggggggggggggg') == 'g'
# p crunch('a') == 'a'
# p crunch('') == ''

### 8 ALPHABETICAL NUMBERS
# INTEGERS = (0..19).to_a
# WORDS = %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
# INTEGERS_TO_WORDS = INTEGERS.zip(WORDS).to_h
# { 0=>"zero",      1=>"one",         2=>"two",       3=>"three",
#   4=>"four",      5=>"five",        6=>"six",       7=>"seven",
#   8=>"eight",     9=>"nine",        10=>"ten",      11=>"eleven",
#   12=>"twelve",   13=>"thirteen",   14=>"fourteen", 15=>"fifteen",
#   16=>"sixteen",  17=>"seventeen",  18=>"eighteen", 19=>"nineteen"}

# SORTED_INTEGERS = [
#   8, 18, 11, 15, 5,
#   4, 14, 9, 19, 1,
#   7, 17, 6, 16, 10,
#   13, 3, 12, 2, 0
# ]

# def alphabetic_number_sort(int_array)
#   int_array.sort do |int1, int2|
#     WORDS[int1] <=> WORDS[int2]
#   end
# end

# def alphabetic_number_sort(int_array)
#   int_array.sort_by { |int| WORDS[int] }
# end

# def alphabetic_number_sort(int_array)
#   int_words = int_array.map { |int| INTEGERS_TO_WORDS[int] }.sort
#   int_words.map { |word| INTEGERS_TO_WORDS.key(word) }
# end

# def alphabetic_number_sort(int_array)
#   sorted_array = []
#   int_array.map do |int|
#     sorted_array[SORTED_INTEGERS.index(int)] = int
#   end
#   sorted_array.compact
# end

# def alphabetic_number_sort(int_array)
#   sorted_array = int_array.map.with_object([]) do |int, array|
#     array[SORTED_INTEGERS.index(int)] = int
#   end.compact
# end

# def alphabetic_number_sort(int_array)
#   sorted_array = []
#   index = 0
#   SORTED_INTEGERS.each do |int|
#     if int_array.include?(int)
#       sorted_array[index] = int
#       index += 1
#     end
#   end
#   sorted_array
# end

# def alphabetic_number_sort(int_array)
#   SORTED_INTEGERS.intersection(int_array)
# end

# def alphabetic_number_sort(int_array)
#   int_array.sort_by { |int| SORTED_INTEGERS.index(int) }
# end

# p alphabetic_number_sort([1, 2, 3, 3, 3, 4, 5])
# p alphabetic_number_sort((0..9).to_a)
# p alphabetic_number_sort((0..19).to_a) == [
#   8, 18, 11, 15, 5,
#   4, 14, 9, 19, 1,
#   7, 17, 6, 16, 10,
#   13, 3, 12, 2, 0
# ]

### 7 LETTER COUNTER II
# def word_sizes(string)
#   words = string.split.map { |word| word.gsub(/[^[:alpha:]]/, '') }
#   words.each_with_object(Hash.new(0)) { |word, hash| hash[word.size] += 1 }
# end

# def word_sizes(string)
#   string.split.each_with_object(Hash.new(0)) do |word, hash|
#     hash[word.count('A-Za-z')] += 1
#   end
# end

# def word_sizes(words_string)
#   counts = Hash.new(0)
#   words_string.split.each do |word|
#     clean_word = word.delete('^A-Za-z')
#     counts[clean_word.size] += 1
#   end
#   counts
# end

# p word_sizes('[Four] score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
# p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
# p word_sizes('') == {}

### 6 LETTER COUNTER I
# def word_sizes(string)
#   sizes = Hash.new(0)
#   string.split.each { |word| sizes[word.size] += 1 }
#   sizes
# end

# def word_sizes(string)
#   string.split.map {|word| word.size}.tally
# end

# def word_sizes(string)
#   string.split.each_with_object(Hash.new(0)) do |word, hash|
#     hash[word.size] += 1
#   end
# end

# def word_sizes(string)
#   string.split.each_with_object({}) do |word, hash|
#     hash[word.size] = string.split.map {|word| word.size}.count(word.size)
#   end
# end

# def word_sizes(string)
#   words = string.split
#   sizes = Hash.new do |hash, key|
#     hash[key] = words.map {|word| word.size}.count(key)
#   end
#   words.each { |word| sizes[word.size] }
#   sizes
# end

# def word_sizes(string)
#   word_sizes = string.split.map { |word| word.size }
#   size_counts = Hash.new do |hash, key|
#     hash[key] = word_sizes.count(key)
#   end
#   word_sizes.uniq.each { |size| size_counts[size] }
#   size_counts
# end

# p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# p word_sizes('') == {}

### 5 CLEAN UP THE WORDS
# def cleanup(string)
#   cleaned_up = string.chars.map { |char| ('a'..'z').include?(char) ? char : ' ' }
#   string = cleaned_up.join.squeeze(' ')
#   p string
# end

# p cleanup("---what's my +*& line?") == ' what s my line '

### 4 LETTER SWAP
# def swap(string)
#   words = string.split
#   words.each { |word| word[0], word[-1] = word[-1], word[0] }
#   words.join(' ')
# end

# def swap(string)
#   string.split.each { |word| word[0], word[-1] = word[-1], word[0] }.join(' ')
# end

# p swap('Oh what a wonderful day it is') #== 'hO thaw a londerfuw yad ti si'
# p swap('Abcde') #== 'ebcdA'
# p swap('a') #== 'a'

### 3 AFTER MIDNIGHT II
# SECONDS_PER_MINUTE = 60
# MINUTES_PER_DAY = 1440
# CURRENT_YEAR = Time.now.year
# MIDNIGHT = Time.new(CURRENT_YEAR)

# def get_time(time_string)
#   hours, minutes = time_string[0..1].to_i, time_string[3..4].to_i
#   time = Time.new(CURRENT_YEAR, 1, 1, hours, minutes)
# end

# def after_midnight(time_string)
#   time = get_time(time_string)
#   (((time - MIDNIGHT) / SECONDS_PER_MINUTE).to_i) % MINUTES_PER_DAY
# end

# def before_midnight(time_string)
#   (MINUTES_PER_DAY - after_midnight(time_string)) % MINUTES_PER_DAY
# end

# p after_midnight('00:00') #== 0
# p before_midnight('00:00') #== 0
# p after_midnight('12:34') #== 754
# p before_midnight('12:34') #== 686
# p after_midnight('24:00') #== 0
# p before_midnight('24:00') #== 0

# MINUTES_PER_HOUR = 60
# MINUTES_PER_DAY = 1440

# def get_total_minutes(time)
#   hours, minutes = time[0..1].to_i, time[3..4].to_i
#   total_minutes = (hours * MINUTES_PER_HOUR) + minutes
# end

# def after_midnight(time)
#   get_total_minutes(time) % MINUTES_PER_DAY
# end

# def before_midnight(time)
#   MINUTES_PER_DAY - get_total_minutes(time)) % MINUTES_PER_DAY
# end

# def get_total_minutes(time, direction)
#   hours, minutes = time[0..1].to_i, time[3..4].to_i
#   if direction == 'after' && hours == 24
#     hours = 0
#   elsif direction == 'before' && hours == 0
#     hours = 24
#   end
#   total_minutes = (hours * MINUTES_PER_HOUR) + minutes
# end

# def after_midnight(time)
#   get_total_minutes(time, 'after')
# end

# def before_midnight(time)
#   MINUTES_PER_DAY - get_total_minutes(time, 'before')
# end

### 2 AFTER MIDNIGHT I
# SECONDS_PER_MINUTE = 60
# MIDNIGHT = Time.new(2023, 4, 16)

# def time_of_day(num)
#   (MIDNIGHT + (num * SECONDS_PER_MINUTE)).strftime("%A %R")
# end

# p time_of_day(0) == "Sunday 00:00"
# p time_of_day(-3) == "Saturday 23:57"
# p time_of_day(35) == "Sunday 00:35"
# p time_of_day(-1437) == "Saturday 00:03"
# p time_of_day(3000) == "Tuesday 02:00"
# p time_of_day(800) == "Sunday 13:20"
# p time_of_day(-4231) == "Thursday 01:29"

# MINUTES_PER_HOUR = 60
# MINUTES_PER_DAY = 1440

# def format_string(int)
#   int < 10 ? int.to_s.prepend('0') : int.to_s
# end

# def time_of_day(num)
#   normalized_minutes = num % MINUTES_PER_DAY
#   hrs_and_mins = normalized_minutes.divmod(MINUTES_PER_HOUR)
#   hrs_and_mins.map! { |ele| format_string(ele) }
#   "#{hrs_and_mins[0]}:#{hrs_and_mins[1]}"
# end

# p time_of_day(0) #== "00:00"
# p time_of_day(-3) #== "23:57"
# p time_of_day(35) #== "00:35"
# p time_of_day(-1437) #== "00:03"
# p time_of_day(3000) #== "02:00"
# p time_of_day(800) #== "13:20"
# p time_of_day(-4231) #== "01:29"

### 1 ASCII STRING VALUE
# def ascii_value(string)
#   sum = 0
#   string.chars.each { |char| sum += char.ord }
#   sum
# end

# def ascii_value(string)
#   string.chars.each_with_object([]) { |char, ords| ords << char.ord }.sum
# end

# def ascii_value(string)
#   string.each_char.inject(0) { |sum, char| sum + char.ord }
# end

# def ascii_value(string)
#   string.chars.map { |char| char.ord }.sum
# end

# def ascii_value(string)
#   string.sum
# end


# p ascii_value('Four score') == 984
# p ascii_value('Launch School') == 1251
# p ascii_value('a') == 97
# p ascii_value('') == 0
