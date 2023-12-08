### ODD SUBSTRINGS
=begin
Odd Substrings
Given a string of integers, return the number of odd-numbered substrings that can be formed.
For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.
solve("1341") = 7. See test cases for more examples.

p odd_substrings("1341") == 7
p odd_substrings("1357") == 10
p odd_substrings("13471") == 12
p odd_substrings("134721") == 13
p odd_substrings("1347231") == 20
p odd_substrings("13472315") == 28
=end




### LONGEST VOWEL CHAIN
=begin
Longest vowel chain
The vowel substrings in the word codewarriors are o,e,a,io. The longest of these has a length of 2. Given a lowercase string that has alphabetic characters only and no spaces, return the length of the longest vowel substring. Vowels are any of aeiou.

p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8

2:55
PROBLEM / EXAMPLES
input: string
  - contains only lowercase alphabetic characters
  - no spaces
  - may contain vowels: aeiou

output: integer
  - represents length of longest substring consisting only of vowels
  - only return greatest length, not substring itself: don't need to worry about ties
  - presumably, return 0 if no vowels in input string

DATA STRUCTURES
- input: string
  - array of all substrings
  - array of only vowel substrings
  - longest vowel substring
- output: integer

ALGORITHM
- get all substrings from input string
  - start at index 0, then 1, up to but not including input string length: current starting index
    - start at length 1, then length 2, up to (input string length - current starting index): current length
    - get slice of input string: [current starting index, current length]
    - store all substrings in an array
- select substrings that contain only vowels
  - iterate over each character of each substring
    - select substrings that only contain vowels
- select longest vowel-only substring
- return its length

ALGORITHM 2
- iterate over each character in the input string
- replace non-vowels with a space
- split resulting string into an array of words
- return length of longest "word"
=end

###
# def longest_vowel_substring(string)
#   substrings = get_substrings(string)
#   vowel_substrings = get_vowel_substrings(substrings)
#   longest = vowel_substrings.max_by { |substring| substring.size } || ''
#   longest.size
# end

# def get_substrings(string)
#   last_index = string.size - 1
#   (0..last_index).each_with_object([]) do |start_index, substrings|
#     max_length = string.size - start_index
#     (1..max_length).each do |current_length|
#       substrings << string[start_index, current_length]
#     end
#   end
# end

# def get_vowel_substrings(substrings)
#   vowels = 'aeiou'
#   substrings.select do |substring|
#     substring.chars.all? { |char| vowels.include?(char) }
#   end
# end

###
# def longest_vowel_substring(string)
#   only_vowels = replace_consonants(string)
#   vowel_substrings = only_vowels.split
#   longest = vowel_substrings.max_by { |substring| substring.size } || ''
#   longest.size
# end

# def replace_consonants(string)
#   string.chars.map do |char|
#     'aeiou'.include?(char) ? char : ' '
#   end.join
# end

# p longest_vowel_substring("codewarriors") == 2
# p longest_vowel_substring("suoidea") == 3
# p longest_vowel_substring("iuuvgheaae") == 4
# p longest_vowel_substring("ultrarevolutionariees") == 3
# p longest_vowel_substring("strengthlessnesses") == 1
# p longest_vowel_substring("cuboideonavicuare") == 2
# p longest_vowel_substring("chrononhotonthuooaos") == 5
# p longest_vowel_substring("iiihoovaeaaaoougjyaw") == 8
# p longest_vowel_substring("bcdfg") == 0





### ALPHABET SYMMETRY
=begin
Alphabet symmetry
Consider the word "abode". We can see that the letter a is in position 1 and b is in position 2. In the alphabet, a and b
are also in positions 1 and 2. Notice also that d and e in abode occupy the positions they would occupy in the alphabet,
which are positions 4 and 5.
Given an array of words, return an array of the number of letters that occupy their positions in the alphabet for each
word. For example,
solve(["abode","ABc","xyzD"]) = [4, 3, 1]
See test cases for more examples.
Input will consist of alphabet characters, both uppercase and lowercase. No spaces.

p solve(["abode","ABc","xyzD"]) == [4,3,1]
p solve(["abide","ABc","xyz"]) == [4,3,0]
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"])== [6,5,7]
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]

PROBLEM / EXAMPLES
input: array
  - contains strings
    - strings contain only alphabetic characters
      - upper and lowercase
    - no spaces, symbols, numbers, etc

output: array
  - contains integers
  - same number of elements as input array
  - numbers represent the number of characters in each corresponding input array string that occupy their position in the alphabet (a, A = 1, b, B = 2, etc)
    - case can be ignored
  - number can be zero

DATA STRUCTURES
- input: array
  - array of alphabetic characters
  - separate strings
    - both are zero-indexed: can compare by their indexes
- output: array

ALGORITHM
- create an array of alphabetic characters
- iterate over input array
  - for each string, check whether the character at a given index matches the character at the same index in the alphabetic array
    - count the number of characters for which this is true
  - transform each input array element into that number
  - return the transformed array
=end

# def alphabet_symmetrty(words)
#   alphabet = ('a'..'z').to_a
#   words.map do |word|
#     (0...word.size).each.count { |index| word.downcase[index] == alphabet[index] }
#   end
# end

# p alphabet_symmetrty(["abode","ABc","xyzD"]) == [4,3,1]
# p alphabet_symmetrty(["abide","ABc","xyz"]) == [4,3,0]
# p alphabet_symmetrty(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"])== [6,5,7]
# p alphabet_symmetrty(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]





### SUBSTRING INSTANCE COUNT
=begin
Return substring instance count
Complete the solution so that it returns the number of times the search_text is found within the full_text.
Usage example:
solution('aa_bb_cc_dd_bb_e', 'bb') # should return 2 since bb shows up twice
solution('aaabbbcccc', 'bbb') # should return 1

p solution('aa_bb_cc_dd_bb_e', 'bb') == 2
p solution('aaabbbcccc', 'bbb') == 1
p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1
p solution('abbBBc', 'bb') == 1
p solution('abc', 'd') == 0

7:58
PROBLEM / EXAMPLES
input: two strings
  - first string is full text
  - second string is search text

output: integer
  - represents the number of times the search text appears in the full text

- Assumptions
  - case matters
  - if no matches, return 0

DATA STRUCTURES
- input: two strings # 'aaabbbcccc', 'bbb'
  - array of substrings # ['aaa', 'aab', 'abb', . . .]
    - from full text
    - length of search text
      - start at index 0
      - finish at index (full text length - search text length)
- output: integer

ALGORITHM
- get all eligible substrings form full text
  - store in an array
  - length will be search text length
  - start index from 0 up to full text length - search text length
- count the number of times search text appears in array
- return that number
=end

# def solution(full_text, search_text)
#   substrings = get_substrings(full_text, search_text)
#   substrings.count(search_text)
# end

# def get_substrings (full_text, search_text)
#   final_index = full_text.size - search_text.size
#   (0..final_index).map do |start_index|
#     full_text[start_index, search_text.size]
#   end
# end

# p solution('aa_bb_cc_dd_bb_e', 'bb') == 2
# p solution('aaabbbcccc', 'bbb') == 1
# p solution('abcdeb','b') == 2
# p solution('abcdeb', 'a') == 1
# p solution('abbc', 'bb') == 1
# p solution('abbBBc', 'bb') == 1
# p solution('abc', 'd') == 0





### FIND ALL PAIRS
=begin
Find all pairs

You are given array of integers, your task will be to count all pairs in that array and return their count.

Notes:

Array can be empty or contain only one value; in this case return 0
If there are more pairs of a certain number, count each pair only once. E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)
Random tests: maximum array length is 1000, range of values in array is between 0 and 1000
Examples
[1, 2, 5, 6, 5, 2]  -->  2
...because there are 2 pairs: 2 and 5

[1, 2, 2, 20, 6, 20, 2, 6, 2]  -->  4
...because there are 4 pairs: 2, 20, 6 and 2 (again)

12:11
PROBLEM / EXAMPLES
input: array
  - can be empty
  - can contain only one value


output: integer
  - represents number of pairs in input array
    - a pair is two of the same integer
    - each integer can only be counted as part of one pair: [1, 1, 1, 1] => 2 pairs
      - [2, 2, 2] => 1 pair
  - if input array is empty or contains only one value, return 0

DATA STRUCTURES
- input: array
  - hash: each integer and the number of times it occurs in input array
- output: integer
  - number of key-value pairs where count is 2 or greater

ALGORITHM
- count number of times each integer in input array occurs
  - store in a hash
    - keys are unique numbers in input array
    - values are count of that number
- count the number of pairs
  - transform array of values
    - each value divided by 2
  - return sum of those transformed values
=end

# def find_pairs(numbers)
#   counts = numbers.tally
#   counts.values.map { |count| count / 2 }.sum
# end

# p find_pairs([1, 2, 5, 6, 5, 2]) == 2
# p find_pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
# p find_pairs([0, 0, 0, 0]) == 2
# p find_pairs([0, 0, 0]) == 1

# p find_pairs([1, 2, 5, 6, 5, 2]) == 2
# p find_pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
# p find_pairs([0, 0, 0, 0, 0, 0, 0]) == 3
# p find_pairs([1000, 1000]) == 1
# p find_pairs([]) == 0
# p find_pairs([54]) == 0





### COUNT LETTERS IN STRING
=begin
In this kata, you've to count lowercase letters in a given string and return the letter count in a hash with 'letter' as key and count as 'value'. The key must be 'symbol' instead of string.

Example:

letterCount('arithmetics') #=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1})
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2})

9:42
PROBLEM / EXAMPLES
input: string
  - contains only lowercase letters

output: hash
  - keys are each letter that occurs at least once in input string
    - must be a symbol: :a, not 'a'
    - should be in alphabetical order, not order of appearance in string
  - values are number of times that letter occurs in input string

DATA STRUCTURES
input: string
  - array of individual characters
    - sorted
output: hash

ALGORITHM
- convert string into array of individual characters
- sort array alphabetically
- count occurrences of each character
  - create an empty hash, set default value to 0
  - iterate over the array
    - for each char, convert to a symbol
      - if the symbol does not exist in the hash yet, create it and set value to 1
      - if symbol is already in hash, increment its value by 1
  - return the hash
=end


###
# def letter_count(string)
#   chars = string.chars.sort
#   result = Hash.new(0)
#   chars.each do |char|
#     key = char.to_sym
#     result.include?(key) ? result[key] += 1 : result[key] = 1
#   end
#   result
# end
###

###
# def letter_count(string)
#   chars = string.chars.sort
#   chars.each_with_object(Hash.new(0)) do |char, result|
#     result[char.to_sym] += 1
#   end
# end
###

###
# def letter_count(string)
#   chars = string.chars.sort
#   chars.each_with_object({}) do |char, result|
#     result[char.to_sym] = chars.count(char)
#   end
# end
###

###
# def letter_count(string)
#   string.chars.sort.map(&:to_sym).tally
# end
###

# p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
# p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
# p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
# p letter_count('this $h1.')




### MAXIMUM SUM
=begin
The maximum sum subarray problem consists in finding the maximum sum of a contiguous subsequence in an array or list of integers:

p max_sum([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6 # [4, -1, 2, 1]

Easy case is when the list is made up of only positive numbers and the maximum sum is the sum of the whole array. If the list is made up of only negative numbers, return 0 instead.

Empty list is considered to have zero greatest sum. Note that the empty array is also a valid subarray.

8:50
PROBLEM /EXAMPLE
input: array
  - contains integers
    - integers can be positive or negative

output: integer
  - largest sum of a contiguous sequence of integers
  - if all integers in input array are positive, largest sum is sum of whole array
  - if all integers in input array are negative, return 0
  - empty subarray is valid subarray
    - sum of empty array is considered 0
  - return maximum sum, don't need to return the sequence that equals that sum

DATA STRUCTURES
- input: array
  - array containing all possible subarrays
  - array containing all sums
  - sorted array of sums
- output: integer

ALGORITHM
- get all possible subarrays
  - start at index 0, then index 1, up to last index
    - index 0 to index (array size - 1)
    - get subarrays of every length possible from the current index

    - start at length 0, then length 1, up to maximum size from current index
      - length 0 to length (array size - current index)

  - put each subarray (currentindex, current length) into a holding array
  
- sum all subarrays
  - transform each subarray into its sum
- sort the list of sums
  - lowest to highet
- return the largest sum
  - last sum in array
=end


# def max_sum(numbers)
#   subarrays = get_subarrays(numbers)
#   sums = sum_subarrays(subarrays)
#   sums.sort.last || 0
# end

# def get_subarrays(array)
#   subarrays = []
#   final_index = array.size - 1
#   (0..final_index).each do |current_index|
#     max_length = array.size - current_index
#     (0..max_length).each do |current_length|
#       subarrays << array[current_index, current_length]
#     end
#   end
#   subarrays.uniq
# end

# def sum_subarrays(subarrays)
#   subarrays.map(&:sum)
# end

# p max_sum([]) == 0
# p max_sum([1, 2, 3]) == 6
# p max_sum([-1, -2, -3]) == 0
# p max_sum([1, 2, 3, -1]) == 6
# p max_sum([1, -1, 2, 3, -1, 2]) == 6
# p max_sum([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6 # [4, -1, 2, 1]



### SUBSTRING TWICE
=begin
Write a method that takes two strings and returns true if there exists a substring that appears in both of them. Return false otherwise. Only consider substrings that are at least two characters in length. Disregard case (for example, 'ace' and 'Ace' would be considered the same substring).

All input strings will contain at least two characters, and will not contain any spaces.

EXAMPLES
p substring_twice?('face', 'Ace') == true
p substring_twice?('face', 'ACTUALLY') == true
p substring_twice?('face', 'gave') == false
p substring_twice?('aa', 'aa') == true

8:10
PROBLEM / EXAMPLES
input: two strings
  - contain at least two characters
  - do not contain any spaces

output: boolean
    - true: if there is a substring that appears in both
      - substrings must be at least two characters in length
      - disregard case
      - substring can be the entire input string
    - false: otherwise

DATA STRUCTURES
- input: strings
    - two arrays containing all possible substrings from each input string
- output: boolean

ALGORITHM
- get all possible substrings from each input string, store in two arrays
  - get all length 2 substrings, then length 3, up to maximum length
    - start at length 2, up to string length
    
    - start from first index, then second, up to last index that can create a substring of that length
      - start at index 0, up to index (input string length - current target length)

- compare the arrays to see if they have any substrings in common
  - iterate over the shortest array
    - sort two arrays by length
    - see if each element is included in the other array
      - if yes, return true
- return true if so, false otherwise
=end

###

# def substring_twice?(string1, string2)
#   substrings = get_all_substrings([string1, string2])
#   common_substring?(substrings)
# end

# def get_all_substrings(strings_array)
#   strings_array.map do |string|
#     get_substrings(string)
#   end
# end

# def get_substrings(string)
#   (2..string.size).each_with_object([]) do |current_length, substrings|
#     (0..(string.size - current_length)).each do |start_index|
#       substrings << (string[start_index, current_length]).downcase
#     end
#   end
# end

# def common_substring?(substrings)
#   shorter, longer = substrings.sort_by { |array| array.size }
#   shorter.each do |substring|
#     return true if longer.include?(substring)
#   end
#   false
# end
###

###
# def substring_twice?(string1, string2)
#   shorter, longer = [string1, string2].sort_by { |string| string.size }
#   substrings = get_substrings(shorter)
#   common_substring?(longer, substrings)
# end

# def get_substrings(string)
#   (2..string.size).each_with_object([]) do |current_length, substrings|
#     (0..(string.size - current_length)).each do |start_index|
#       substrings << (string[start_index, current_length]).downcase
#     end
#   end
# end

# def common_substring?(string, substrings)
#   substrings.each do |substring|
#     return true if string.downcase.include?(substring)
#   end
#   false
# end
###

###
# def substring_twice?(string1, string2)
#   shorter, longer = [string1, string2].sort_by { |string| string.size }
#   common_substrings = get_substrings(shorter, longer)
#   common_substrings.size > 0
# end

# def get_substrings(shorter, longer)
#   (2..shorter.size).each_with_object([]) do |current_length, substrings|
#     (0..(shorter.size - current_length)).each do |start_index|
#       substring = (shorter[start_index, current_length]).downcase
#       substrings << substring if longer.downcase.include?(substring)
#     end
#   end
# end
###

###
# def substring_twice?(string1, string2)
#   shorter, longer = [string1, string2].sort_by { |string| string.size }
#   check_for_substrings(shorter, longer)
# end

# def check_for_substrings(shorter, longer)
#   (2..shorter.size).each do |length|
#     (0..(shorter.size - length)).each do |start|
#       substring = get_substring(shorter, start, length)
#       return true if common_substring?(longer, substring)
#     end
#   end
#   false
# end

# def get_substring(string, start, length)
#   string[start, length]
# end

# def common_substring?(string, substring)
#   string.downcase.include?(substring.downcase)
# end
###

###
# def substring_twice?(string1, string2)
#   shorter, longer = [string1, string2].sort_by { |string| string.size }
#   substrings = get_substrings(shorter)
#   common_substring?(longer, substrings)
# end

# def get_substrings(string)
#   (2..string.size).each_with_object([]) do |current_length, substrings|
#     (0..(string.size - current_length)).each do |start_index|
#       substrings << (string[start_index, current_length]).downcase
#     end
#   end
# end

# def common_substring?(string, substrings)
#   substrings.any? { |substring| string.include?(substring) }
# end
###

# p substring_twice?('face', 'Ace') == true
# p substring_twice?('FACE', 'actually') == true
# p substring_twice?('face', 'gave') == false
# p substring_twice?('aa', 'aa') == true


### ALPHABETICAL ORDER
=begin
Write a method that, given a string, returns a new string containing only the alphabetic characters (all whitespace and non-alphabetic characters removed). These characters should be in case-insensitive alphabetical order, in the order they appear in the original string.

EXAMPLES
p alphabetized('') == ''
p alphabetized(' ') == ''
p alphabetized(' ba ') == 'ab'
p alphabetized('Ab Ba') == 'AabB'
p alphabetized('Ba Ab') == 'aABb'
p alphabetized('9A #b$B .a%') == 'AabB'
p alphabetized('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ') == 'aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ'

7:45
PROBLEM / EXAMPLES
input: string
  - can contain alphabetic and non-alphabetic characters and whitespace
  - can be an empty string
  - can contain only whitespace

output: string
  - new string
  - contains only the alphabetic characters from the input string
    - whitespace and  non-alphabetic characters removed
  - should be in case insensitive alphabetic order in order they appear in input string
    - e.g. 'Aa' => 'Aa'; 'aA' => 'aA'
  - if input string is empty, return empty string
  - if input string contains only whitespace (or non-alphabetic characters), return empty string

DATA STRUCTURES
- input: string
  - array of individual characters
  - array of only alphabetic characters
  - sorted array
- output: string

ALGORITHM
- remove all non-alphabetic characters
  - create an array of all alphabetic characters
  - convert input string into an array of individual characters
  - select only those characters that are alphabetic
- sort remaining characters
  - sort by downcased character
  - sort also by index?
- return string
  - join array characters into string
=end

# ALPHABET = ('A'..'Z').to_a + ('a'..'z').to_a

# def alphabetized(string)
#   alpha_characters = get_alpha_characters(string)
#   sorted = sort_characters(alpha_characters)
#   sorted.join
# end

# def get_alpha_characters(string)
#   string.chars.select { |char| ALPHABET.include?(char) }
# end

# def sort_characters(array)
#   array.sort_by.with_index { |char, index| [char.downcase, index] }
# end

# p alphabetized('') == ''
# p alphabetized(' ') == ''
# p alphabetized(' ba ') == 'ab'
# p alphabetized('Ab Ba') == 'AabB'
# p alphabetized('Ba Ab') == 'aABb'
# p alphabetized('9A #b$B .a%') == 'AabB'
# p alphabetized('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ') == 'aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ'




### CLOSEST VALUES
=begin
Write a method that takes an array of integers as an argument and returns the
two numbers that are closest together in value. If more than one pair of integers satisfies this condition, return the pair whose elements occurs first in the input array.

Examples:
p closest_numbers([2, 4, 6, 7]) == [6, 7]
p closest_numbers([5, 15, 25, 11, 20]) == [15, 11]
p closest_numbers([3, 6, 8, 11, 13]) == [6, 8]
p closest_numbers([12, 7, 17]) == [12, 7]

5:05
PROBLEM / EXAMPLES
input: array
  - contains only integers
  - contains at least 3 integers

output: array
  - contains two integers
  - these are the two integers from the input array that are closest to each other in value
  - if more than one pair is equally close, return the pair whose elements occur first in input array
  - integers do not have to be consecutive

DATA STRUCTURES
- input: array
  - nested array of all possible two-element combinations # [[2, 4], [2, 6], [2, 7] . . . ]
    - sorted by the difference between its two elements, then by index
-output: array
  - first array from sorted nested array

ALGORITHM
- get all possible two element combinations from input array
  - iterate over input array
    - start at first element, then second, up to the second to last element
      - index 0 up to index (input array length - 2)
    - combine with each successive element
      - index (current index + 1) up to index (input array length - 1)
  - store in an array (each element will be a two element subarray) 
- sort these combos by difference between the two elements, then by order of appearance
  - for order of appearance, can use index of each combo in nested array
- return the first combo from this sorted list
=end


# def closest_numbers(array)
#   combos = get_all_combos(array)
#   sorted_combos = sort_combos(combos)
#   sorted_combos.first
# end

# def get_all_combos(array)
#   combos = []
#   (0..(array.size - 2)).each do |index1|
#     ((index1 + 1)..(array.size - 1)).each do |index2|
#       combos << [array[index1], array[index2]]
#     end
#   end
#   combos
# end

# def sort_combos(array)
#   array.sort_by.with_index do |pair, index|
#     sorted_pair = pair.sort
#     [sorted_pair[1] - sorted_pair[0], index]
#   end
# end

# p closest_numbers([2, 4, 6, 7]) == [6, 7]
# p closest_numbers([5, 15, 25, 11, 20]) == [15, 11]
# p closest_numbers([3, 6, 8, 11, 13]) == [6, 8]
# p closest_numbers([12, 7, 17]) == [12, 7]


### DASHERIZER
=begin
Write a method that takes an integer as an argument and returns a string, with a dash placed between any consecutive odd digits.

Examples:
p dasherizer(2112) == '21-12'
p dasherizer(201305742) == '201-305-742'
p dasherizer(123456789) == '123456789'
p dasherizer(217521) == '21-7-521'

PROBLEM / EXERCISES
input: integer

outuput: string
  - same digits as input integer, with dashes between consecutive odd digits

DATA STRUCTURES
input: integer # 2112
  - converted to string # '2112'
  - converted to array of digits # ['2', '1', '1', '2']
    - transformed if following digit is odd # [['2', '1-', '1', '2']]
      - range of indexes from 0 up to array.length - 2
        - compare element at index to element at (index + 1)
    - joined back into string
output: string

ALGORITHM
- convert input integer into string
- convert string into array of digits
- iterate over a range from 0 to (digits array length - 2)
  - transform the array
    -each element that is odd and is followed by an odd number:
      - digit at that index in digits array + '-'
    - all other elements:
      - digit at that index in digits array
- join the array into a string and return it
=end

# def dasherizer(number)
#   digits = number.to_s.chars
#   result = (0..(digits.size - 2)).map do |index|
#     if digits[index].to_i.odd? && digits[index + 1].to_i.odd?
#       digits[index] + '-'
#     else
#       digits[index]
#     end
#   end.join
#   result + digits[-1]
# end

# def dasherizer(number)
#   digits = number.digits.reverse
#   (0..(digits.size - 2)).map do |index|
#     if digits[index].odd? && digits[index + 1].odd?
#       digits[index].to_s + '-'
#     else
#       digits[index].to_s
#     end
#   end.join + digits[-1].to_s
# end

# p dasherizer(2112) #== '21-12'
# p dasherizer(201305742) #== '201-305-742'
# p dasherizer(123456789) #== '123456789'
# p dasherizer(217521) #== '21-7-521'





### LONGEST ALPHABETICAL
=begin
Write a method that takes a string containing only lowercase letters as an argument, and returns the longest substring that is in alphabetical order. If there are multiple solutions, return the substring that occurs first in the input string. All input strings will be at least one character in length.

Examples:
p longest('asd') == 'as'
p longest('nab') == 'ab'
p longesT('abcbcd') == 'abc'
p longest('abcdeapbcdef') ==  'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') == 'fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'

7:07
PROBLEM / EXAMPLES
input: string
  - contains only lowercase letters
  - at least once character in length
output: string
  - longest substring that is in alphabetical order
    - if multiple, return one that occurs first
  - if input string is only one character, return input string
  - substring can be any length from 1 up to length of input string

DATA STRUCTURES
input: string # 'abc'
  - array of all possible substrings # ['a', 'ab', 'abc', 'b', . . .]
    - start at index 0, up to (input string length - 1)
      - start at size 1, up to (input string length - current index)
  - array of all lowercase alphabetic characters, in order # ['a', 'b', 'c' . . .]
  - array of characters in each substring # ['a', 'b']
    - examine each character and next character
      - current index and current index + 1
        - from index 0 up to (input string length - 2)
        - what about length 1 substrings?
  - array of only alphabetical substrings, sorted first by size and then by order in input string
output: string

ALGORITHM
- Get all possible substrings
  - iterate over a range representing starting indexes
    - 0 up to (input string length - 1)
  - iterate over a range representing substring size
    - 1 up to (input string length - current index)
  - take slices of input string: [current index, current size]
  - collect these substrings in an array
- Find alphabetical substrings
  - create an array of all lowercase letters in alphabetical order
  - iterate over each substring
    - iterate over a range representing starting indexes
      - compare character at current index to character at current index + 1
        - check whether index of first character in alphabet array is lower than that of second character
        - if true for all characters in substring, store that substring in a new array
- Find longest alphabetical substring
  - sort substrings first by size and then by position in alphabetical substrings array
  - return the longest
    - return first if a tie
=end

# ALPHABET = ('a'..'z').to_a

###
# def longest(string)
#   return string if string.size == 1
#   substrings = get_all_substrings(string)
#   alpha_substrings = find_alpha_substrings(substrings)
#   find_longest(alpha_substrings)
# end

# def get_all_substrings(string)
#   (0...string.size).each.with_object([]) do |index, substrings|
#     (1..(string.size - index)).each do |length|
#       substrings << string[index, length]
#     end
#   end
# end

# def find_alpha_substrings(substrings)
#   substrings.select do |substring|
#     (0..(substring.size - 2)).all? do |index|
#       alphabetical?(substring[index], substring[index + 1])
#     end
#   end
# end

# def alphabetical?(char1, char2)
#   ALPHABET.index(char1) <= ALPHABET.index(char2)
# end

# def find_longest(strings)
#   strings.sort_by do |string|
#     [string.size, strings.reverse.index(string)]
#   end.last
# end
###

###
# def longest(string)
#   return string if string.size == 1
#   substrings = get_substrings(string)
#   find_longest(substrings)
# end

# def get_substrings(string)
#   (0...string.size).each.with_object([]) do |index, substrings|
#     (1..(string.size - index)).each do |length|
#       substring = string[index, length]
#       substrings << substring if alphabetical?(substring)
#     end
#   end
# end

# def alphabetical?(substring)
#   (0..(substring.size - 2)).all? do |index|
#     ALPHABET.index(substring[index]) <= ALPHABET.index(substring[index + 1])
#   end
# end

# def find_longest(strings)
#   strings.sort_by { |str| [str.size, strings.reverse.index(str)] }.last
# end
###

# p longest('abc') == 'abc'
# p longest('abcbcd') == 'abc'
# p longest('asd') == 'as'
# p longest('nab') == 'ab'
# p longest('abcdeapbcdef') ==  'abcde'
# p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
# p longest('asdfbyfgiklag') == 'fgikl'
# p longest('z') == 'z'
# p longest('zyba') == 'z'






### ALPHABET SCORE
=begin
Write a method that takes a string of words as an argument and returns the word that scores highest according to the letters it contains. Each letter of a word scores points according to its position in the alphabet: a = 1, b = 2, etc. So, for example, the word "ace" has a score of 9 (1 + 3 + 5).

If two words are tied for highest score, return the word that appears earliest in the original string.

You can assume that all letters in the input string are lowercase and all input strings are valid.

Examples:
p alphabet_score('time is up') == 'time'
p alphabet_score('time to stop') == 'stop'
p alphabet_score('aced up') == 'up'
p alphabet_score('ebb ace') == 'ebb'
p alphabet_score('c ba') == 'c'

9:04 / 9:29
PROBLEM / EXAMPLES
input: string
  - only contains lowercase letters
  - contains "words"
    - contiguous sequence of non-space characters (letters)

outuput: string
  - word from input string with highest score
    - score based on letters in word
      - a = 1, b = 2, etc
    - NOT based on number of letters: up > aced
  - if two or more words have the same highest score
    - return the word that occurs first in input string

DATA STRUCTURES
- input: string # 'time to stop'
  - array of alphabet letters ['a', 'b', 'c', . . .]; can use index as score
  - array of individual words in input string # ['time', 'to', 'stop']
  - hash with word as key and score as value # { 'ace' => 9, . . . }
    - can sort by score and then retrieve highest scoring word
    - problem: word order in original string: maybe can use index to decide ties?
- output: string

ALGORITHM
- create an array of letters in alphabetical order
- Give each word a score
  - separate input string into individual words
  - us alphabet array to give each word a score
  - store in a hash with word as key and score as value
- Return the highest scoring word
  - sort the hash by scores
  - return the word associated with the highest score
  - TIES?
    - if two words have the same score, compare the index of each word in the words array

=end

# ALPHABET = [0] + ('a'..'z').to_a

# def alphabet_score(string)
#   words = string.split
#   words.sort_by do |word|
#     [get_score(word), words.reverse.index(word)]
#   end.last
# end

# def get_score(word)
#   word.chars.map { |char| ALPHABET.index(char) }.sum
# end

# p alphabet_score('time is up') #== 'time'
# p alphabet_score('time to stop') #== 'stop'
# p alphabet_score('aced up') #== 'up'
# p alphabet_score('ebb ace') #== 'ebb'
# p alphabet_score('c ba') #== 'c'


### DELETE A DIGIT
=begin
Write a method that takes an integer as an argument and returns the largest integer that can be obtained by deleting exactly one digit.

Assume all input integers will contain at least two digits

Examples:
p delete_digit(10) == 1
p delete_digit(12) == 2
p delete_digit(123) == 23
p delete_digit(321) == 32
p delete_digit(12345) == 2345
p delete_digit(62345) == 6345
p delete_digit(791983) == 91983

8:27
PROBLEM / EXAMPLES
input: integer
  - contains at least two digits

output: integer
  - contains one less digit that input integer
  - should be largest value that can be created by deleting one digit from input integer
    - original order is maintained, just with one digit deleted

DATA STRUCTURES
input: integer # 62345
  - array of digits # [6, 2, 3, 4, 5]
    - subarrays # [6, 2, 3, 4], [6, 3, 4, 5], [6, 2, 4, 5] . . .
      - joined and converted back to integers # 6234, 6345, 6245
        - sorted to find largest
  - OR string '62345' ***
    - same as above but with substrings
output: integer

ALGORITHM
- convert input integer to array of digits
- create all possible subarrays with one digit deleted
  - iterate over a range from 0 up to array length - 1 (represents indexes)
    - transform each element into a subarray
      - delete a digit at each index
- convert subarrays back into integers
- sort these integers
- return the largest

=end

# def delete_digit(number)
#   digits = number.digits.reverse
#   subarrays = (0...digits.size).map do |index|
#     digits - [digits[index]]
#   end
#   subarrays.map { |subarray| subarray.join.to_i }.sort.last
# end

# p delete_digit(10) == 1
# p delete_digit(12) == 2
# p delete_digit(123) == 23
# p delete_digit(321) == 32
# p delete_digit(12345) == 2345
# p delete_digit(62345) == 6345
# p delete_digit(791983) == 91983





### REPEATED SUBSTRING
=begin
Write a method that takes a string as an argument and returns true if that string can be constructed by taking a substring and concatenating two or more copies of the substring together. Return false otherwise.

Examples:
p repeated_substring('aba') == false
p repeated_substring('aaa') == true
p repeated_substring('abab') == true
p repeated_substring('abcABC') == false
p repeated_substring('AabAaba') == false
p repeated_substring('aB@AbaB@Ab') == true
p repeated_substring('ab3ab3ab3') == true

4:54
PROBLEM / EXAMPLES
input: string
  - can contain any type of character (letters, numbers, symbols)

output: boolean
  - true if input string can be constructed by concatenating two or more copies of any substring
  - false otherwise
  - case sensitive ('a' != 'A')
  - substring can be one character
  - maximum substring size is half the input string length
  - input string length must be a multiple of substring length

DATA STRUCTURES
- input: string
  - array of all possible substrings
    - index 0 up to (input string length - 1 / 2)
    - size 1 up to (input string length / 2)
  - substring * (string size / substring size) == string # 'ab' * 2  == 'abab'
- output: boolean

ALGORITHM
- find all possible suitable substrings
  - take slices of string
    - index 0 up to half of string length - 1
      - size 1 up to string length / 2
  - store slices in an array
- compare concatenated substrings to string
  - iterate over substring array
    - multiply substring * (string length / substring length)
    - compare to string
    - true if they're equal, otherwise false
    - can stop as soon as one successful candidate is found
=end

# def repeated_substring(string)
#   substrings = get_all_substrings(string)
#   substrings.each do |substring|
#     return true if substring * (string.size / substring.size) == string
#   end
#   false
# end

# def get_all_substrings(string)
#   substrings = []
#   (0..((string.size - 1) / 2)).each do |index|
#     (1..(string.size / 2)).each do |size|
#       substrings << string[index, size]
#     end
#   end
#   substrings
# end

# p repeated_substring('aba') == false
# p repeated_substring('aaa') == true
# p repeated_substring('abab') == true
# p repeated_substring('abcABC') == false
# p repeated_substring('AabAaba') == false
# p repeated_substring('aB@AbaB@Ab') == true
# p repeated_substring('ab3ab3ab3') == true





### TRIPLE DOUBLE
=begin
Write a method that takes two integers as arguments and returns true if the first integer has a sequence of at least three in a row of the same number, and the second integer has a sequence of at least two in a row of that same number. Otherwise, return false.

Examples:
p triple_double(12345, 12345) == false
p triple_double(1222345, 122345) == true
p triple_double(1222345, 123345) == false
p triple_double(666789, 12345666) == true
p triple_double(451999277666, 41177722899) == true

7:52 / 8:15
PROBLEM / EXAMPLES
input: two integers

output: boolean
  - true if:
    - first integer has a sequence of at least three of a number AND
    - second integer has a sequence of at least two of that same number
  - otherwise false

DATA STRUCTURES
input: integers # 1222345
  - converted to string # '1222345'
    - substrings to analyze for triples, doubles # '122', '222', '223' etc
      - start at index 0, end at index (length - 3) or index (length - 2)
      - length 3 or 2
  - array to hold found triples # ['222', '444']
    - or candidate digits # ['2', '4']
output: boolean

ALGORITHM
- search first input integer for triples
  - convert first input integer into a string
  - iterate over string and collect all three-character substrings
  - search collected substrings for triples
- if no triple(s) found, return false
- if triple(s) found, search second input integer for doubles of same digit(s)
  - convert second input integer into a string
  - iterate over string and collect all two-character substrings
  - search collected substrings for doubles of target digit(s)
- if matching double found, return true
- if no matching double found, return false
=end

# def triple_double(number1, number2)
#   triples = multiples(number1, 3)
#   return false if triples.empty?
#
#   doubles = multiples(number2, 2)
#   return false if doubles.empty?
#
#   triples.each do |triple|
#     doubles.each do |double|
#       return true if triple[0] == double[0]
#     end
#   end
#   false
# end

# def multiples(number, size)
#   substrings = get_substrings(number, size)
#   multiples = find_multiples(substrings)
# end

# def get_substrings(number, size)
#   (0..(number.to_s.size - size)).map do |index|
#     number.to_s[index, size]
#   end
# end

# def find_multiples(substrings)
#   substrings.select do |substring|
#     substring.chars.all? { |char| char == substring[0] }
#   end
# end

# p triple_double(12345, 12345) == false
# p triple_double(1222345, 122345) == true
# p triple_double(1222345, 123345) == false
# p triple_double(666789, 12345666) == true
# p triple_double(451999277666, 41177722899) == true





### MULTIPLY ALL PAIRS
=begin
Write a method that, given two arrays each containing lists of numbers, returns a new array that contains the product of every pair of numbers that can be formed between the elements of the two arrays. The results should be sorted by increasing value.

You may assume that neither argument is an empty array.

Examples:
p multiply_all_pairs([3], [1, 3, 2]) == [3, 6, 9]
p multiply_all_pairs([1, 2], [3, 4]) == [3, 4, 6, 8]
p multiply_all_pairs([1, 2], [4, 3, 1, 2]) == [1, 2, 2, 3, 4, 4, 6, 8]

8:38
PROBLEM / EXAMPLES
inputs: 2 arrays
  - contain integers
  - not empty

output: array
  - contains product of every possible pair of elements, one from each input array
  - should be sorted by increasing value
  - size is product of the sizes of each input array

DATA STRUCTURES
input: two arrays

output: array

ALGORITHM
- iterate over first input array
  - iterate over second input array
    - multiply current element 1 * current element 2
    - store products in an output array
- sort output array and return it
=end

# def multiply_all_pairs(array1, array2)
#   results = []
#   array1.each do |number1|
#     array2.each do |number2|
#       results << (number1 * number2)
#     end
#   end
#   results.sort
# end
  
# p multiply_all_pairs([3], [1, 3, 2]) == [3, 6, 9]
# p multiply_all_pairs([1, 2], [3, 4]) == [3, 4, 6, 8]
# p multiply_all_pairs([1, 2], [4, 3, 1, 2]) == [1, 2, 2, 3, 4, 4, 6, 8]





### NEXT BIGGEST NUMBER
=begin
Write a method that, given a positive integer, returns the next biggest number that can be formed from the same digits. If no bigger number can be formed from those digits, return -1

Examples:
p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(315) == 351
p next_bigger_num(111) == -1
p next_bigger_num(12345) == 12354
p next_bigger_num(12344) == 12434
p next_bigger_num(54321) == -1

7:07
PROBLEM / EXAMPLES
input: integer
  - positive

output: integer
  - same digits as input integer
  - should be next biggest number that can be formed from those digits
  - if no bigger number can be formed, return -1
  

DATA STRUCTURES
- input: integer # 12345
  - array of individual digits # [1, 2, 3, 4, 5]
    - sorted to find largest possible number: # [5, 4, 3, 2, 1] => 54321
- output: integer

ALGORITHM
- find largest possible number with given digits
  - separate input integer into an array of individual digits
  - sort the digits highest to lowest
  - rejoin them into an integer
- iterate from input integer up to largest number, incrementing by 1
- return first number that contains all the same digits as the input integer
=end

# def next_bigger_num(number)
#   largest = number.digits.sort.reverse.join.to_i
#   ((number + 1)..largest).each do |num|
#     return num if num.digits.sort.reverse.join.to_i == largest
#   end
#   -1
# end

# p next_bigger_num(9) == -1
# p next_bigger_num(12) == 21
# p next_bigger_num(315) == 351
# p next_bigger_num(111) == -1
# p next_bigger_num(13579) == 13597
# p next_bigger_num(13573) == 13735
# p next_bigger_num(13576) == 13657
# p next_bigger_num(97531) == -1





### PAIRS
=begin
Write a function that takes an array as an argument, and returns an array with pairs of elements grouped into subarrays. The first element should be paired with the last, the second element with the second to last, etc.

If the array has an odd number of elements, repeat the middle element twice for the final pair.

Examples
p pairs([1, 2, 3, 4, 5, 6]) == [[1, 6], [2, 5], [3, 4]]
p pairs([1, 2, 3, 4, 5]) == [[1, 5], [2, 4], [3, 3]]
p pairs([1, 2]) == [[1, 2]]
p pairs([1]) == [[1, 1]]
p pairs([]) == []

7:04
PROBLEM / EXAMPLES
input: array
  - flat
  - can be empty

output: array
  - nested: contains subarrays each with a pair of elements from the input array
    - pairs are: 1st and last, 2nd and 2nd to last, etc
    - if odd number of elements, last pair is middle element twice
  - if input array is empty, return an empty array

DATA STRUCTURES
input: array # [1, 2, 3, 4, 5]
  - subarrays of pairs # [1, 5], [2, 4], [3, 3]
    - index 0, index -1
    - index 1, index -2
    - index 2, index -3
output: nested array # [[1, 5], [2, 4], [3, 3]]

[1, 2, 3, 4, 5, 6] # 0 1 2 / -1 -2 -3
[1, 6], [2, 5], [3, 4]

ALGORITHM
- create subarrays of pairs
    - iterate over a range: 0 up to (array size - 1) / 2 # current index
      - transform each element into a subarray: [array[current index], array[-current index + 1]]
=end

# def pairs(array)
#   (0..((array.size - 1)/2)).map do |index|
#     [array[index], array[-(index + 1)]]
#   end
# end

# p pairs([1, 2, 3, 4, 5, 6]) == [[1, 6], [2, 5], [3, 4]]
# p pairs([1, 2, 3, 4, 5]) == [[1, 5], [2, 4], [3, 3]]
# p pairs([1, 2]) == [[1, 2]]
# p pairs([1]) == [[1, 1]]
# p pairs([]) == []





### VOWEL SUBSTRINGS
=begin
Write a method that takes a string as an argument and returns the number of "vowel substrings" within it. A "vowel substring" is a contiguous sequence of characters within the input string that consists only of vowels ('a', 'e', 'i', 'o', and 'u') and has all five vowels present in it at least once. All input strings will contain only lowercase letters.

Examples:
p count_vowel_substrings('abcde') == 0
p count_vowel_substrings('aeiou') == 1
p count_vowel_substrings('iaoue') == 1
p count_vowel_substrings('aeiogu') == 0
p count_vowel_substrings('aeiouu') == 2
p count_vowel_substrings('aeiouuu') == 3
p count_vowel_substrings('aaeeiioouu') == 4

7:14
PROBLEM
input: string
  - contains only lowercase letters

output: integer
  - number of 'vowel substrings' in input string
    - vowel substring
      - consists only of vowels (aeiou)
      - contains each vowel at least once
      - order doesn't matter
      - case doesn't matter (only lowercase in input strings)
      - must be at least five characters in length
      - cannot contain any consonants

EXAMPLES
p count_vowel_substrings('abcde') == 0 # 
p count_vowel_substrings('aeiou') == 1 # 'aeiou'
p count_vowel_substrings('iaoue') == 1 # 'iaoue'
p count_vowel_substrings('aeiogu') == 0 #
p count_vowel_substrings('aeiouu') == 2 # 'aeiou', 'aeiouu'
p count_vowel_substrings('aeiouuu') == 3 # 'aeiou', 'aeiouu', 'aeiouuu'
p count_vowel_substrings('aaeeiioouu') == 4 
# 'aaeeiioou', 'aaeeiioouu', 'aeeiioou', 'aeeiioouu'

DATA STRUCTURES
input: sring
  - substrings
    - start at index 0, then 1, etc
      - length 5, then length 6, etc, up to (length - start index)
    - array containing all vowels: 'aeiou'
    - array containing all consonants:
output: integer

ALGORITHM
- create an array of all vowels
- create an array of all consonants
- get all substrings
  - iterate over input string, with indexes
    - create substrings starting at each index
      - length starting at 5, up to input string length - current index
- count substrings that meet criteria
  - no consonants
  - contain at least one of each vowel
    - get unique letters, sort them, then compare to all vowels array
=end
# VOWELS = %w(a e i o u)
# CONSONANTS = ('a'..'z').to_a - VOWELS

# def count_vowel_substrings(string)
#   substrings = get_all_substrings(string)
#   only_vowels = get_only_vowels(substrings)
#   uniques = only_vowels.map { |substring| substring.chars.uniq.sort.join }
#   uniques.count { |unique| unique == 'aeiou' }
# end
# def get_all_substrings(string)
#   substrings = []
#   last_index = string.size - 5
#   (0..last_index).each do |index|
#     largest = string.size - index
#     (5..largest).each do |size|
#       substrings << string[index, size]
#     end
#   end
#   substrings
# end
# def get_only_vowels(substrings)
#   substrings.select do |substring|
#     substring.each_char.none? do |char|
#       CONSONANTS.include?(char)
#     end
#   end
# end

# p count_vowel_substrings('abcde') == 0 # 
# p count_vowel_substrings('aeiou') == 1 # 'aeiou'
# p count_vowel_substrings('iaoue') == 1 # 'iaoue'
# p count_vowel_substrings('aeiogu') == 0 #
# p count_vowel_substrings('aeiouu') == 2 # 'aeiou', 'aeiouu'
# p count_vowel_substrings('aeiouuu') == 3 # 'aeiou', 'aeiouu', 'aeiouuu'
# p count_vowel_substrings('aaeeiioouu') == 4 # 'aaeeiioou', 'aaeeiioouu', 'aeeiioou', 'aeeiioouu'





### LETTER CHANGES
=begin
Write a method that takes a string as an argument and returns a new string with every letter character replaced with the 3rd letter following it in the alphabet ('a' becomes 'd', 'b' becomes 'e', etc).

Maintain the case of the original letter. Loop back to the beginning of the alphabet if the 3rd letter is past the end ('x' becomes 'a', 'Y' becomes 'B', etc). Leave any non-letter characters unchanged.

Examples:
p letter_changes('abc') == 'def'
p letter_changes('WxY') == 'ZaB'
p letter_changes('364.39') == '364.39'
p letter_changes("JaneDoe37@gmail.com") == 'MdqhGrh37@jpdlo.frp'

7:36
PROBLEM / EXAMPLES
input: string
  - can contain any character (letters, numbers, symbols)

output: string
  - every letter character of input string replaced
    - 3rd letter following it in alphabet
      - loop back to beginning of alphabet: xyz => abc
    - maintain case
  - all othe characters unchanged

DATA STRUCTURES
input: string
  - array of individual characters to iterate over and transform
output: string

ALGORITHM
- create a string of alphabetical characters (upper and lowercase)
- create a string of shifted alphabetical characters (+3)
- split the input string into individual characters
- iterate over each character
  - if the character is present in the alphabet string, replace it with the character at the same index in the shifted alphabet string
  - otherwise leave as is
- join the array back into a string
- return the string
=end

# ALPHABET = ('A'..'Z').to_a + ('a'..'z').to_a
# SHIFTED_ALPHABET = ('D'..'Z').to_a + ('A'..'C').to_a + ('d'..'z').to_a + ('a'..'c').to_a
# def letter_changes(string)
#   string.chars.map do |char|
#     ALPHABET.include?(char) ? SHIFTED_ALPHABET[ALPHABET.index(char)] : char
#   end.join
# end

# ALPHABET = ('A'..'Z').to_a + ('A'..'C').to_a + ('a'..'z').to_a + ('a'..'c').to_a
# def letter_changes(string)
#   string.chars.map do |char|
#     ALPHABET.include?(char) ? ALPHABET[ALPHABET.index(char) + 3] : char
#   end.join
# end

# p letter_changes('abc') == 'def'
# p letter_changes('WxY') == 'ZaB'
# p letter_changes('364.39') == '364.39'
# p letter_changes("JaneDoe37@gmail.com") == 'MdqhGrh37@jpdlo.frp'





### SMALLER THAN CURRENT
=begin
Write a method that takes an array of numbers as an argument. For each number in the input array, determine how many other numbers in the array are less than that current number. Return these results in an array.

When counting how many numbers are less than the current number, only consider unique values. If a given number occurs more than once in the array, it should only be counted once.

Examples:
p smaller_than([1, 2]) == [0, 1] # 0 numbers are less than 1, 1 number is less than 2
p smaller_than([1, 200]) == [0, 1]
p smaller_than([1, 1, 2, 2]) == [0, 0, 1, 1]
p smaller_than([1, 1, 2, 3]) == [0, 0, 1, 2]
p smaller_than([8, 1, 2, 3]) == [3, 0, 1, 2]
p smaller_than([7, 7, 7]) == [0, 0, 0]
p smaller_than([1]) == [0]

7:12
PROBLEM / EXAMPLES
input: array
  - contains numbers

output: array
  - each element represents the number of other elements in the array that the current element is greater than
    - current element is the number in the corresponding place in the input array
  - contains numbers
  - same size as input array
  - if a given number occurs more than once in input array:
    - only count it once in terms of being less than the current element
  - if no other elements are less than the current element, result is 0

DATA STRUCTURES
input: array # [1, 1, 2, 2]
  - array of unique values in input array: # [1, 2]
output: array # [0, 0, 1, 1]

ALGORITHM
- create an array of the unique values in the input array
- iterate over the input array
  - transform each element
    - count how many elements in the unique values array are less than the current element
    - return that count
- return the transformed array
=end

# def smaller_than(array)
#  uniques = array.uniq
#  array.map { |number| uniques.count { |unique| number > unique } }
# end

# p smaller_than([1, 2]) == [0, 1] # 0 numbers are less than 1, 1 number is less than 2
# p smaller_than([1, 200]) == [0, 1]
# p smaller_than([1, 1, 2, 2]) == [0, 0, 1, 1]
# p smaller_than([1, 1, 2, 3]) == [0, 0, 1, 2]
# p smaller_than([8, 1, 2, 3]) == [3, 0, 1, 2]
# p smaller_than([7, 7, 7]) == [0, 0, 0]
# p smaller_than([1]) == [0]




### SUBSTRING COUNT
=begin
Write a method that takes two strings as arguments and returns the number of times the second input string occurs as a substring within the first input string. Both input strings will consist solely of lowercase letters, and will always be at least one character in length.

Examples:
p count_substrings('abcdeb','b') == 2
p count_subsbrings('cc', 'cc') == 1
p count_substrings('abbcbb', 'bb') == 2
p count_substrings('abcdef', 'gh') == 0
p count_substrings('aaaaa') 'aa') == 4

7:51
PROBLEM / EXAMPLES
input: two strings
  - both consist solely of lowercase letters
  - both not empty, both have at least one character

output: integer
  - represents number of times second input string occurs in first input string
  - can be 0

DATA STRUCTURES
input: two strings 'abbcbb', 'bb'
  - substrings 'ab', 'bb', 'bc' . . .
    - same length as second input string
    - compare to second input string to see if match 
output: integer

ALGORITHM
- iterate over slices of string1
  - start at index 0, then 1, up to (string1 length - string2 length)
  - slice length = string2 length
  - compare to string2, increase count by 1 if match
- return count
=end

# def count_substrings(string1, string2)
#   limit = string1.size - string2.size
#   (0..limit).count do |index|
#     string1[index, string2.size] == string2
#   end
# end

# p count_substrings('abcdeb','b') == 2
# p count_substrings('cc', 'cc') == 1
# p count_substrings('abbcbb', 'bb') == 2
# p count_substrings('abcdef', 'gh') == 0
# p count_substrings('aaaaa', 'aa') == 4





### GREATEST PRODUCT
=begin
Write a method that takes an integer and returns the greatest product of five consecutive digits from the integer. The input integer will always be positive and will always contain more than five digits.

p greatest_product(123456) == 720 # (2 * 3 * 4 * 5 * 6)
p greatest_product(923456) == 1080 # (9 * 2 * 3 * 4 * 5)
p greatest_product(1234567890) == 15120 # (5 * 6 * 7 * 8 * 9)
p greatest_product(2494037820244202221011110532909999) == 0

4:18
PROBLEM / EXAMPLES
input: integer
  - positive
  - at least 6 digits in length

output: integer
  - greatest product of five consecutive digits in input integer
  - positive or zero

DATA STRUCTURES
input: integer # 123456
  - array of digits # [1, 2, 3, 4, 5, 6]
  - array of products of 5-element subarrays # [120, 720]
    - sort, pick the largest
output: integer # 720

ALGORITHM
- separate input integer into an array of digits
- iterate over the array
  - start at index 0, then 1, up to index (length - 5)
  - take 5-element slices
- get the product of each slice and store in an array
- sort the products
- return the largest product
=end

# def greatest_product(number)
#   digits = number.digits.reverse
#   (0..(digits.size - 5)).map do |index|
#     digits[index, 5].inject(:*)
#   end.sort.last
# end

# p greatest_product(123456) == 720 # (2 * 3 * 4 * 5 * 6)
# p greatest_product(923456) == 1080 # (9 * 2 * 3 * 4 * 5)
# p greatest_product(1234567890) == 15120 # (5 * 6 * 7 * 8 * 9)
# p greatest_product(2494037820244202221011110532909999) == 0





### ANAGRAM DIFFERENCES
=begin
Write a method that takes two strings as arguments and returns the total number of characters that must be removed from them to make them anagrams of each other. For this problem, two strings are anagrams if they contain all the same characters regardless of order. All input strings are either empty or contain only lowercase letters.

Examples:
p anagram_difference('', '') == 0                     # anagrams: '', ''
p anagram_difference('a', '') == 1                    # anagrams: '', ''
p anagram_difference('', 'a') == 1                    # anagrams: '', ''
p anagram_difference('ab', 'a') == 1                  # anagrams: 'a', 'a'
p anagram_difference('ab', 'ba') == 0                 # anagrams: 'ab', 'ba'
p anagram_difference('ab', 'cd') == 4                 # anagrams: '', ''
p anagram_difference('a', 'aab') == 2                 # anagrams: 'a', 'a'
p anagram_difference('codewars', 'hackerrank') == 10  # anagrams: 'cear', 'acer'

8:53
PROBLEM
input: two strings
  - can be empty
  - if not empty, contain only lowercase letters

output: integer
  - number of characters that must be removed to make strings anagrams of each other
    - two strings are anagrams if they contain all the same characters regardless of order
    - if strings are already anagrams of each other, return 0
    - if strings contain no characters in common, return combined length of both strings
    - an empty string is considered an anagram of an empty string
    - order of two strings doesn't matter
    - will be at least value of longer string length - shorter string length
    - maximum length of anagram is length of shorter string

EXAMPLES

DATA STRUCTURES
input: two strings
  - array of individual characters
output: integer

ALGORITHM
- sort input strings by length: shorter, longer # 'ba', 'dace'
- separate each string into an array of characters # ['b', 'a'], ['d', 'a', 'c', 'e']
- iterate over shorter array
  - if character is included in longer array, iterate counter by 1
- if counter ends up as 0, then return combined lengths of both arrays
- if counter > 0, return sum of (each length - counter)

=end

# def anagram_difference(string1, string2)
#   shorter, longer = [string1, string2].sort_by {|str| str.size }.map(&:chars)
#   count = 0
#   shorter.each do |char|
#     count += 1 if longer.include?(char)
#   end
#   (shorter.size - count) + (longer.size - count)
# end

# p anagram_difference('', '') == 0                     # anagrams: '', ''
# p anagram_difference('a', '') == 1                    # anagrams: '', ''
# p anagram_difference('', 'a') == 1                    # anagrams: '', ''
# p anagram_difference('ab', 'a') == 1                  # anagrams: 'a', 'a'
# p anagram_difference('ab', 'ba') == 0                 # anagrams: 'ab', 'ba'
# p anagram_difference('ab', 'cd') == 4                 # anagrams: '', ''
# p anagram_difference('a', 'aab') == 2                 # anagrams: 'a', 'a'
# p anagram_difference('codewars', 'hackerrank') == 10  # anagrams: 'cear', 'acer'





### ANAGRAMS
=begin
Write a method that takes two strings as arguments and returns true if they are anagrams of each other, false otherwise. For this problem, two strings are considered anagrams if they both contain all the same type and number of letters, regardless of case. All input strings contain only letter characters.

p is_anagram?('Creative', 'Reactive') == true
p is_anagram?('bold', 'DLOB') == true
p is_anagram?('apple', 'apple') == true
p is_anagram?('Apple', 'apple') == true
p is_anagram?('apple', 'apply') == false
p is_anagram?('apple', 'appl') == false
p is_anagram?('', '') == true

7:40
PROBLEM
input: two strings
  - contain only letter characters
  - letters may be upper or lower case
  - may be empty
output: boolean
  - true if input strings are anagrams
    - anagram means all the same number and type of letters, regardless of case
    - two identical strings are considered anagrams
    - strings do not have to be actual words
    - two empty strings are considered anagrams of each other
  - false if not

EXAMPLES

DATA STRUCTURES
- input: two strings: 'bold', 'DLOB'
  - arrays of individual characters: ['b', 'o', 'l', 'd'], ['B', 'O', 'L', 'D']
  - sorted, downcased: ['b', 'd', 'l', 'o'], ['b', 'd', 'l', 'o']
- output: boolean

ALGORITHM
- separate each input string into an array of individual characters
- downcase all letters in array
- sort arrays alphabetically
- compare to see if they are the same
=end

# def is_anagram?(string1, string2)
#   chars1 = string1.downcase.chars.sort
#   chars2 = string2.downcase.chars.sort
#   chars1 == chars2
# end

# def is_anagram?(string1, string2)
#   chars1, chars2 = [string1, string2].map { |str| str.downcase.chars.sort }
#   chars1 == chars2
# end

# def is_anagram?(string1, string2)
#   string1.downcase.chars.sort == string2.downcase.chars.sort
# end

# def is_anagram?(string1, string2)
#   chars1, chars2 = [string1, string2].map { |str| str.downcase.chars.tally }
#   chars1 == chars2
# end

# def is_anagram?(string1, string2)
#   string1.downcase.chars.tally == string2.downcase.chars.tally
# end

# p is_anagram?('Creative', 'Reactive') #== true
# p is_anagram?('bold', 'DLOB') == true
# p is_anagram?('apple', 'apple') == true
# p is_anagram?('Apple', 'apple') == true
# p is_anagram?('apple', 'apply') == false
# p is_anagram?('apple', 'appl') == false
# p is_anagram?('', '') == true





### SHORTEST LENGTH SUBARRAY
=begin
Write a method that takes two inputs: an array of positive integers, and a positive integer. The method should return the shortest length of a contiguous subarray from the input array for which the sum of its numbers is greater than or equal to the input integer.

p shortest_length([2, 3, 1, 2, 4, 3], 7) == 2
p shortest_length([1, 10, 5, 2, 7], 9) == 1
p shortest_length([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
p shortest_length([1, 2, 4, 1], 8) == 4
p shortest_length([1, 2, 4], 8) == 0
p shortest_length([], 1) == 0

7:39am
PROBLEM
inputs: 2
- 1. array of positive integers
  - empty array? RETURN 0
- 2. positive integer
  - represents target sum

output: positive integer
  - represents shortest length of a subarray
    - sum of all integers in subarray should be greater than or equal to input integer
    - subarray can be length 1
    - entire input array can be a subarray
    - if sum of all integers in input array is less than input integer, return 0
    - we are returning the length, not the subarray itself. Therefore don't have to worry about ties
      - as soon as we find a subarray whose sum is >= to target sum, return the length
    
EXAMPLES

DATA STRUCTURES
input: array, integer
  - subarrays
output: integer

ALGORITHM
- Examine all subarrays of length 1, then length 2, up to length of input array
  - start at length 1, then length 2, up to input array length
    - for each length, start at index 0, then index 1, up to index -1
- compare sum of subarray to target sum
  - if sum of a subarray is >= to target sum, return length
- return 0 if sum of no subarrays (including full input array) exceed target sum
=end

# def shortest_length(numbers, target_sum)
#   (1..numbers.size).each do |current_size|
#     (0...numbers.size).each do |start_index|
#       return current_size if numbers[start_index, current_size].sum >= target_sum
#     end
#   end
#   0
# end

# p shortest_length([2, 3, 1, 2, 4, 3], 7) == 2
# p shortest_length([1, 10, 5, 2, 7], 9) == 1
# p shortest_length([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
# p shortest_length([1, 2, 4, 1], 8) == 4
# p shortest_length([1, 2, 4], 8) == 0
# p shortest_length([], 1) == 0
