# COLLECTED PEDAC PROBLEMS

### BOUNCY COUNT
=begin
Some numbers have only ascending digits, like 123, 3445, 2489, etc. Some numbers have only descending digits, like 321, 5443, 9842, etc.

A number is "bouncy" if it has both ascending and descending digits, like 313, 92543, etc.

Write a method that takes a list of numbers and counts how many of them are bouncy.

Examples:
p bouncy_count([]) == 0
p bouncy_count([11, 0, 345, 21]) == 0
p bouncy_count([121, 4114]) == 2
p bouncy_count([176, 442, 80701644]) == 2
=end

# ALTERNATING ODD AND EVEN
=begin
Write a function that returns the maximum possible consecutive alternating odd and even (or even and odd) numbers. Minimum possible length is 2. If there's none return [].

Examples:
p longest_alternating_subarray([1, 2, 3, 4, 5, 6]) == [1, 2, 3, 4, 5, 6]
p longest_alternating_subarray([2, 4, 6, 8]) == []
p longest_alternating_subarray([1, 3, 5, 7]) == []
p longest_alternating_subarray([1, 1, 3, 7, 8, 5]) == [7, 8, 5]
p longest_alternating_subarray([4, 6, 7, 12, 11, 9, 17]) == [6, 7, 12, 11]
=end


# DECODER
=begin
We're receiving a set of messages in code. The messages are sets of text strings, like:

"alakwnwenvocxzZjsf"

Write a method to decode these strings into numbers. The decoded number should be the number of lowercase characters between the first two uppercase characters. If there aren't two uppercase characters, the number should be 0.

Examples:
p decode(['ZoL', 'heLlo', 'XX']) == [1, 0, 0]
p decode(['foUrsCoreAnd', 'seven', '']) == [2, 0, 0]
p decode(['lucYintheskyWith', 'dIaMonDs']) == [8, 1]
p decode([]) == []
=end


# LETTER COUNT
=begin
Write a method that takes a string as an argument and returns a hash containing the number of times each character present in the string occurs. The input string wil contain only alphabetic lowercase characters, and no spaces.

The hash keys should be symbols, and should be in alphabetical order, not order of appearance in the input string. The hash values should be the number of occurrences of the letter represented by the symbol.

Examples:
p letter_count('codewars') == { :a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1 }
p letter_count('activity') == { :a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1 }
p letter_count('arithmetics') == { :a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2 }
=end


# MAX SUM
=begin
Write a method that takes an array containing 0 or more integers and returns the maximum sum of a consecutive sequence of integers from that array.

The consecutive sequence can range from 0 elements up to all elements of the input array. A sequence with 0 elements in it should be considered to have a sum of 0.

Examples:
p max_sum([]) == 0
p max_sum([1, 2, 3]) == 6
p max_sum([-1, -2, -3]) == 0
p max_sum([1, 2, 3, -1]) == 6
p max_sum([1, -1, 2, 3, -1, 2]) == 6
p max_sum([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6 # [4, -1, 2, 1]
=end


# SUBSTRING TWICE
=begin
Write a method that takes two strings and returns true if there exists a substring that appears in both of them. Return false otherwise. Only consider substrings that are at least two characters in length. Disregard case (for example, 'ace' and 'Ace' would be considered the same substring).

All input strings will contain at least two characters, and will not contain any spaces.

EXAMPLES
p substring_twice?('face', 'Ace') == true
p substring_twice?('face', 'ACTUALLY') == true
p substring_twice?('face', 'gave') == false
p substring_twice?('aa', 'aa') == true
=end


# ALPHABETICAL ORDER
=begin
Write a method that, given a string, returns a new string containing only the alphabetic characters (all whitespace and non-alphabetic characters removed). These characters should be in case-insensitive alphabetical order, in the order they appear in the original string.

Examples:
p alphabetized('') == ''
p alphabetized(' ') == ''
p alphabetized('9#$.%') == ''
p alphabetized(' ba ') == 'ab'
p alphabetized('Ab Ba') == 'AabB'
p alphabetized('Ba Ab') == 'aABb'
p alphabetized('9A #b$B .a%') == 'AabB'
p alphabetized('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ') == 'aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ'
=end


# CLOSEST VALUES
=begin
Write a method that takes an array of integers as an argument and returns the two numbers that are closest together in value. If more than one pair of integers satisfies this condition, return the pair whose elements occurs first in the input array.

You may assume that the input array will always contain at least three elements.

Examples:
p closest_numbers([2, 4, 6, 7]) == [6, 7]
p closest_numbers([5, 15, 25, 11, 20]) == [15, 11]
p closest_numbers([3, 6, 8, 11, 13]) == [6, 8]
p closest_numbers([12, 7, 17]) == [12, 7]
=end


# DASHERIZER
=begin
Write a method that takes an integer as an argument and returns a string, with a dash placed between any consecutive odd digits.

Examples:
p dasherizer(2112) == '21-12'
p dasherizer(201305742) == '201-305-742'
p dasherizer(123456789) == '123456789'
p dasherizer(217521) == '21-7-521'
=end


# LONGEST ALPHABETICAL
=begin
Write a method that takes a string containing only lowercase letters as an argument, and returns the longest substring that is in alphabetical order. If there are multiple solutions, return the substring that occurs first in the input string. All input strings will be at least one character in length.

Examples:
p longest('abc') == 'abc'
p longest('abcace') == 'abc'
p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') == 'fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'
=end


# ALPHABET SCORE
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
=end


# DELETE A DIGIT
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
p delete_digit(1001) == 101
=end


# REPEATED SUBSTRING
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
=end


### TRIPLE DOUBLE ***
=begin
Write a method that takes two integers as arguments and returns true if the first integer has a sequence of at least three in a row of the same number, and the second integer has a sequence of at least two in a row of that same number. Otherwise, return false.

Examples:
p triple_double(12345, 12345) == false
p triple_double(1222345, 122345) == true
p triple_double(1222345, 123345) == false
p triple_double(666789, 12345666) == true
p triple_double(451999277, 41177722899) == true
=end


# MULTIPLY ALL PAIRS
=begin
Write a method that, given two arrays each containing lists of numbers, returns a new array that contains the product of every pair of numbers that can be formed between the elements of the two arrays. The results should be sorted by increasing value.

You may assume that neither argument is an empty array.

Examples:
p multiply_all_pairs([3], [1, 3, 2]) == [3, 6, 9]
p multiply_all_pairs([1, 2], [3, 4]) == [3, 4, 6, 8]
p multiply_all_pairs([1, 2], [4, 3, 1, 2]) == [1, 2, 2, 3, 4, 4, 6, 8]
=end


# NEXT BIGGEST NUMBER
=begin
Write a method that, given a positive integer, returns the next biggest number that can be formed from the same digits. If no bigger number can be formed from those digits, return -1

Examples:

p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(315) == 351
p next_bigger_num(111) == -1
p next_bigger_num(13579) == 13597
p next_bigger_num(13573) == 13735
p next_bigger_num(13576) == 13657
p next_bigger_num(97531) == -1
=end


# PAIRS
=begin
Write a function that takes an array as an argument, and returns an array with pairs of elements grouped into subarrays. The first element should be paired with the last, the second element with the second to last, etc.

If the array has an odd number of elements, repeat the middle element twice for the final pair.

Examples
p pairs([1, 2, 3, 4, 5, 6]) == [[1, 6], [2, 5], [3, 4]]
p pairs([1, 2, 3, 4, 5]) == [[1, 5], [2, 4], [3, 3]]
p pairs([1, 2]) == [[1, 2]]
p pairs([1]) == [[1, 1]]
p pairs([]) == []
=end


# VOWEL SUBSTRINGS
=begin
Write a method that takes a string as an argument and returns the number of "vowel substrings" within it. A "vowel substring" is a consecutive sequence of characters within the input string that consists only of vowels ('a', 'e', 'i', 'o', and 'u') and has all five vowels present in it at least once. All input strings will contain only lowercase letters.

Examples:
p count_vowel_substrings('abcde') == 0
p count_vowel_substrings('aeiou') == 1
p count_vowel_substrings('iaoue') == 1
p count_vowel_substrings('aeiogu') == 0
p count_vowel_substrings('aeiouu') == 2
p count_vowel_substrings('aeiouuu') == 3
p count_vowel_substrings('aaeeiioouu') == 4
=end


# LETTER CHANGES
=begin
Write a method that takes a string as an argument and returns a new string with every letter character replaced with the 3rd letter following it in the alphabet ('a' becomes 'd', 'b' becomes 'e', etc).

Maintain the case of the original letter. Loop back to the beginning of the alphabet if the 3rd letter is past the end ('x' becomes 'a', 'Y' becomes 'B', etc). Leave any non-letter characters unchanged.

Examples:
p letter_changes('abc') == 'def'
p letter_changes('WxY') == 'ZaB'
p letter_changes('364.39') == '364.39'
p letter_changes("JaneDoe37@gmail.com") == 'MdqhGrh37@jpdlo.frp'
=end


# SMALLER THAN CURRENT
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
=end


# SUBSTRING COUNT
=begin
Write a method that takes two strings as arguments and returns the number of times the second input string occurs as a substring within the first input string. Both input strings will consist solely of lowercase letters, and will always be at least one character in length.

Examples:
p count_substrings('abcdeb','b') == 2
p count_substrings('cc', 'cc') == 1
p count_substrings('abbcbb', 'bb') == 2
p count_substrings('abcdef', 'gh') == 0
p count_substrings('aaaaa', 'aa') == 4
=end


# GREATEST PRODUCT
=begin
Write a method that takes an integer and returns the greatest product of five consecutive digits from the integer. The input integer will always be positive and will always contain more than five digits.

Examples:
p greatest_product(123456) == 720 # (2 * 3 * 4 * 5 * 6)
p greatest_product(923456) == 1080 # (9 * 2 * 3 * 4 * 5)
p greatest_product(1234567890) == 15120 # (5 * 6 * 7 * 8 * 9)
p greatest_product(2494037820244202221011110532909999) == 0
=end


# ANAGRAM DIFFERENCES
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
=end


# ANAGRAMS
=begin
Write a method that takes two strings as arguments and returns true if they are anagrams of each other, false otherwise. For this problem, two strings are considered anagrams if they both contain all the same type and number of letters, regardless of case.

Examples:
p anagram?('Creative', 'Reactive') == true
p anagram?('bold', 'DLOB') == true
p anagram?('apple', 'apple') == true
p anagram?('Apple', 'apple') == true
p anagram?('apple', 'apply') == false
p anagram?('apple', 'appl') == false
p anagram?('', '') == true
=end


# SHORTEST LENGTH SUBARRAY
=begin
Write a method that takes two inputs: an array of positive integers, and a positive integer. The method should return the shortest length of a subarray of consecutive elements from the input array for which the sum of its numbers is greater than or equal to the input integer. If no such subarray exists, return 0

Examples:
p shortest_length([2, 3, 1, 2, 4, 3], 7) == 2 # [4, 2]
p shortest_length([1, 10, 5, 2, 7], 9) == 1 # [10]
p shortest_length([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4 # [100, 1, 0, 200]
p shortest_length([1, 2, 4, 1], 8) == 4 # [1, 2, 4, 1]
p shortest_length([1, 2, 4], 8) == 0
p shortest_length([], 1) == 0
=end
