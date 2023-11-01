




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
