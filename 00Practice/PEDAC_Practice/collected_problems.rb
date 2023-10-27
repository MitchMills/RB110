##### ALPHABETIZED ORDER OF APPEARANCE #####
=begin
Write a method that, given a string, returns a new string containing only the alphabetic characters (all whitespace and non-alphabetic characters removed). These characters should be in case-insensitive alphabetical order, in the order they appear in the original string.

EXAMPLES
p alphabetized("") == ""
p alphabetized(" ") == ""
p alphabetized(" a ") == "a"
p alphabetized("Ab Ba") == "AabB"
p alphabetized("9A #b$B .a%") == "AabB"
p alphabetized("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ") == "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"
=end




##### GREATEST PRODUCT #####
=begin 
Write a method that, given a string containing only numbers, will return the substring of five consecutive numbers with the greatest product. The input string will always contain than five digits. If more than one substring results in the greatest product, return the one that occurs first.

p greatest_product("111111") == 11111
p greatest_product("111112") == 11112
p greatest_product("123456") == 23456
p greatest_product("123455555") == 55555
p greatest_product("1020304") == 10203
=end




##### VOWEL SUBSTRINGS #####
=begin
A substring is a contiguous sequence of characters within a string.
  
A "vowel substring" is a substring that only consists of vowels ('a', 'e', 'i', 'o', and 'u') AND that has all five vowels present in it at least once.
  
Write a method that, given a string, returns the number of vowel substrings in that string.

p count_vowel_substrings("abcde") == 0
p count_vowel_substrings("cuaieuouac") == 7
p count_vowel_substrings("aeiouu") == 2
p count_vowel_substrings("unicornarihan") == 0
=end




##### MULTIPLY ALL PAIRS #####
=begin
Write a method that, given two arrays each containing lists of numbers, returns a new array that contains the product of every pair of numbers that can be formed between the elements of the two arrays. The results should be sorted by increasing value.

You may assume that neither argument is an empty array.

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
=end




##### NEXT BIGGER NUMBER #####
=begin
Write a method that, given a positive integer, returns the next biggest number that can be formed from the same digits. If no bigger number can be formed from those digits, return -1

p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(111) == -1
p next_bigger_num(12345) == 12354
p next_bigger_num(54321) == -1
=end




##### SAME SUBSTRINGS #####
=begin
Write a method that, given two strings, returns true if a substring appears in both strings, and false otherwise. For this problem, a substring is considered to be at least two characters.

p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'lllt') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoundofItIsAtrociou') == true
=end



##### TRIPLE DOUBLE #####
=begin
Write a method which, given two integers, returns true if there is both a straight triple of a digit at any place in the first integer, and a straight double of the same digit in the second integer. If not, return false.

p triple_double(12345, 12345) == false
p triple_double(1222345, 12345) == false
p triple_double(666789, 12345667) == true
p triple_double(451999277, 411777228999) == true


=end


##### DASHED DIGITS #####
=begin
Write a method that, given an integer, returns a string representation of that same number, with a dash placed between consecutive odd digits.

p dasherizer(2112) == '21-12'
p dasherizer(201105742) == '201-105-742'
p dasherizer(123456789) == '123456789'
p dasherizer(21121) == '21-121'

=end



##### ALPHABETICAL SUBSTRING #####
=begin
Write a method that, given a string, returns the longest substring within it where all the characters are in alphabetical order.

Input strings will only consist of lowercase alphabetic characters, and will be at least one letter long.

If there are multiple alphabetical substrings of the same length, return the one that occurs first.

p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') ==  'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') == 'fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'

=end



##### SUBSTRING COPIES ######
=begin
Write a method to check whether a given string can be constructed by taking a substring of it and appending two or more copies of the substring together

p repeated_substring("abab") == true
p repeated_substring("aba") == false
p repeated_substring("aabaaba") == false
p repeated_substring("abaababaab") == true
p repeated_substring("abcabcabcabc") == true
=end



##### CLOSEST VALUES #####
=begin
Write a method that takes an array of integers and returns the
two numbers in it that are closest together in value.

Examples:
p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]
=end



##### DELETE A DIGIT #####
=begin
Write a method that takes an integer and returns the largest integer that can be obtained by deleting exactly one digit.

Assume all input integers will contain at least two digits

p delete_digit(791983) == 91983
p delete_digit(152) == 52
p delete_digit(1001) == 101
p delete_digit(10) == 1
=end



##### FIND CHILDREN #####
=begin
def find_children(string)
  mothers_and_children = ('A'..'Z').zip(('a'..'z')).flatten
  string.chars.sort_by do |char|
    mothers_and_children.index(char)
  end.join
end

p find_children("abBA") == "AaBb"
p find_children("AaaaaZazzz") == "AaaaaaZzzz"
p find_children("CbcBcbaA") == "AaBbbCcc"
p find_children("xXfuUuuF") == "FfUuuuXx"
p find_children("") == ""
=end



##### ALPHABETIC NUMBERS #####
=begin
Write a method that takes an array of integers, with values between 0 and 9, and returns an array of those integers sorted based on the English words for each number: zero, one, two, three, etc.

Example:
numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
alphabetic_number_sort(numbers) == [8, 5, 4, 9, 1, 7, 6, 10, 3, 2, 0]
=end



##### PAIRS #####
=begin
Write a method that takes an array of numbers as an argument, and returns an array of arrays containing pairs of those numbers. Pair the first number in the array with the last, the second number with the second to last, etc.

If the input array has an odd number of elements, repeat the middle element twice for the last pair.

Return an empty array if the input is an empty array.

Examples:
p pairs([1, 2, 3, 4]) == [[1, 4], [2, 3]]
p pairs([1, 2, 3, 4, 5]) == [[1, 5], [2, 4], [3, 3]]
p pairs([4, 7]) == [[4, 7]]
p pairs([9]) == [[9, 9]]
p pairs ([]) == []
=end



##### SMALLER THAN #####
=begin
Write a method that takes an array of numbers as an argument. For each number in the input array, find out how many other numbers in the array are smaller than that current number. Return these results in an array.

Only consider unique values when counting numbers. If a given number occurs more than once in the array, it should only be counted once.

Examples:
p smaller_than([1, 2]) == [0, 1] # 0 numbers are smaller than 1, 1 number is smaller than 2
p smaller_than([1, 200]) == [0, 1]
p smaller_than([1, 1, 2, 2]) == [0, 0, 1, 1]
p smaller_than([1, 1, 2, 3]) == [0, 0, 1, 2]
p smaller_than([8, 1, 2, 3]) == [3, 0, 1, 2]
p smaller_than([7, 7, 7]) == [0, 0, 0]
p smaller_than([1]) == [0]

# The tests above should print "true".
=end



##### SUBSTRING COUNT #####
=begin
Write a method that takes two strings as arguments and returns the number of times the second string is found as a substring within the first string.

All input strings contain only lowercase letter characters or are empty

Examples:
p count_substrings('aabbccddbbe', 'bb') == 2
p count_substrings('abcdeb','b') == 2
p count_substrings('abcdef', 'abcdef') == 1
p count_substrings('abcdef', 'abcdefg') == 0
p count_substrings('abcdef', 'gh') == 0
p count_substrings('abcdef', '') == 0
p count_substrings('', 'a') == 0
p count_substrings('aaaaa', 'aa') == 4
=end


##### CONSECUTIVE DIGITS #####
=begin
Write a method that takes a string of digits as an argument and finds the greatest product of five consecutive digits in the string

The input string will always have more than five digits.

Examples:
p greatest_product("123456") == 720
p greatest_product("12345678909876") == 15120
p greatest_product("01234056780") == 0
=end



##### ANAGRAM DIFFERENCE #####
=begin
Write a method that takes two strings as arguments and returns the number of letters that must be removed from them to make them anagrams of each other.

For this problem, an anagram is defined as a string formed by reordering the letters of another string. Both strings must contain all the same letters, and only those letters, to be considered an anagram.

All input strings are either empty or contain only lowercase letters.

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


##### ANAGRAMS #####
=begin
Write a method that returns `true` if two strings are anagrams of each other, and `false` otherwise.

For this problem, an anagram is defined as a string formed by reordering the letters of another string. Both strings must contain all the same letters, and only those letters, to be considered an anagram.

p is_anagram?('Creative', 'Reactive') == true
p is_anagram?("foefet", "toffee") == true
p is_anagram?("Buckethead", "DeathCubeK") == true
p is_anagram?("Twoo", "WooT") == true
p is_anagram?("dumble", "bumble") == false
p is_anagram?("ound", "round") == false
p is_anagram?("apple", "pale") == false
p is_anagram("", "") == true
=end


##### MINIMUM SUBARRAY SUM #####
=begin
Given an array of positive integers and a positive integer, find the minimal length of a contiguous subarray for which the sum >= integer.

p min_subarray_length([2, 3, 1, 2, 4, 3], 7) == 2
p min_subarray_length([1, 10, 5, 2, 7], 9) == 1
p min_subarray_length([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
p min_subarray_length([1, 2, 4], 8) == 0
=end



##### LETTERS IN THEIR POSITIONS #####
=begin
Given an array of strings, return an array containing the number of letters in each string that occupy their equivalent positions in the alphabet. 

For example, in the string 'abode', the letter `a` is in position 1, and the letter `b` is in position 2. In the alphabet, `a` and `b` are also in positions 1 and 2.
 
The letters `d` and `e` in 'abode' also occupy the positions they would occupy in the alphabet (positions 4 and 5). So the number of letters in 'abode' that occupy their equivalent positions in the alphabet is 4.
 
Examples:
p letters_in_position(["abode","ABc","xyzD"]) == [4,3,1]
p letters_in_position(["abide","ABc","xyz"]) == [4,3,0]
p letters_in_position(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) == [6,5,7]
p letters_in_position(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]
=end

### Easier Letters in their Positions ###
=begin
Given a string, return an integer representing the number of letters in the string that occupy their equivalent positions in the alphabet. 

For example, in the string 'abode', the letter `a` is in position 1, and the letter `b` is in position 2. In the alphabet, `a` and `b` are also in positions 1 and 2.
 
The letters `d` and `e` in 'abode' also occupy the positions they would occupy in the alphabet (positions 4 and 5). So the number of letters in 'abode' that occupy their equivalent positions in the alphabet is 4.

p letters_in_position("Abode") == 4
p letters_in_position("abide") == 4
p letters_in_position("TEST") == 0
p letters_in_position("IAMDEFANDJKL") == 6
p letters_in_position("encode") == 1
=end
