### 4.3 SWAP CASE
=begin
Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

You may not use String#swapcase; write your own version of this method.

PROBLEM 12:10
input: string
  - can contain any type of character

output: string
  - all alpha characters have their case swapped
  - all other characters remain unchanged

EXAMPLES

DATA STRUCTURES
- needs:
  - way to access each individual character
  - way to identify alpha characters
  - way to swap case for alpha characters

- input: string
  - array of individual characters
  - array of all lowercase letters
  - array of all uppercase letters
  - array of all letters?
- output: string

ALGORITHM
- create an array of all lowercase letters in alphabetical order
- create an array of all uppercase letters in alphabetical order
- create an array of the individual characters in the input string
- for each character
  - swap case if it is an alphabetical character
    - lower to upper
    - upper to lower
  - otherwise leave as is
- create a string from the characters array, and return it
=end
# UPPERCASE = ('A'..'Z').to_a
# LOWERCASE = ('a'..'z').to_a
# ALL_LETTERS = UPPERCASE + LOWERCASE

# def swapcase(string)
#   string.chars.map do |char|
#     ALL_LETTERS.include?(char) ? change_case(char) : char
#   end.join
# end

# def change_case(char)
#   index = UPPERCASE.index(char) || LOWERCASE.index(char)
#   UPPERCASE.include?(char) ? LOWERCASE[index] : UPPERCASE[index]
# end

###
# UPPERCASE = ('A'..'Z').to_a
# LOWERCASE = ('a'..'z').to_a
# SWAP_HASH = (UPPERCASE.zip(LOWERCASE) + LOWERCASE.zip(UPPERCASE)).to_h

# def swapcase(string)
#   string.chars.map { |char| SWAP_HASH[char] || char }.join
# end
###

# def swapcase(string)
#   string.chars.map { |chr| chr == chr.upcase ? chr.downcase : chr.upcase }.join
# end

# p swapcase('PascalCase') == 'pASCALcASE'
# p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'



### 3.3 CAPITALIZE
=begin
Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase.

You may assume that words are any sequence of non-blank characters.

PROBLEM 8:00
input: string
  - contains 'words':
    - word = any sequence of non-blank characters
output: new string
  - first character of every word capitalized
  - all other letters lowercase
    - javaScript => Javascript
  - if first character is not a letter, then word is not capitalized
    - "quoted" => "quoted"

EXAMPLES

DATA STRUCTURES
- needs:
  - way to identify 'words'
  - way to access each word
  - ways to capitalize first letter and lowercase all others

ALGORITHM
- create an array of individual words from input string
- for each word
  - lowercase the entire word
  - capitalize the first letter
- create a string from the array and return ti
=end

# def word_cap(string)
#   string.split.map(&:capitalize).join(' ')
# end

# def word_cap(string)
#   string.downcase.split.map { |word| word[0].upcase + word[1..-1] }.join(' ')
# end

# def word_cap(string)
#   string.downcase.split.map do |word|
#     word.chars.map.with_index { |char, idx| idx == 0 ? char.upcase : char }.join
#   end.join(' ')
# end

# LOWERCASE = ('a'..'z').to_a
# UPPERCASE = ('A'..'Z').to_a
# ALL_LETTERS = LOWERCASE + UPPERCASE

# def word_cap(string)
#   string.split.map do |word|
#     word.chars.map.with_index { |char, index| change_case(char, index) }.join
#   end.join(' ')
# end

# def change_case(char, index)
#   if ALL_LETTERS.include?(char)
#     char_index = LOWERCASE.index(char) || UPPERCASE.index(char)
#     index == 0 ? UPPERCASE[char_index] : LOWERCASE[char_index]
#   else
#     char
#   end
# end

# def word_cap(string)
#   string.split.map do |word|
#     word.each_char.with_index.map do |char, index|
#       index == 0 ? change_case(char, 'upper') : change_case(char, 'lower')
#     end.join
#   end.join(' ')
# end

# def change_case(character, target_case)
#   original_case = target_case == 'upper' ? LOWERCASE : UPPERCASE
#   new_case = target_case == 'upper' ? UPPERCASE : LOWERCASE

#   if original_case.include?(character)
#     index = original_case.index(character)
#     new_case[index]
#   else
#     character
#   end
# end

# puts word_cap('four score and seven') #== 'Four Score And Seven'
# puts word_cap('the javaScript language') #== 'The Javascript Language'
# puts word_cap('this is a "quoted" word') #== 'This Is A "quoted" Word'




### 2.3 LETTERCASE COUNTER
=begin
Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one represents the number of characters that are uppercase letters, and one represents the number of characters that are neither.

PROBLEM 4:43
input: string
  - can contain any type of character
  - can be empty

output: hash
  - contains three key-value pairs
    - keys are: lowercase, uppercase, neither
    - values are numbers of characters in those categories
  - values sum to size of input string
  - key still appears even if value is 0

EXAMPLES

DATA STRUCTURES
- needs:
  - way to access each character individually
  - way to determine category of each character
  - way to record count of each category

- input: string
  - empty hash with default value of 0
  - array of individual characters
  - array of category names
- output: hash

ALGORITHM
- create arrays of uppercase letters and lowercase letters
- create an empty array with a default value of 0
- create an array of categories
- for each category, get the count of number of characters that belong to that category
  - i.e. are included in the appropriate letter array
  - for the neither category, subtract (lower + upper) from string length
  - create a key-value pair in the output hash
- return the hash
=end
# UPPERCASE = ('A'..'Z').to_a
# LOWERCASE = ('a'..'z').to_a

# def letter_case_count(string)
#   counts = {lowercase: 0, uppercase: 0, neither: 0}
#   string.chars.each do |char|
#     counts[:lowercase] += 1 if LOWERCASE.include?(char)
#     counts[:uppercase] += 1 if UPPERCASE.include?(char)
#   end
#   counts[:neither] = string.size - (counts[:lowercase] + counts[:uppercase])
#   counts
# end

# def letter_case_count(string)
#   types = [:lowercase, :uppercase, :neither]
#   selectors = ['a-z', 'A-Z', '^A-Za-z']
#   cases = types.zip(selectors).to_h
#   cases.map { |type, selector| [type, string.count(selector)] }.to_h
# end

### 1.3 COMBINE TWO LISTS
=begin
Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

You may assume that both input Arrays are non-empty, and that they have the same number of elements.

PROBLEM 1:08
input: two arrays
  - not empty
  - both contain the same number of elements

output: array
  - contains all elements of both input arrays
  - elements alternate

EXAMPLES

DATA STRUCTURES
- needs:
  - way to access each element in each array
  - way to control interleaving / alternation

- input: two arrays

- output: array

=end

# def interleave(array1, array2)
#   array1.zip(array2).flatten
# end

# def interleave(array1, array2)
#   array1.flat_map.with_index { |element, index| [element, array2[index]] }
# end

# def interleave(array1, array2)
#   info1, info2 = [array1, array2].map.with_index do |array, array_index|
#     array.map.with_index { |element, index| [element, index, array_index] }
#   end

#   both = info1 + info2
#   sorted_both = both.sort_by { |(element, index, rank)| [index, rank] }
#   sorted_both.map { |element, index, rank| element }
# end

# def interleave(array1, array2)
#   (0...array1.size).each_with_object([]) do |index, result|
#     result << array1[index] << array2[index]
#   end
# end

# p interleave([1, 2, 3], ['a', 'b', 'c']) #== [1, 'a', 2, 'b', 3, 'c']



### 11.2 HOW MANY
###
# def count_occurrences(array)
#   counts = get_counts(array)
#   display_counts(counts)
# end

# def get_counts(array)
#   types = array.map(&:downcase)
#   types.each_with_object(Hash.new(0)) { |type, counts| counts[type] += 1 }
# end

# def display_counts(hash)
#   hash.each { |type, count| puts "#{type} => #{count}" }
# end
###

# def count_occurrences(array)
#   array.map(&:downcase).tally.each { |type, count| puts "#{type} => #{count}" }
# end

# vehicles = [
#   'car', 'Car', 'truck', 'car', 'SUV', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck', 'suv'
# ]

# count_occurrences(vehicles)

### 10.2 THE END IS NEAR BUT NOT HERE
# def middle_word(sentence)
#   words = sentence.split
#   middle = (words.size / 2.0).ceil - 1
#   number = words.size.even? ? 2 : 1
#   words.empty? ? '' : words[middle, number].join(' ')
# end

# p middle_word('In the middle of things') == 'middle'
# p middle_word('Find the middle word') == 'the middle'
# p middle_word('     ') == ''
# p middle_word('') == ''

# def penultimate(sentence)
#   sentence.split[-2]
# end

# p penultimate('last word') == 'last'
# p penultimate('Launch School is great!') == 'is'

### 9.2 MULTIPLY ALL PAIRS
# def multiply_all_pairs(array1, array2)
#   array1.each_with_object([]) do |number1, products|
#     array2.each { |number2| products << number1 * number2 }
#   end.sort
# end

# def multiply_all_pairs(array1, array2)
#   array1.map do |number1|
#     array2.map { |number2| number1 * number2 }
#   end.flatten.sort
# end

# def multiply_all_pairs(array1, array2)
#   array1.product(array2).map { |pair| pair.inject(:*) }.sort
# end

# p multiply_all_pairs([2, 4], [4, 3, 1, 2]) #== [2, 4, 4, 6, 8, 8, 12, 16]

### 8.2 MULTIPLY LISTS
# def multiply_list(array1, array2)
#   array1.map.with_index { |number, index| number * array2[index] }
# end

# def multiply_list(array1, array2)
#   array1.each_index.map { |index| array1[index] * array2[index] }
# end

# def multiply_list(array1, array2)
#   array1.zip(array2).map { |pair| pair.inject(:*)}
# end

# p multiply_list([3, 5, 7], [9, 10, 11]) #== [27, 50, 77]

### 7.2 MULTIPLICATIVE AVERAGE
# def show_multiplicative_average(array)
#   product = array.inject(:*)
#   result = product / array.size.to_f
#   formatted_result = sprintf("%.3f", result)
#   puts "The result is #{formatted_result}"
# end

# def show_multiplicative_average(array)
#   puts "The result is #{sprintf("%.3f", (array.inject(:*).fdiv(array.size)))}"
# end

# def show_multiplicative_average(array)
#   result = array.inject(:*).fdiv(array.size)
#   puts "The result is #{sprintf("%.3f", result)}"
# end

# show_multiplicative_average([3, 5])                # => The result is 7.500
# show_multiplicative_average([6])                   # => The result is 6.000
# show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

### 6.2 STAGGERED CAPS II
# LETTERS = ('A'..'Z').to_a + ('a'..'z').to_a

# def staggered_case(string)
#   uppercase = false
#   string.chars.map do |char|
#     next char unless LETTERS.include?(char)
#     uppercase = !uppercase
#     uppercase ? char.upcase : char.downcase
#   end.join
# end

# def staggered_case(string)
#   uppercase = false
#   string.chars.map do |char|
#     next char unless char =~ /[a-z]/i
#     # next char if char =~ /[^a-z]/i
#     uppercase = !uppercase
#     uppercase ? char.upcase : char.downcase
#   end.join
# end

# def staggered_case(string)
#   uppercase = true
#   string.chars.each_with_object('') do |char, new_string|
#     next new_string << char unless LETTERS.include?(char)
#     new_string << (uppercase ? char.upcase : char.downcase)
#     uppercase = !uppercase
#   end
# end

# def staggered_case(string)
#   uppercase = true
#   string.chars.each_with_object('') do |char, new_string|
#     next new_string << char unless char =~ /[a-z]/i
#     new_string << (uppercase ? char.upcase : char.downcase)
#     uppercase = !uppercase
#   end
# end

# def staggered_case(string, start_upper: true, count_non_letters: true)
#   string.chars.each_with_object('') do |char, new_string|
#     if count_non_letters
#       new_string << (start_upper ? char.upcase : char.downcase)
#     else
#       next new_string << char unless char =~ /[a-z]/i
#       new_string << (start_upper ? char.upcase : char.downcase)
#     end
#     start_upper = !start_upper
#   end
# end

# def staggered_case(string, start_upper: true, count_non_letters: true)
#   string.chars.each_with_object('') do |char, new_string|
#     new_string << (start_upper ? char.upcase : char.downcase)
#     start_upper = !start_upper unless (!count_non_letters && char =~ /[^a-z]/i)
#   end
# end

# string = 'T e s t i n g'
# p staggered_case(string) == 'T E S T I N G'
# p staggered_case(string, start_upper: false) == 't e s t i n g'
# p staggered_case(string, count_non_letters: false) == 'T e S t I n G'
# p staggered_case(string, start_upper: false, count_non_letters: false) == 't E s T i N g'
# p string == 'T e s t i n g'

# p staggered_case('ALL CAPS') == 'AlL cApS'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

### 5.2 STAGGERED CAPS I
# def staggered_case(string)
#   string.chars.map.with_index do |char, idx|
#     idx.even? ? char.upcase : char.downcase
#   end.join
# end

# def staggered_case(string) # MUTATING
#   (0...string.size).each do |idx|
#     string[idx] = idx.even? ? string[idx].upcase : string[idx].downcase
#   end
#   string
# end

# def staggered_case(string) # MUTATING
#   string.size.times do |idx|
#     string[idx] = idx.even? ? string[idx].upcase : string[idx].downcase
#   end
#   string
# end

# def staggered_case(string)
#   string = string.downcase
#   (0...string.size).each do |idx|
#     string[idx] = string[idx].upcase if idx.even?
#   end
#   string
# end

# def staggered_case(string)
#   string.size.times.inject('') do |new_string, idx|
#     new_string << (idx.even? ? string[idx].upcase : string[idx].downcase)
#   end
# end

# def staggered_case(string, start_upper: true)
#   string.size.times.inject('') do |new_string, idx|
#     char = (start_upper ? string[idx].upcase : string[idx].downcase)
#     start_upper = !start_upper
#     new_string << char
#   end
# end

# def staggered_case(string, start_upper: true)
#   string.size.times.inject('') do |new_string, idx|
#     start_upper = !start_upper
#     new_string << (start_upper ? string[idx].downcase : string[idx].upcase)
#   end
# end

# def staggered_case(string, start_upper: true)
#   string.size.times.inject('') do |new_string, idx|
#     start_upper = !start_upper
#     new_string << (start_upper ? string[idx].downcase : string[idx].upcase)
#   end
# end

# def staggered_case(string)
#   string.size.times.each_with_object('') do |idx, new_string|
#     new_string << (idx.even? ? string[idx].upcase : string[idx].downcase)
#   end
# end

# string = 'I Love Launch School!'
# p staggered_case(string) # => "I LoVe lAuNcH ScHoOl!"
# p staggered_case(string, start_upper: false) # => "i lOvE LaUnCh sChOoL!"
# p string # => "I Love Launch School!"

# p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# p staggered_case('ALL_CAPS') == 'AlL_CaPs'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

### 4.2 SWAP CASE
# UPPERCASE = ('A'..'Z').to_a
# LOWERCASE = ('a'..'z').to_a

# def swapcase(string)
#   string.chars.map do |char|
#     change_case(char)
#   end.join
# end

# def change_case(char)
#   if UPPERCASE.include?(char)
#     index = UPPERCASE.index(char)
#     LOWERCASE[index]
#   elsif LOWERCASE.include?(char)
#     index = LOWERCASE.index(char)
#     UPPERCASE[index]
#   else
#     char
#   end
# end

# def change_case(char)
  # if UPPERCASE.index(char)
  #   LOWERCASE[UPPERCASE.index(char)]
  # elsif LOWERCASE.index(char)
  #   UPPERCASE[LOWERCASE.index(char)]
  # else
  #   char
  # end
# end

# def change_case(char)
#   return char unless (UPPERCASE + LOWERCASE).include?(char)
  # if UPPERCASE.include?(char)
  #   LOWERCASE[UPPERCASE.index(char)]
  # else
  #   UPPERCASE[LOWERCASE.index(char)]
  # end
# end

# def swapcase(string)
#   string.chars.inject('') do |result, char|
#     if UPPERCASE.include?(char)
#       result << LOWERCASE[UPPERCASE.index(char)]
#     elsif LOWERCASE.include?(char)
#       result << UPPERCASE[LOWERCASE.index(char)]
#     else
#       result << char
#     end
#   end
# end

# def swapcase(string)
#   string.chars.inject('') do |result, char|
#     next result << char unless (UPPERCASE + LOWERCASE).include?(char)
#     if UPPERCASE.include?(char)
#       result << LOWERCASE[UPPERCASE.index(char)]
#     else
#       result << UPPERCASE[LOWERCASE.index(char)]
#     end
#   end
# end

# def swapcase(string)
#   string.chars.inject('') do |result, char|
#     next result << char unless (UPPERCASE + LOWERCASE).include?(char)
#     old_case = UPPERCASE.include?(char) ? UPPERCASE : LOWERCASE
#     new_case = UPPERCASE.include?(char) ? LOWERCASE : UPPERCASE
#     result << new_case[old_case.index(char)]
#   end
# end

# def swapcase(string)
#   string.chars.map do |char|
#     next char unless (UPPERCASE + LOWERCASE).include?(char)
#     old_case = UPPERCASE.include?(char) ? UPPERCASE : LOWERCASE
#     new_case = UPPERCASE.include?(char) ? LOWERCASE : UPPERCASE
#     new_case[old_case.index(char)]
#   end.join
# end


# p swapcase('CamelCase') == 'cAMELcASE'
# p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

### 3.2 CAPITALIZE WORDS
# def word_cap(string)
#   string.split.map(&:capitalize).join(' ')
# end

# def word_cap(string)
#   string.split.map do |word|
#     word[0].upcase + word[1..].downcase
#   end.join(' ')
# end

###
# LOWERCASE = ('a'..'z').to_a
# UPPERCASE = ('A'..'Z').to_a

# def word_cap(string)
#   string.split.map do |word|
#     word.each_char.with_index.map do |char, index|
#       index == 0 ? change_case(char, 'upper') : change_case(char, 'lower')
#     end.join
#   end.join(' ')
# end

# def change_case(character, target_case)
#   original_case = target_case == 'upper' ? LOWERCASE : UPPERCASE
#   new_case = target_case == 'upper' ? UPPERCASE : LOWERCASE

#   if original_case.include?(character)
#     index = original_case.index(character)
#     new_case[index]
#   else
#     character
#   end
# end

# p word_cap('four score and seven') == 'Four Score And Seven'
# p word_cap('the javaScript language') == 'The Javascript Language'
# p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

### 2.2
# def letter_case_count(string)
#   lowercase = ('a'..'z').to_a
#   uppercase = ('A'..'Z').to_a
#   case_count = {lowercase: 0, uppercase: 0, neither: 0}

#   string.each_char.with_object(case_count) do |char, case_count|
#     if lowercase.include?(char)
#       case_count[:lowercase] += 1
#     elsif uppercase.include?(char)
#       case_count[:uppercase] += 1
#     else
#       case_count[:neither] += 1
#     end
#   end
# end

# p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

### 1.2 COMBINE TWO LISTS
# def interleave(array1, array2)
#   array1.zip(array2).flatten
# end

# def interleave(array1, array2)
#   (0...array1.size).each_with_object([]) do |index, result|
#     result << array1[index]
#     result << array2[index]
#   end
# end

# def interleave(array1, array2)
#   array1.size.times.with_object([]) do |index, result|
#     result << array1[index]
#     result << array2[index]
#   end
# end

# def interleave(array1, array2)
#   (array1.size * 2).times.map do |index|
#     index.even? ? array1[index / 2] : array2[index / 2]
#   end
# end

# def interleave(array1, array2)
#   (array1.size * 2).times.map do |index|
#     target = index.even? ? array1 : array2
#     target[index / 2]
#   end
# end

# array1 = [1, 2, 3]
# array2 = ['a', 'b', 'c']
# p interleave(array1, array2) == [1, 'a', 2, 'b', 3, 'c']

### 11 HOW MANY
# def count_occurrences(array)
#   array.tally.each { |type, count| puts "#{type} => #{count}" }
# end

# def count_occurrences(array)
#   counts = {}
#   array.uniq.each { |type| counts[type] = array.count(type) }
#   counts.each { |type, count| puts "#{type} => #{count}" }
# end

# def count_occurrences(arr)
#   occs = arr.uniq.each_with_object({}) {|ele, occs| occs[ele] = arr.count(ele)}
#   occs.each { |type, count| puts "#{type} => #{count}" }
# end

# def count_occurrences(arr)
#   occs = arr.each_with_object(Hash.new(0)) { |type, occs| occs[type] += 1 }
#   occs.each { |type, count| puts "#{type} => #{count}" }
# end

# def count_occurrences(array)
#   array.map(&:downcase).tally.each { |type, count| puts "#{type} => #{count}" }
# end

# def count_occurrences(array)
#   occurrences = {}
#   types = array.map(&:downcase)
#   types.uniq.each { |type| occurrences[type] = types.count(type) }
#   occurrences.each { |type, count| puts "#{type} => #{count}" }
# end

# def count_occurrences(array)
#   types = array.map(&:downcase)
#   occurrences = types.each_with_object(Hash.new(0)) do |type, occurrences|
#     occurrences[type] += 1
#   end
#   occurrences.each { |type, count| puts "#{type} => #{count}" }
# end

# def count_occurrences(array)
#   types = array.map(&:downcase)
#   types.uniq.each { |type| puts "#{type} => #{types.count(type)}" }
# end

# vehicles = [
#   'Car', 'car', 'TRUCK', 'CAR', 'SUV', 'truck',
#   'motorcycle', 'Motorcycle', 'car', 'truck', 'suv'
# ]

# count_occurrences(vehicles)

### 10 THE END IS NEAR BUT NOT HERE
# def middle_word(sentence)
#   words = sentence.split
#   middle_index = (words.size / 2.0).ceil - 1
#   words.empty? ? '' : words[middle_index]
# end

# p middle_word('Launch School is great!') == 'School'
# p middle_word('Launch School is really great!') == 'is'
# p middle_word('middle') == 'middle'
# p middle_word(' ') == ''
# p middle_word('') == ''

# def middle_word(sentence) # if even return first word in second half
#   words = sentence.split
#   middle_index = words.size / 2
#   words.empty? ? '' : words[middle_index]
# end

# p middle_word('Launch School is really great!') == 'is'
# p middle_word('Launch School is great!') == 'is'
# p middle_word('middle') == 'middle'
# p middle_word(' ') == ''
# p middle_word('') == ''
# puts

# def middle_word(sentence)
#   words = sentence.split
#   middle_index = (words.size / 2.0).ceil - 1
#   number = words.size.even? ? 2 : 1
#   words.empty? ? '' : words[middle_index, number].join(' ')
# end

# p middle_word('Launch School is great!') == 'School is'
# p middle_word('Launch School is really great!') == 'is'
# p middle_word('middle') == 'middle'
# p middle_word(' ') == ''
# p middle_word('') == ''

# def penultimate(sentence)
#   sentence.split[-2]
# end

# def penultimate(string)
#   clean_string = string.strip.squeeze(' ')
#   spaces = []
#   clean_string.chars.each_with_index do |char, idx|
#     spaces << idx if char == ' '
#   end
#   start = spaces.size < 2 ? 0 : spaces[-2] + 1
#   clean_string[start...spaces[-1]]
# end

# p penultimate('last word') == 'last'
# p penultimate('Launch School is great!') == 'is'
# p penultimate(' last word') == 'last'
# p penultimate('Launch School is great! ') == 'is'
# p penultimate('last   word') == 'last'
# p penultimate('last') == 'last'
# p penultimate(' ') == ''
# p penultimate('') == ''

### 9 MULTIPLY ALL PAIRS
# def multiply_all_pairs(arr1, arr2)
#   arr1.product(arr2).map { |pair| pair.inject(:*) }.sort
# end

# def multiply_all_pairs(arr1, arr2)
#   arr1.each_with_object([]) do |arr1_num, result|
#     arr2.each do |arr2_num|
#       result << arr2_num * arr1_num
#     end
#   end.sort
# end

# def multiply_all_pairs(arr1, arr2)
#   arr1.each_with_object([]) { |n1, res| arr2.each { |n2| res << n2 * n1 } }.sort
# end

# def multiply_all_pairs(arr1, arr2)
#   arr1.map { |num1| arr2.map { |num2| num1 * num2 } }.flatten.sort
# end

# p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

### 8 MULTIPLY LISTS
# def multiply_list(arr1, arr2)
#   arr1.map.with_index { |num, idx| num * arr2[idx] }
# end

# def multiply_list(arr1, arr2)
#   arr1.each_index.map { |idx| arr1[idx] * arr2[idx] }
# end

# def multiply_list(arr1, arr2)
#   arr1.zip(arr2).map { |pair| pair.reduce(:*) }
# end

# def multiply_list(arr1, arr2)
#   arr1.each_with_index.with_object([]) do |(num, idx), result|
#     result << (num * arr2[idx])
#   end
# end

# def multiply_list(arr1, arr2)
#   arr1.each_index.with_object([]) do |idx, result|
#     result << (arr1[idx] * arr2[idx])
#   end
# end

# p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

### 7 MULTIPLICATIVE AVERAGE
# def show_multiplicative_average(array)
#   result = array.reduce(:*) / array.size.to_f
#   puts "The result is #{format("%.3f", result)}"
# end

# def show_multiplicative_average(array)
#   result = array.reduce(:*).fdiv(array.size)
#   puts "The result is #{format("%.3f", result)}"
# end

# show_multiplicative_average([3, 5])                # => result: 7.500
# show_multiplicative_average([6])                   # => result: 6.000
# show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => result: 28361.667

### 6 STAGGERED CAPS II
# UPPER = ('A'..'Z').to_a
# LOWER = ('a'..'z').to_a

# def staggered_case(string, upper: true)
#   string.chars.each_with_object('') do |char, result|
#     next result << char unless (UPPER + LOWER).include?(char)
#     result << (upper ? char.upcase : char.downcase)
#     upper = !upper
#   end
# end

# def staggered_case(string, upper = true)
#   string.chars.each_with_object('') do |char, result|
#     next result << char unless (char.count('^A-Za-z') == 0)
#     result << (upper ? char.upcase : char.downcase)
#     upper = !upper
#   end
# end

# def staggered_case(string, upper = true)
#   string.chars.each_with_object('') do |char, result|
#     next result << char unless char =~ /[a-z]/i
#     result << (upper ? char.upcase : char.downcase)
#     upper = !upper
#   end
# end

# def staggered_case(string, start_upper: true, count_non_alpha: true)
#   string.chars.each_with_object('') do |char, result|
#     if count_non_alpha
#       result << (start_upper ? char.upcase : char.downcase)
#     else
#       next result << char unless char =~ /[a-z]/i
#       result << (start_upper ? char.upcase : char.downcase)
#     end
#     start_upper = !start_upper
#   end
# end

# p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# p staggered_case('ALL_CAPS') == 'AlL_CaPs'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# p staggered_case('I Love Launch School!', count_non_alpha: false) == 'I lOvE lAuNcH sChOoL!'
# p staggered_case('ALL CAPS', count_non_alpha: false) == 'AlL cApS'
# p staggered_case('ignore 77 the 444 numbers', count_non_alpha: false) == 'IgNoRe 77 ThE 444 nUmBeRs'

# p staggered_case('I Love Launch School!', start_upper: false) == "i lOvE LaUnCh sChOoL!"
# p staggered_case('ALL_CAPS', start_upper: false) == "aLl_cApS"
# p staggered_case('ignore 77 the 444 numbers', start_upper: false) == "iGnOrE 77 tHe 444 nUmBeRs"

### 5 STAGGERED CAPS I
# def staggered_case(str)
#   str.each_char.with_index.map do |char, idx|
#     idx.even? ? char.upcase : char.downcase
#   end.join
# end

# UPPERCASE = ('A'..'Z').to_a
# LOWERCASE = ('a'..'z').to_a
# UPPER_TO_LOWER = UPPERCASE.zip(LOWERCASE).to_h

# def staggered_case(string)
#   string.each_char.with_index.map do |char, idx|
#     next char unless (UPPERCASE + LOWERCASE).include?(char)
#     if idx.even?
#       LOWERCASE.include?(char) ? UPPER_TO_LOWER.key(char) : char
#     else
#       UPPERCASE.include?(char) ? UPPER_TO_LOWER[char] : char
#     end
#   end.join
# end

# def staggered_case(string, start_upper: true)
#   string.chars.each_with_object('') do |char, result|
    # result << (start_upper ? char.upcase : char.downcase)
    # start_upper = !start_upper
#   end
# end

# p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# p staggered_case('ALL_CAPS') == 'AlL_CaPs'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# p staggered_case('I Love Launch School!', start_upper: false) == "i lOvE LaUnCh sChOoL!"
# p staggered_case('ALL_CAPS', start_upper: false) == "aLl_cApS"
# p staggered_case('ignore 77 the 444 numbers', start_upper: false) == "iGnOrE 77 tHe 444 nUmBeRs"

###4 SWAP CASE
# UPPERCASE = ('A'..'Z').to_a
# LOWERCASE = ('a'..'z').to_a
# UPPER_TO_LOWER = UPPERCASE.zip(LOWERCASE).to_h
# p UPPER_TO_LOWER

# {
#   "A"=>"a", "B"=>"b", "C"=>"c", "D"=>"d", "E"=>"e", "F"=>"f", "G"=>"g",
#   "H"=>"h", "I"=>"i", "J"=>"j", "K"=>"k", "L"=>"l", "M"=>"m", "N"=>"n",
#   "O"=>"o", "P"=>"p", "Q"=>"q", "R"=>"r", "S"=>"s", "T"=>"t", "U"=>"u",
#   "V"=>"v", "W"=>"w", "X"=>"x", "Y"=>"y", "Z"=>"z"
# }

# def swapcase(str)
#   str.chars.map do |char|
#     if char.upcase == char.downcase
#       char
#     elsif char == char.upcase
#       UPPER_TO_LOWER[char]
#     else
#       UPPER_TO_LOWER.key(char)
#     end
#   end.join
# end

# def swapcase(str)
#   str.chars.map do |char|
#     if UPPERCASE.include?(char)
#       UPPER_TO_LOWER[char]
#     elsif LOWERCASE.include?(char)
#       UPPER_TO_LOWER.key(char)
#     else
#       char
#     end
#   end.join
# end

# def swapcase(str)
#   str.chars.map do |char|
#     next char unless (UPPERCASE + LOWERCASE).include?(char)
#     UPPERCASE.include?(char) ? UPPER_TO_LOWER[char] : UPPER_TO_LOWER.key(char)
#   end.join
# end

# def swapcase(str)
#   str.chars.map {|chr| chr == chr.upcase ? chr.downcase : chr.upcase}.join
# end

# def swapcase(str)
#   str.each_char.map {|chr| chr == chr.upcase ? chr.downcase : chr.upcase}.join
# end

# def swapcase(str)
#   str.split('').map {|chr| chr == chr.upcase ? chr.downcase : chr.upcase}.join
# end

# p swapcase('CamelCase') == 'cAMELcASE'
# p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

###3 CAPITALIZE WORDS
# def word_cap(words)
#   words.split.map(&:capitalize).join(" ")
# end

# def word_cap(words)
#   words.downcase.split.map do |word|
#     word[0] = word[0].upcase
#     word
#   end.join(' ')
# end

# def word_cap(words)
#   words.split.map { |word| word[0].upcase + word[1..].downcase }.join(' ')
# end

# def word_cap(words)
#   words.split.map do |word|
#     word.each_char.with_index.map do |char, idx|
#       idx == 0 ? char.upcase : char.downcase
#     end.join
#   end.join(' ')
# end

# p word_cap('four score and seven') == 'Four Score And Seven'
# p word_cap('the javaScript language') == 'The Javascript Language'
# puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

### 2 LETTERCASE COUNTER
# LOWERCASE = ('a'..'z')
# UPPERCASE = ('A'..'Z')

# def letter_case_count(string)
#   result = { lowercase: 0, uppercase: 0, neither: 0 }
#   string.each_char do |char|
#     if LOWERCASE.include?(char)
#       result[:lowercase] += 1
#     elsif UPPERCASE.include?(char)
#       result[:uppercase] += 1
#     else
#       result[:neither] +=1
#     end
#   end
#   result
# end

# def letter_case_count(string)
#   result = { lowercase: 0, uppercase: 0, neither: 0 }
#   string.each_char.with_object(result) do |char, result|
#     if LOWERCASE.include?(char)
#       result[:lowercase] += 1
#     elsif UPPERCASE.include?(char)
#       result[:uppercase] += 1
#     else
#       result[:neither] +=1
#     end
#   end
# end

# def letter_case_count(string)
#   result = string.each_char.with_object(Hash.new(0)) do |char, result|
#     if LOWERCASE.include?(char)
#       result[:lowercase] += 1
#     elsif UPPERCASE.include?(char)
#       result[:uppercase] += 1
#     else
#       result[:neither] +=1
#     end
#   end
#   [:lowercase, :uppercase, :neither].each do |category|
#     result[category] = 0 unless result.has_key?(category)
#   end
#   result
# end

# def letter_case_count(string)
#   result = { lowercase: 0, uppercase: 0, neither: 0 }
#   string.each_char.with_object(result) do |char, result|
#     if char.downcase == char.upcase
#       result[:neither] += 1
#     elsif char.downcase == char
#       result[:lowercase] += 1
#     elsif char.upcase == char
#       result[:uppercase] += 1
#     end
#   end
# end

# def letter_case_count(string)
#   result = Hash.new(0)
#   result[:lowercase]  = string.count('a-z')
#   result[:uppercase]  = string.count('A-Z')
#   result[:neither]    = string.count('^A-Za-z')
#   result
# end

# def letter_case_count(string)
#   { lowercase: string.count('a-z'),
#     uppercase: string.count('A-Z'),
#     neither: string.count('^A-Za-z') }
# end

# CASES = {
#   lowercase: ('a-z'),
#   uppercase: ('A-Z'),
#   neither: ('^A-Za-z')
# }
# def letter_case_count(string)
#   CASES.each_with_object({}) do |(key, value), result|
#     result[key] = string.count(value)
#   end
# end

# def letter_case_count(string)
#   categories = [:lowercase, :uppercase, :neither]
#   categories.each_with_object({}) do |cat, result|
#     result[cat] =
#   end
# end

# p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

### 1 COMBINE TWO LISTS
# def interleave(arr1, arr2)
#   arr1.each_index.with_object([]) do |idx, result|
#     result << arr1[idx] << arr2[idx]
#   end
# end

# def interleave(arr1, arr2)
#   arr1.zip(arr2).flatten
# end

# p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
