### 10.3 ARRAY AVERAGE
=begin
Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. The array will never be empty and the numbers will always be positive integers. Your result should also be an integer.

Don't use the Array#sum method for your solution - see if you can solve this problem using iteration more directly.

PROBLEM 9:48
input: array
  - contains only positive integers
  - not empty

output: integer
  - average of all integers in input array (integer division)

EXAMPLES

DATA STRUCTURES
- needs:
  - way to get total of all integers
  - way to get number of integers
  - way to get average

- input: array
  - sum of all integers
  - length of array
- output: integer
=end

# def average(numbers)
#   numbers.sum / numbers.size.to_f
# end

# p average([1, 6]) #== 3 # integer division: (1 + 6) / 2 -> 3
# p average([1, 5, 87, 45, 8, 8]) #== 25
# p average([9, 47, 23, 95, 16, 52]) #== 40



### 9.3 REVERSE IT II
=begin
Write a method that takes one argument, a string containing one or more words, and returns the given string with words that contain five or more characters reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

PROBLEM 9:34
input: string
  - contains only letters and spaces
  - spaces only occur between words

output: string
  - same number of words as input string
  - word order is maintained
  - words that contain five or more characters are reversed
  - case is maintained

EXAMPLES

DATA STRUCTURES
- needs:
  - way to access individual words
  - way to select words to reverse
    - way to determine number of characters in individual words
  - way to reverse individual words

- input: string
  - array of individual words
  - length of each word
  - transformed array with appropriate words reversed
- output: string

ALGORITHM
- create an array of individual words from input string
- transform this array
  - if a word has five or more characters, reverse it
  - otherwise leave as is
- convert transformed array into string and return it
=end

# def reverse_words(words)
#   words.split.map { |word| word.size >= 5 ? word.reverse : word }.join(' ')
# end

# def reverse_words(string)
#   words = string.split
#   new_words = words.map { |word| word.size >= 5 ? word.reverse : word }
#   new_words.join(' ')
# end

# p reverse_words('Professional') == 'lanoisseforP'
# p reverse_words('Walk around the block') == 'Walk dnuora the kcolb'
# p reverse_words('Launch School') == 'hcnuaL loohcS'

### 8.3 REVERSE IT I
=begin
Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

PROBLEM 9:11
input: string
  - can be empty
  - can contain only whitespace

output: string
  - words in reverse order from input string
  - word: characters surrounded by whitespace
  - if input string is empty or contains only whitespace (i.e. no words):
    - return empty string
  - case is maintained

EXAMPLES

DATA STRUCTURES
- needs:
  - way to access individual words
  - way to reverse the order of the words

- input: string
  - array of individual words
  - reversed array
- output: string

ALGORITHM
- create an array of individual words from the input string
- reverse this array
- convert reversed array back into a string and return it
=end

# def reverse_sentence(sentence)
#   sentence.split.reverse.join(' ')
# end

# p reverse_sentence('Hello World') == 'World Hello'
# p reverse_sentence('Reverse these words') == 'words these Reverse'
# p reverse_sentence('') == ''
# p reverse_sentence('    ') == '' # Any number of spaces results in ''

### 7.3 DOUBLE CHAR II
=begin
Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

PROBLEM 11:20
input: string
  - can be empty

output: new string
  - every consonant is doubled
  - all other characters remain the same
  - if input string is empty, return an empty string

EXAMPLES

DATA STRUCTURES
- needs
  - way to consider every character
  - way to distinguish consonants from all other characters

- input: string
  - array of individual characters
  - transformed array (consonants doubled)
- output: string

ALGORITHM
- create an array of only consonants
  - create a range of lowercase alpha characters
  - subtract lowercase vowels
- create an array of individual characters in the input string
- transform this array
  - if downcased character belongs to consonants array, double it
  - otherwise leave it unchanged
- convert transformed array into a string and return it
=end
# ALPHABET = ('A'..'Z').to_a + ('a'..'z').to_a
# VOWELS = %w(A E I O U a e i o u)
# CONSONANTS = ALPHABET - VOWELS

# def double_consonants(string)
#   string.chars.map { |char| CONSONANTS.include?(char) ? char * 2 : char }.join
# end

# def double_consonants(string)
#   string.chars.map { |char| char =~ /[a-z&&[^aeiou]]/i ? char * 2 : char }.join
# end

# p double_consonants('String') == "SSttrrinngg"
# p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
# p double_consonants("July 4th") == "JJullyy 4tthh"
# p double_consonants('') == ""

### 6.3 DOUBLE CHAR I
=begin
Write a method that takes a string, and returns a new string in which every character is doubled.

PROBLEM 5:06
input: string
  - can be empty

output: string
  - every character from input string is doubled
  - case sensitive
  - if input string empty, return empty string

EXAMPLES

DATA STRUCTURES
- needs
  - way to access each character in input string
  - way to double each character

- input: string
  - array of individual characters
  - transformed array with each character doubled
- output: string

ALGORITHM
- create an array of individual characters from input string
- transform this array
  - double each character
- convert transformed array into string and return it
=end

# def repeater(string)
#   string.chars.map { |char| char * 2 }.join
# end

# p repeater('Hello') == "HHeelllloo"
# p repeater("Good job!") == "GGoooodd  jjoobb!!"
# p repeater('') == ''



### 5.3 FIZZBUZZ
=begin
Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers from the starting number to the ending number, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

PROBLEM 8:41
input: two integers
  - first integer: starting number
  - second integer: ending number

output: printed to terminal:
  - each integer from starting number to ending number (inclusive)
  - if number evenly divisible by 3, substitute "Fizz"
  - if number evenly divisible by 5, substitute "Buzz"
  - if number evenly divisible by 3 && 5, substitute "FizzBuzz"

EXAMPLES

DATA STRUCTURES
- needs:
  - way to determine if integer is evenly divisible by 3, 5, or both

- input: two integers
  - range from starting to ending integer
- output: integers and strings

ALGORITHM
- create a range of numbers from starting to ending integer
- transform this range
  - for every number in the range
    - if evenly divisible by 3 && 5, "FizzBuzz"
    - elsif evenly divisible by 3, "Fizz"
    - elsif evenly divisible by 5, "Buzz"
    - else number stays the same
- output transformed array to terminal
=end
###
# def fizzbuzz(start, stop)
#   result = (start..stop).map { |number| fizzbuzz_value(number) }
#   puts result.join(', ')
# end

# def fizzbuzz_value(number)
#   if number % 3 == 0 && number % 5 == 0 then "FizzBuzz"
#   elsif number % 3 == 0 then "Fizz"
#   elsif number % 5 == 0 then "Buzz"
#   else number
#   end
# end
###

###
# a somewhat convoluted approach using nested arrays, just for fun/practice
# def fizzbuzz(start_number, end_number)
#   values = determine_values(start_number..end_number)
#   puts values.join(', ')
# end

# def determine_values(range)
#   modulos = range.map do |number|
#     [3, 5].map { |divisor| number % divisor }
#   end
#   fizzbuzz_values(range, modulos)
# end

# def fizzbuzz_values(range, array)
#   fizzbuzz = ['Fizz', 'Buzz']
#   array.map.with_index do |subarray, index|
#     case subarray.count(0)
#     when 0 then range.to_a[index]
#     when 1 then fizzbuzz[subarray.index(0)]
#     else fizzbuzz.join
#     end
#   end
# end
###


# fizzbuzz(2, 16) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

### 4.3 PALINDROMIC SUBSTRINGS
=begin
Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

You may (and should) use the substrings method you wrote in the previous exercise.

For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

PROBLEM 9:09
input: string

output: array
  - contains all substrings that are palindromic:
    - same characters forwards as backwards
      - case sensitive
      - single characters are not palindromes
  - in same order as they appear in input string
    - i.e. in order of first character
    - include duplicates
  - return empty array if no palindromic substrings

EXAMPLES

DATA STRUCTURES
- needs:
  - way to find all substrings ( >= length 2)
  - way to identify palindromes from among substrings

- input: string
  - array of all substrings with length >= 2
  - filtered array
- output array

ALGORITHM
- get all substrings with length >= 2
- find palindromic substrings
  - compare substring to its reverse, select if the same
- return in an array
=end

# def palindromes(string)
#   substrings = all_substrings(string)
#   substrings.select do |substring|
#     palindrome?(substring, all_characters: false, case_sensitive: false)
#   end
# end

# p 'ABC-def123&*()'.downcase.gsub(/[^0-9a-z]/, '')

# def all_substrings(string)
#   (0...string.size).flat_map do |start_index|
#     (2..(string.size - start_index)).map { |size| string[start_index, size] }
#   end
# end

###
# def all_substrings(string)
#   (0...string.size).flat_map do |start_index|
#     leading_substrings(string[start_index..-1])
#   end
# end

# def leading_substrings(string)
#   (1..string.size).map { |size| string[0, size] }
# end

# def palindrome?(string, all_characters: true, case_sensitive: true)
#   string = string.gsub(/\W/,'') unless all_characters
#   string = string.downcase unless case_sensitive
#   string.size > 1 && string == string.reverse
# end
###

# p palindromes('abcd') == []
# p palindromes('ma-d-am') #== ['madam', 'ada']
# p palindromes('hello-madam-did-madam-goodbye') #== [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
# p palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]

### 3.3 ALL SUBSTRINGS
=begin
Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.

PROBLEM 1:24
input: string

output: array
  - all substrings of input string
  - in order:
    - by starting position
      - by length

EXAMPLES

DATA STRUCTURES
- needs
  - way to track starting position
    - index 0 up to index (length - 1)
  - way to track substring size
    - from 1 up to (string length - start index)
  - way to sort / order output array

- input: string
  - range to track start index: 0 up to string size
  - range to track length: 1 up to (string size - start index)
  - array to hold substrings
- output: array

ALGORITHM
- create an empty array to hold substrings
- consider every start index
  - index 0 up to last index
  - for each start index
    - get all substrings
      - length 1 up to max length
- return all substrings in an array

=end

# def substrings(string)
#   (0...string.size).flat_map do |start_index|
#     (1..(string.size - start_index)).map { |size| string[start_index, size] }
#   end
# end

###
# def substrings(string)
#   (0...string.size).flat_map do |start_index|
#     leading_substrings(string[start_index..-1])
#   end
# end

# def leading_substrings(string)
#   (1..string.size).map { |size| string.chars.take(size).join }
# end
###

# p substrings('abcde') == [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]

### 2.3 LEADING SUBSTRINGS
=begin
Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.

PROBLEM 12:43
input: string

output: array
  - elements are substrings
    - all substrings start at first letter of input string
    - in order from shortest to longest
    - shortest is 1 character, longest is entire input string
  - number of elements = number of characters in input string

EXAMPLES

DATA STRUCTURES
- needs
  - way to track length of substrings

- input: string
  - empty array to hold substrings
  - counter to track length of substrings: from 1 up to string length
- output: array

ALGORITHM
- create an empty array
- add substrings to the array
  - alway start at index 0
  - length from 1 up to input string length
- return the array
=end

# def leading_substrings(string)
#   (1..string.size).map { |size| string.chars.take(size).join }
# end

# def leading_substrings(string)
#   Array.new(string.size) { |index| string[0..index] }
# end

# def leading_substrings(string)
#   substring = ''
#   string.chars.map { |char| substring += char }
# end

# p leading_substrings('abc') #== ['a', 'ab', 'abc']
# p leading_substrings('a') #== ['a']
# p leading_substrings('xyzzy') #== ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

### 1.3 SUM OF SUMS
=begin
Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.

PROBLEM 6:31
input: array
  - elements are numbers
  - always contains at least one number
output: integer (or float)
  - sum of each leading subsequence of input array
    - basically the sum of an array where
      - each element is sum of elements up to that index in the input array
    - this array has the same number of elements as the input array

EXAMPLES

DATA STRUCTURES
- needs
  - way to construct each subsequence
  - way to keep track of sum

- input: array
  - array of subarrays
  - array of sums
- output: integer

ALGORITHM
- get all leading subsequences
  - transform input array into an array of subsequences
    - index always starts at 0
    - size is 1, then 2, up to size of array
- sum each subsequence
- return the total of those sums
=end

# def sum_of_sums(array)
#   subarrays = (1..array.size).map { |size| array.take(size) }
#   sums = subarrays.map(&:sum)
#   sums.sum
# end

# def sum_of_sums(array)
#   (1..array.size).map { |size| array.take(size).sum }.sum
# end

# def sum_of_sums(array)
#   (1..array.size).flat_map { |size| array.take(size) }.sum
# end

# def sum_of_sums(array)
#   (1..array.size).inject(0) { |total, size| total += array.take(size).sum }
# end

# def sum_of_sums(array)
#   array.size.downto(1).map { |size| array[-size] * size }.sum
# end

# def sum_of_sums(array)
#   array.size.downto(1).inject(0) { |total, idx| total += (array[-idx] * idx) }
# end

# p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# p sum_of_sums([4]) == 4
# p sum_of_sums([1, 2, 3, 4, 5]) == 35

### 10.2 ARRAY AVERAGE
# def average(numbers)
#   numbers.inject(:+) / numbers.size
# end

# def average(array)
#   array.each_index.with_object([]) do |idx, sums|
#     sums << (idx == 0 ? array[idx] : array[idx] + sums.last)
#   end.last / array.size
# end

# def average(array)
#   sum = 0
#   array.map { |number| sum += number }.last / array.size
# end

# p average([1, 6]) #== 3 # integer division: (1 + 6) / 2 -> 3
# p average([1, 5, 87, 45, 8, 8]) #== 25
# p average([9, 47, 23, 95, 16, 52]) #== 40

### 9.2 REVERSE IT II
###
# def reverse_words(sentence)
#   sentence.split.map { |word| word.size > 4 ? word.reverse : word }.join(' ')
# end
###

###
# def reverse_words(sentence)
#   stripped = sentence.strip.squeeze(' ')
#   words = split_sentence(stripped)
#   words.map { |word| word.size > 4 ? reverse_word(word) : word }.join(' ')
# end

# def split_sentence(sentence)
#   spaces = get_spaces(sentence)
#   get_words(sentence, spaces)
# end

# def get_spaces(string)
#   string.chars.each_index.select { |index| string[index] == ' ' }
# end

# def get_words(string, spaces)
#   starts = spaces.map { |space| space + 1 }.prepend(0)
#   stops = spaces << string.size
#   starts.map.with_index { |start, index| string[start...stops[index]] }
# end

# def reverse_word(word)
#   word.chars.each_index.map { |index| word[-(index + 1)] }.join
# end
###
# p reverse_words('Professional') == 'lanoisseforP'
# p reverse_words('Walk around the block') == 'Walk dnuora the kcolb'
# p reverse_words('Launch School') == 'hcnuaL loohcS'
###### 8.2 REVERSE IT I

###
# def reverse_sentence(sentence)
#   words = split_sentence(sentence)
#   words.each_index.map { |index| words[-(index + 1)] }.join(' ')
# end

# def split_sentence(sentence)
#   spaces = get_spaces(sentence)
#   get_words(sentence, spaces)
# end

# def get_spaces(string)
#   stripped = string.strip.squeeze(' ')
#   stripped.chars.each_index.select { |index| stripped[index] == ' ' }
# end

# def get_words(string, spaces)
#   stripped = string.strip.squeeze(' ')
#   starts = spaces.map { |space| space + 1 }.prepend(0)
#   stops = spaces << stripped.size
#   starts.map.with_index do |start, index|
#     size = stops[index] - start
#     stripped[start, size]
#   end
# end
###

###
# def reverse_sentence(sentence)
#  sentence.split.reverse.join(' ')
# end
###

###
# def reverse_sentence(sentence)
#   words = sentence.split
#   words.each_index.map { |index| words[-(index + 1)] }.join(' ')
# end
###

###
# def reverse_sentence(sentence)
#   words = sentence.split
#   (words.size / 2).times.with_object(words) do |index, words|
#     words[index], words[-(index + 1)] = words[-(index + 1)], words[index]
#   end.join(' ')
# end
###

# p reverse_sentence('Hello    World') == 'World Hello'
# p reverse_sentence('Reverse these words') == 'words these Reverse'
# p reverse_sentence('') == ''
# p reverse_sentence('    ') == '' # Any number of spaces results in ''

### 7.2 DOUBLE CHAR II
# CONSONANTS = ('A'..'Z').to_a + ('a'..'z').to_a - 'AEIOUaeiou'.chars

# def double_consonants(string)
#   string.each_char.inject("") do |new_string, char|
#     new_string << (CONSONANTS.include?(char) ? char * 2 : char)
#   end
# end

# def double_consonants(string)
#   string.chars.map do |char|
#     CONSONANTS.include?(char) ? char * 2 : char
#   end.join
# end

# p double_consonants('String') == "SSttrrinngg"
# p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
# p double_consonants("July 4th") == "JJullyy 4tthh"
# p double_consonants('') == ""

### 6.2 DOUBLE CHAR I
# def repeater(string)
#   string.chars.zip(string.chars)#.join
# end

# p repeater('Hello') #== "HHeelllloo"
# p repeater("Good job!") == "GGoooodd  jjoobb!!"
# p repeater('') == ''


###### 5.2 FIZZBUZZ
###
# def fizzbuzz(start_number, end_number)
#   numbers = get_numbers(start_number..end_number)
#   puts numbers
# end

# def get_numbers(range)
#   range.map { |number| fizzbuzz_value(number) }.join(", ")
# end

# def fizzbuzz_value(number)
#   divisors =[3, 5].select { |divisor| number % divisor == 0 }
#   return number if divisors.empty?
#   start = divisors.first == 5 ? 4 : 0
#   length = divisors.size == 2 ? 8 : 4
#   'FizzBuzz'[start, length]
# end

# fizzbuzz(1, 15)
###

###
# def fizzbuzz(start_number, end_number)
#   numbers = get_numbers(start_number..end_number)
#   puts numbers
# end

# def get_numbers(range)
#   range.map do |number|
#     modulos = [3, 5].map { |divisor| number % divisor }
#     value = fizzbuzz_value(modulos)
#     value.empty? ? number : value
#   end.join(', ')
# end

# def fizzbuzz_value(array)
#   words = ['Fizz', 'Buzz']
#   value = words.take(array.count(0))
#   value.size == 1 ? words[array.index(0)] : value.join
# end
###

###
# def fizzbuzz(start_number, end_number)
#   numbers = get_numbers(start_number..end_number)
#   puts numbers
# end

# def get_numbers(range)
#   range.map { |number| fizzbuzz_value(number) }.join(", ")
# end

# def fizzbuzz_value(number)
#   return "FizzBuzz" if number % 15 == 0
#   return "Buzz" if number % 5 == 0
#   return "Fizz" if number % 3 == 0
#   number
# end
###

###
# FIZZBUZZ_VALUES = {3 => 'Fizz', 5 => 'Buzz', 15 => 'FizzBuzz'}

# def fizzbuzz(start_number, end_number)
#   numbers = get_numbers(start_number..end_number)
#   puts numbers
# end

# def get_numbers(range)
#   range.map { |number| fizzbuzz_value(number) }.join(", ")
# end

# def fizzbuzz_value(number)
#   key = [3, 5, 15].select { |divisor| number % divisor == 0 }.last
#   FIZZBUZZ_VALUES[key] || number
# end

###
# FIZZBUZZ_VALUES = {3 => 'Fizz', 5 => 'Buzz'}

# def fizzbuzz(start_number, end_number)
#   numbers = get_numbers(start_number..end_number)
#   puts numbers
# end

# def get_numbers(range)
#   range.map { |number| fizzbuzz_value(number) }.join(", ")
# end

# def fizzbuzz_value(number)
#   divisors =[3, 5].select { |divisor| number % divisor == 0 }
#   return number if divisors.size == 0
#   return FIZZBUZZ_VALUES[divisors.first] if divisors.size == 1
#   FIZZBUZZ_VALUES.values.join
# end
# ##

###
# def fizzbuzz(start_number, end_number)
#   numbers = get_numbers(start_number..end_number)
#   puts numbers
# end

# def get_numbers(range)
#   modulos = range.map do |number|
#     [3, 5].map { |divisor| number % divisor }
#   end
#   fizzbuzz_values(modulos).join(', ')
# end

# def fizzbuzz_values(array)
#   fizzbuzz = ['Fizz', 'Buzz']
#   array.map.with_index do |subarray, index|
#     case subarray.count(0)
#     when 0 then index + 1
#     when 1 then fizzbuzz[subarray.index(0)]
#     else fizzbuzz.join
#     end
#   end
# end
###

###
# def fizzbuzz(start, stop)
#   result = (start..stop).each_with_object("") do |num, string|
#     string << num.to_s unless num % 3 == 0 || num % 5 == 0
#     string << "Fizz" if num % 3 == 0
#     string << "Buzz" if num % 5 == 0
#     string << ", " unless num == stop
#   end
#   puts result
# end
###

# fizzbuzz(1, 15)

# def fb(range)
#   range.map do |number|
#     [3, 5, 15].map { |divisor| number % divisor }
#   end
# end

# def get_word(array)
#   fb = ['Fizz', 'Buzz']
  # array.map.with_index do |subarray, index|
  #   case subarray.count(0)
  #   when 0 then index + 1
  #   when 1 then fb[subarray.index(0)]
  #   else fb.join
  #   end
  # end
# end



# fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

### 4.2 PALINDROMIC SUBSTRINGS
# def palindromes(string, ignore_case: false, ignore_non_alpha: false)
#   substrings = get_all_substrings(string)
#   get_palindromes(substrings, ignore_case:, ignore_non_alpha:)
# end

# def get_all_substrings(string)
#   (0...string.size).flat_map do |start_index|
#     get_leading_substrings(string[start_index..-1])
#   end
# end

# def get_leading_substrings(string)
#   (1..string.size).map { |length| string[0, length] }
# end

# def get_palindromes(strings, ignore_case:, ignore_non_alpha:)
#   strings.select { |string| is_palindrome?(string, ignore_case:, ignore_non_alpha:) }
# end

# def is_palindrome?(string, ignore_case:, ignore_non_alpha:)
#   string = string.downcase if ignore_case
#   string = string.gsub(/[^a-z0-9]/i, '') if ignore_non_alpha
#   string.size > 1 && string == string.reverse
# end

# p palindromes('abcd') == []
# p palindromes('madam') == ['madam', 'ada']
# p palindromes('hello-madam-did-madam-goodbye') == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
# p palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]

# p palindromes('Ab-ba', ignore_case: false, ignore_non_alpha: false) #== ["b-b"]
# p palindromes('Ab-ba', ignore_case: true, ignore_non_alpha: false) #== ["Ab-ba", "b-b"]
# p palindromes('Ab-ba', ignore_case: false, ignore_non_alpha: true) #== ["b-b"]
# p palindromes('Ab-ba', ignore_case: true, ignore_non_alpha: true) #== ["Ab-ba", "b-b"]

### 3.2
# def substrings(string)
#   (0...string.size).flat_map do |start_index|
#     (1..(string.size - start_index)).map do |substring_size|
#       string[start_index, substring_size]
#     end
#   end
# end

## with helper method
# def substrings(string)
#   (0...string.size).flat_map do |start_index|
#     leading_substrings(string[start_index..-1])
#   end
# end

# def leading_substrings(string)
#   (1..string.size).map { |size| string[0, size] }
# end
##

# p substrings('abcde') == [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]

### 2.2 LEADING SUBSTRINGS
# def leading_substrings(string)
#   string.chars.each_index.map { |index| string[0..index] }
# end

# def leading_substrings(string)
#   (0...string.size).map { |index| string[0..index] }
# end

# def leading_substrings(string)
#   string.size.times.map { |index| string[0..index] }
# end

# def leading_substrings(string)
#   (1..string.size).map { |size| string[0, size] }
# end

# p leading_substrings('abc') #== ['a', 'ab', 'abc']
# p leading_substrings('a') == ['a']
# p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

### 1.2 SUM OF SUMS
# def sum_of_sums(array)
#   subsequences = (1..array.size).map { |size| array[0, size] }
#   subsequences.map(&:sum).sum
#   # subsequences.flatten.sum
# end

# def sum_of_sums(array)
#   (1..array.size).map { |size| array[0, size] }.map(&:sum).sum
# end

# def sum_of_sums(array)
#   (1..array.size).map { |size| array.take(size) }.map(&:sum).sum
# end

# def sum_of_sums(array)
#   (1..array.size).map { |size| array.take(size) }.flatten.sum
# end

# def sum_of_sums(array)
#   (1..array.size).flat_map { |size| array.take(size) }.sum
#   # (1..array.size).flat_map { |size| array[0, size] }.sum
# end

# def sum_of_sums(array)
#   array.map.with_index do |number, index|
#     number * (array.size - index)
#   end.sum
# end

# p sum_of_sums([3, 5, 2]) #== (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# p sum_of_sums([1, 5, 7, 3]) #== (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# p sum_of_sums([4]) #== 4
# p sum_of_sums([1, 2, 3, 4, 5]) #== 35

### 10 ARRAY AVERAGE
# def average(array)
#   sum = 0
#   array.each { |num| sum += num }
#   sum / array.size
# end

# def average(array)
#   array.inject(:+) / array.size
# end

# def average(array)
#   array.each_index.with_object([]) do |idx, sums|
#     sums << (idx == 0 ? array[idx] : array[idx] + sums.last)
#   end.last / array.size
# end

# p average([1, 6]) #== 3 # integer division: (1 + 6) / 2 -> 3
# p average([1, 5, 87, 45, 8, 8]) #== 25
# p average([9, 47, 23, 95, 16, 52]) #== 40

### 9 REVERSE IT II
# def reverse_words(string)
#   string.split.map { |word| word.size < 5 ? word : word.reverse }.join(' ')
# end

# def reverse_words(string)
#   string.split.map do |word|
#     next word unless word.size > 4
#     word.reverse
#   end.join(' ')
# end

# def reverse_words(string)
#   string.split.each_with_object([]) do |word, words|
#     words << (word.size < 5 ? word : word.reverse)
#   end.join(' ')
# end

# def reverse_words(string)
#   string.split.each_with_object('') do |word, words|
#     words << (word.size < 5 ? word : word.reverse)
#     words << " " unless word == string.split.last
#   end
# end

# def reverse_words(string)
#   string.split.map do |word|
#     word.size < 5 ? word : reverse_word(word)
#   end.join(' ')
# end

# def reverse_word(word)
#   word.chars.each_index.with_object('') do |idx, reversed|
#     reversed[idx] = word[-(idx + 1)]
#   end
# end

# p reverse_words('Professional')          # => lanoisseforP
# p reverse_words('Walk around the block') # => Walk dnuora the kcolb
# p reverse_words('Launch School')         # => hcnuaL loohcS

### 8 REVERSE IT I
# def reverse_sentence(sentence)
#   sentence.split.reverse.join(' ')
# end

# def reverse_sentence(sentence)
#   (1..sentence.split.size).each_with_object("") do |idx, reversed|
#     reversed << sentence.split[-idx]
#     reversed << " " unless idx == sentence.split.size
#   end
# end

# def reverse_sentence(sentence)
#   (0...sentence.split.size).each_with_object([]) do |idx, reversed|
#     reversed[idx] = sentence.split[-(idx + 1)]
#   end.join(' ')
# end

# def reverse_sentence(sentence)
#   (1..sentence.split.size).each_with_object([]) do |idx, reversed|
#     reversed[idx - 1] = sentence.split[-idx]
#   end.join(' ')
# end

# def reverse_sentence(sentence)
#   sentence.split.each_index.with_object([]) do |idx, reversed|
#     reversed[idx] = sentence.split[-(idx + 1)]
#   end.join(' ')
# end

# def reverse_sentence(sentence)
#   (sentence.split.size / 2).times.with_object(sentence.split) do |idx, words|
#     words[idx], words[-(idx + 1)] = words[-(idx + 1)], words[idx]
#   end.join(' ')
# end

# p reverse_sentence('Hello World Goodbye World') #== 'World Hello'
# p reverse_sentence('Reverse these words right now') #== 'words these Reverse'
# p reverse_sentence('') #== ''
# p reverse_sentence('    ') #== '' # Any number of spaces results in ''

### 7 DOUBLE CHAR II
# ALPHABET = ('A'..'Z').to_a + ('a'..'z').to_a
# VOWELS = %w(A E I O U a e i o u)
# CONSONANTS = ALPHABET.delete_if { |char| VOWELS.include?(char) }

# def double_consonants(string)
#   string.chars.map do |char|
#     next char unless CONSONANTS.include?(char)
#     char * 2
#   end.join
# end

# def double_consonants(string)
#   string.chars.map do |char|
#     next char * 2 if CONSONANTS.include?(char)
#     char
#   end.join
# end

# def double_consonants(string)
#   string.chars.map do |char|
#     CONSONANTS.include?(char) ? char * 2 : char
#   end.join
# end

# def double_consonants(string)
#   string.chars.map do |char|
#     char =~ /[a-z&&[^aeiou]]/i ? char * 2 : char
#   end.join
# end

# map one-liner with regex (by Daniel Chae)
# def double_consonants(string)
#   string.chars.each.map do |char|
#     char =~ /^[^aeiou_\d\W]/i ? char * 2 : char
#   end.join
# end

# regex one-liner with negative lookahead (by Daniel Chae)
# def double_consonants(string)
#   string.gsub(/((?![aeiou])[a-z])/i, '\1' * 2)
# end

# p double_consonants('String') == "SSttrrinngg"
# p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
# p double_consonants("July 4th") == "JJullyy 4tthh"
# p double_consonants("AEIOUaeiou") == "AEIOUaeiou"
# p double_consonants('') == ""

### 6 DOUBLE CHAR I
# def repeater(string)
#   string.chars.map { |char| char * 2 }.join
# end

# def repeater(string)
#   string.chars.zip(string.chars).join
# end

# def repeater(string)
#   string.each_char.with_object("") { |char, output| output << char * 2 }
# end

# def repeater(string)
#   string.chars.inject("") {|new_string, char| new_string << char * 2 }
# end

# p repeater('Hello') == "HHeelllloo"
# p repeater("Good job!") == "GGoooodd  jjoobb!!"
# p repeater('') == ''

### 5 FIZZBUZZ
# def fizzbuzz(start_num, end_num)
#   (start_num..end_num).each do |num|
#     if num % 3 == 0 && num % 5 == 0
#       puts "FizzBuzz"
#     elsif num % 3 == 0
#       puts "Fizz"
#     elsif num % 5 == 0
#       puts "Buzz"
#     else
#       puts num
#     end
#   end
# end

# def fizzbuzz(start, stop)
#   (start..stop).each do |num|
#     if 15.step(stop, 15).include?(num)
#       puts "FizzBuzz"
#     elsif 3.step(stop, 3).include?(num)
#       puts "Fizz"
#     elsif 5.step(stop, 5).include?(num)
#       puts "Buzz"
#     else
#       puts num
#     end
#   end
# end

# def fizzbuzz(start, stop)
#   puts (start..stop).map { |num| fizzbuzz_value(num) }.join(", ")
# end

# def fizzbuzz_value(num)
#   case
#   when num % 15 == 0 then "FizzBuzz"
#   when num % 3 == 0 then "Fizz"
#   when num % 5 == 0 then "Buzz"
#   else num
#   end
# end

# def fizzbuzz(start, stop)
#   result = (start..stop).each_with_object("") do |num, string|
#     string << num.to_s unless num % 3 == 0 || num % 5 == 0
#     string << "Fizz" if num % 3 == 0
#     string << "Buzz" if num % 5 == 0
#     string << ", " unless num == stop
#   end
#   puts result
# end

# def fizzbuzz(start, stop)
#   result = (start..stop).map do |num|
#     word = [["Fizz"][num % 3], ["Buzz"][num % 5]].compact
#     word.empty? ? num : word.join
#   end
#   puts result.join(", ")
# end

# def fizzbuzz(start, stop) # Daniel Chae's recursive solution
#   print(
#     ( (ele = "FizzBuzz"[(start % 3 == 0 ? 0 : 4)...(start % 5 == 0 ? 8 : 4)]).empty? ) ? start : ele, (start < stop ? ", " : "\n")
#   ); fizzbuzz(start+1, stop) if start < stop
# end

# def fizzbuzz(start_num, end_num) # my non-recursive solution based off his idea
#   result = (start_num..end_num).map do |num|
#     start = num % 3 == 0 ? 0 : 4
#     stop = num % 5 == 0 ? 8 : 4
#     word = "FizzBuzz"[start...stop]
#     word.empty? ? num : word
#   end
#   puts result.join(", ")
# end

# fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

### 4 PALINDROMIC SUBSTRINGS
############## most readable
# def is_palindrome?(string)
#   string.size > 1 && string.reverse == string
# end

# def find_substring_palindromes(string)
#   string.chars.each_index.with_object([]) do |stop_idx, palindromes|
#     substring = string[0..stop_idx]
#     palindromes << substring if is_palindrome?(substring)
#   end
# end

# def palindromes(string)
#   # string = string.downcase.gsub(/[^a-z0-9]/, '')
#   string.chars.each_index.map do |start_idx|
#     find_substring_palindromes(string[start_idx..-1])
#   end.flatten
# end

#####################
# def is_palindrome?(string)
#   string.size > 1 && string.reverse == string
# end

# def find_substring_palindromes(string)
#   string.chars.each_index.map do |stop_idx|
#     string[0..stop_idx]
#   end.select { |substring| is_palindrome?(substring) }
# end

# def palindromes(string)
#   string.chars.each_index.map do |start_idx|
#     find_substring_palindromes(string[start_idx..-1])
#   end.flatten
# end

################ most readable
# def is_palindrome?(string)
#   string.size > 1 && string.reverse == string
# end

# def get_leading_substrings(string)
#   string.chars.each_index.map do |stop_idx|
#     string[0..stop_idx]
#   end
# end

# def get_all_substrings(string)
#   string.chars.each_index.map do |start_idx|
#     get_leading_substrings(string[start_idx..-1])
#   end.flatten
# end

# def palindromes(string)
#   # string = string.downcase.gsub(/[^a-z0-9]/, '')
#   get_all_substrings(string).select { |substr| is_palindrome?(substr) }
# end

#############
# def is_palindrome?(string)
#   string.reverse == string
# end

# def leading_substrings(string)
#   (2..string.size).map { |length| string[0, length] } # only returns substrings with size > 1
# end

# def all_substrings(string)
#   (string.size - 1).times.map do |start| # only passes substrings with size > 1 into leading_substrings
#     leading_substrings(string[start..-1])
#   end.flatten
# end

# def palindromes(string)
#   string = string.downcase.gsub(/[^a-z0-9]/, '')
#   all_substrings(string).select { |str| is_palindrome?(str) }
# end

###########
# def leading_substrings(string)
#   (2..string.size).map { |length| string[0, length] } # only returns substrings with size > 1
# end

# def palindromes(string)
#   (string.size - 1).times.map do |start| # only passes substrings with size > 1 into leading_substrings
#     leading_substrings(string[start..-1]).select { |str| is_palindrome?(str) }
#   end.flatten
# end
###########
# p palindromes('abcd') == []
# p palindromes('madam') == ['madam', 'ada']
# p palindromes('hello-madam-did-madam-goodbye') == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
# p palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]

### 3 ALL SUBSTRINGS
# def substrings(string) # uses leading_substrings as a helper method
#   (string.size).times.map do |start|
#     leading_substrings(string[start..-1])
#   end.flatten
# end

# def leading_substrings(string)
#   (1..string.size).map { |num| string[0, num] }
# end


# def substrings(string) # without leading_substrings helper method
#   string.size.times.map do |start|
#     (1..(string.size - start)).map { |num| string[start, num] }
#   end.flatten
# end

# def substrings(s) # one-line version of above
#   s.size.times.map { |i| (1..s.size - i).map { |j| s[i, j] } }.flatten
# end

######## DANIEL CHAE vvvvv
# # recursive version
# # this one was a bit of a headache, someone please comment if you can make this cleaner

# def substrings(s, iter = true)
#   s.size < 1 ? [] : (substrings(s[...-1], false) << s).concat(iter ? substrings(s[1..]) : [])
# end

# def substrings(string, iterate = true)
#   if string.size < 1
#     []
#   else
#     if iterate
#       (substrings(string[...-1], false) << string).concat(substrings(string[1..]))
#     else
#       (substrings(string[...-1], false) << string).concat([])
#     end
#   end
# end
######## DANIEL CHAE ^^^^^^

# p substrings('abcde') == [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]

### 2 LEADING SUBSTRINGS
# def leading_substrings(string)
#   string.chars.each_index.map { |idx| string.slice(0, idx + 1) }
# end

# def leading_substrings(string) # iterating directly over the characters
#   string.chars.each_index.map { |idx| string[0..idx] }
# end

# def leading_substrings(string) # iterating over a range
#   (0...string.size).map { |num| string[0..num] }
# end

# def leading_substrings(string) # using #times to iterate
#   (string.size).times.map { |counter| string[0..counter] }
# end

# def leading_substrings(string) # iterating over a range
#   (1..string.size).map { |num| string[0, num] }
# end

# def leading_substrings(string) # using #upto to iterate
#   1.upto(string.size).map { |num| string[0, num] }
# end

# p leading_substrings('abc') == ['a', 'ab', 'abc']
# p leading_substrings('a') == ['a']
# p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

### 1 SUM OF SUMS
# def sum_of_sums(array)
#   sum = 0
#   array.each_with_index do |num, idx|
#     sum += (num * (array.size - idx))
#   end
#   sum
# end

# def sum_of_sums(array)
#   array.each_with_index.with_object([]) do |(num, idx), sums|
#     sums << (num * (array.size - idx))
#   end.sum
# end

# def sum_of_sums(array)
#   array.each_with_index.inject([]) do |sums, (num, idx)|
#     sums << (num * (array.size - idx))
#   end.sum
# end

# def sum_of_sums(array)
#   array.map.with_index { |num, idx| num * (array.size - idx) }.sum
# end

# def sum_of_sums(array)
#   sum = 0
#   size = 1
#   loop do
#     sum += array.take(size).sum
#     size += 1
#     break if size > array.size
#   end
#   sum
# end

# def sum_of_sums(array)
#   sum = 0
#   array.each_with_object([]) do |num, arr|
#     arr << num + sum
#     sum += num
#   end.sum
# end

# def sum_of_sums(array)
#   sum = 0
#   array.map { |num| sum += num }.sum
# end

# def sum_of_sums(array)
#   array.each_index.map { |idx| array.take(idx + 1).sum }.sum
# end

# def sum_of_sums(array)
#   (1..array.size).map { |num| array.take(num).sum }.sum
# end

# def sum_of_sums(array)
#   array.each_with_index.inject(0) do |sum, (num, idx)|
#     sum += (num * (array.size - idx))
#   end
# end

# def sum_of_sums(array)
#   array.each_index.inject(0) { |sum, idx| sum += array.take(idx + 1).sum }
# end

# p sum_of_sums([3, 5, 2]) #== (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# p sum_of_sums([1, 5, 7, 3]) #== (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# p sum_of_sums([4]) #== 4
# p sum_of_sums([1, 2, 3, 4, 5]) #== 35
