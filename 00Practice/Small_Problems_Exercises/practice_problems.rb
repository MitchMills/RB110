# ANAGRAM DIFFERENCE
=begin
Given two words, how many letters do you have to remove from them to make them anagrams?

PROBLEM 6:47
input: 2 strings
  - can be empty
  - all characters are lowercase alphabetic

output: integer
  - represents the number of characters that need to be removed from both or either input string so that the two strings are anagrams
  - anagram: two strings contain all the same type and number of characters
    - 2 empty strings are considered anagrams of each other

EXAMPLES

DATA STRUCTURES
needs:
  - way to find target anagram
  - way to determine how many characters to remove from each input string to reach target anagram

start: 2 strings
  - longer and shorter input strings
  - target anagram: shorter input string, with only common letters selected
  - length of target anagram
  - length of each input string - length of target anagram
finish: integer (sum of above)

ALGORITHM
- determine which input string is shorter
- create an array of each individual character in shorter input string
- from this, create an array of only characters that also appear in longer input string: these are the letters in the target anagram
- get the length of the target anagram
- return the sum of (shorter length - target anagram length) and (longer length - target anagram length)
=end

def anagram_difference(string1, string2)
  shorter, longer = [string1, string2].sort_by(&:size)
  anagram = shorter.chars.select { |char| longer.include?(char) }
  (shorter.size - anagram.size) + (longer.size - anagram.size)
end

# def anagram_difference(string1, string2)
#   target_anagram = []

#   target_letters1 = string1.chars.select { |char| string2.include?(char) }
#   target_letters2 = string2.chars.select { |char| string1.include?(char) }

#   target_letters1.each do |char|
#     count1 = target_letters1.count(char)
#     count2 = target_letters2.count(char)
#     target_count = [count1, count2].min
#     target_anagram << char if target_anagram.count(char) < target_count
#   end

#   target_size = target_anagram.size
#   (string1.size - target_size) + (string2.size - target_size)
# end

p anagram_difference('', '') == 0
p anagram_difference('a', '') == 1
p anagram_difference('', 'a') == 1
p anagram_difference('ab', 'a') == 1
p anagram_difference('ab', 'ba') == 0
p anagram_difference('ab', 'cd') == 4
p anagram_difference('aab', 'a') == 2
p anagram_difference('a', 'aab') == 2
p anagram_difference('codewars', 'hackerrank') == 10

p anagram_difference(
  "oudvfdjvpnzuoratzfawyjvgtuymwzccpppeluaekdlvfkhclwau",
  "trvhyfkdbdqbxmwpbvffiodwkhwjdjlynauunhxxafscwttqkkqw"
  ) == 42
p anagram_difference(
  "fcvgqognzlzxhmtjoahpajlplfqtatuhckxpskhxiruzjirvpimrrqluhhfkkjnjeuvxzmxo",
  "qcfhjjhkghnmanwcthnhqsuigwzashweevbegwsbetjuyfoarckmofrfcepkcafznykmrynt"
  ) == 50


# FIRST AND LAST
=begin
Write a method that takes a string as an argument and returns a new string according to
the following rules:

If a letter occurs only once in the string, leave it unchanged

If a letter occurs more than once, capitalize the first and last occurrences of that
letter in the string

The input string will only contain lowercase alphabetic characters

PROBLEM 6:25
input: string
  - contains only lowercase alphabetic characters
output: new string
  - if a letter occurs only once in the input string
    - leave it unchanged
  - if a letter occurs more than once
    - capitalize 1st and last occurrences

EXAMPLES

DATA STRUCTURES
needs:
  - way to determine which letters occur more than once: multiples
  - way to get indexes of multiples
  - way to get first and last indexes of multiples
  - way to capitalize letters at those indexes

start: string
  - array of individual letters in input string
  - array of unique letters
  - array of unique letters that occur more than once: multiples
  - nested array of indexes of each multiple
    - subarrays are all the indexes a particular letter occurs at
  - flat array of all first and last indexes
  - transformed array of individual letters
finish: new string

ALGORITHM
- determine which letters occur more than once
  - create an array of unique characters from the input string
  - select unique characters that occur more than once in the input string: multiples
- get the first and last indexes of those letters
  - transform the multiples array
    - each letter becomes a subarray of indexes
     - iterate over each letter
      - iterate over each index of the input string
        - select indexes where the letter at that index matches the current letter
    - transform the indexes array
      - each subarray is the first and last index for a particular letter
    - flatten the transformed array
- create a new string with letters at those indexes capitalized
  - create an array of individual characters from the input string
  - transform this array:
    - for each letter and its index
      - capitalize the letter if the index is in the indexes array
      - otherwise leave as is
  - convert the array to a string and return it
=end

# def first_and_last_case(string)
#   multiples = get_multiples(string)
#   indexes = get_indexes(multiples, string)
#   string.chars.map.with_index do |char, index|
#     indexes.include?(index) ? char.upcase : char
#   end.join
# end

# def get_multiples(string)
#   string.chars.uniq.select { |char| string.count(char) > 1 }
# end

# def get_indexes(multiples, string)
#   all_indexes = multiples.map do |letter|
#     string.chars.each_index.select { |index| string[index] == letter }
#   end
#   all_indexes.flat_map { |indexes| [indexes.first, indexes.last] }
# end

# p first_and_last_case('abc') == 'abc'
# p first_and_last_case('aaabc') == 'AaAbc'
# p first_and_last_case('aaabccbb') == 'AaABCCbB'

# string = 'thequickbrownfoxjumpsoverthelazydog'
# new_string = 'THEqUickbROwnfoxjUmpsoveRTHElazydOg'
# p first_and_last_case(string) == new_string


### NUMBERS IN STRING
=begin
Implement a function that calculates the sum of numbers inside of a string.

You can expect that the string will include only positive numbers.

PROBLEM 7:41
input: string
  - can contain any type of character
output: integer
  - represents sum of any numeric characters found in string
    - consecutive numeric characters represent multi-digit numbers

EXAMPLES

DATA STRUCTURES
needs:
  - way to identify numeric characters
  - way to extract numeric characters from string
    - way to keep consecutive numeric characters together

start: string
  - array of all numeric characters
  - array of individual characters from input string
  - transformed array
    - all non-numeric characters transformed into spaces
  - string created from transformed array
  - array of 'words' from transformed array
  - array of integers
finish: integer (sum of array)

ALGORITHM
- create an array of all numeric characters
- create an array of individual characters from input string
- transform this array
  - if a character is numeric, leave it unchanged
  - otherwise, replace it with a space
- convert the transformed array into a string
- create an array of 'words' from this string
- transform the array into an array of integers
- get the sum of the integers and return it
=end

# NUMERICS = ('0'..'9').to_a

# def sum_of_numbers(string)
#   digits = string.chars.map { |char| NUMERICS.include?(char) ? char : ' ' }
#   numbers = digits.join.split.map(&:to_i)
#   numbers.sum
# end

# p sum_of_numbers("L12aun3ch Sch3oo451") #== 469
# p sum_of_numbers("HE2LL3O W1OR5LD") == 11
# p sum_of_numbers("The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog") == 3635

### SEVENTEEN
=begin
Create a method that takes an array of integers as an argument. The method should determine the minimum integer value that can be appended to the array so the sum of all the elements equal the closest prime number that is greater than the current sum of the numbers. For example, the numbers in [1, 2, 3] sum to 6. The nearest prime number greater than 6 is 7. Thus, we can add 1 to the array to sum to 7.

Notes:

    The array will always contain at least 2 integers.
    All values in the array must be positive (> 0).
    There may be multiple occurrences of the various numbers in the array.

PROBLEM 4:37
input: array
  - elements are integers
    - all positive (> 0)
  - minimum length = 2
  - values can be repeated

output: integer
  - minimum value that can be added to array sum so that
    - total sum equals closest prime number > current sum

EXAMPLES

DATA STRUCTURES
needs:
  - way to find the next greatest prime number
  - way to find current sum
  - way to find difference

start: array
  - sum of array
  - range of numbers: from sum + 1 up to ...
  - next prime number
    - for each number in range
      - make sure no numbers between 2 and integer square root of current number divide evenly
finish: integer (next prime - current sum)

ALGORITHM
- get the sum of the input array
- find the next prime number larger than that sum
  - create an endless range starting from (sum + 1)
  - for each candidate number in that range
    - create a potential factor range
      -from 2 up to the integer square root of that number
      - return the candidate number if none of the potential factors
        - divide evenly into candidate number
      - else proceed to the next number
- subtract the sum from the next prime number, return the difference
=end

# def nearest_prime_sum(array)
#   sum = array.sum
#   next_prime = find_next_prime(sum)
#   next_prime - sum
# end

# def find_next_prime(number)
#   ((number + 1)..).find do |candidate|
#     max_factor = Integer.sqrt(candidate)
#     (2..max_factor).none? { |factor| candidate % factor == 0 }
#   end
# end

# p nearest_prime_sum([1, 2, 3]) == 1        # Nearest prime to 6 is 7
# p nearest_prime_sum([5, 2]) == 4           # Nearest prime to 7 is 11
# p nearest_prime_sum([1, 1, 1]) == 2        # Nearest prime to 3 is 5
# p nearest_prime_sum([2, 12, 8, 4, 6]) == 5 # Nearest prime to 32 is 37
# # Nearest prime to 163 is 167
# p nearest_prime_sum([50, 39, 49, 6, 17, 2]) == 4

### SIXTEEN
=begin
Create a method that returns the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. You may assume that the input string contains only alphanumeric characters.

PROBLEM 2:18
input: string
  - contains only alphanumeric characters

output: integer
  - number of:
    - distinct alphabetic and numeric characters
      - that occur more than once in input string
        - case insensivite: 'A' == 'a'

EXAMPLES

DATA STRUCTURES
needs:
  - way to count occurrences of each character in input string
  - way to include only characters with a count > 1
  - way to deal with case

start: string
  - downcased string
  - array of individual characters in downcased string
  - array of unique individual characters
finish: integer

ALGORITHM
- create a downcased version of the input string
- create an array of unique individual characters in input string
- for every letter in this array
  - count it if it occurs more than once in input string
- return the count
=end

# def distinct_multiples(string)
#   downcased = string.downcase
#   uniques = downcased.chars.uniq
#   uniques.count { |unique| downcased.count(unique) > 1 }
# end

# p distinct_multiples('xyz') == 0               # (none
# p distinct_multiples('xxyypzzr') == 3          # x, y, z
# p distinct_multiples('xXyYpzZr') == 3          # x, y, z
# p distinct_multiples('unununium') == 2         # u, n
# p distinct_multiples('multiplicity') == 3      # l, t, i
# p distinct_multiples('7657') == 1              # 7
# p distinct_multiples('3141592653589793') == 4  # 3, 1, 5, 9
# p distinct_multiples('2718281828459045') == 5  # 2, 1, 8, 4, 5

### FIFTEEN
=begin
Create a method that takes a string argument that consists entirely of numeric digits and computes the greatest product of four consecutive digits in the string. The argument will always have more than 4 digits.

PROBLEM 1:31
input: string
  - contains only numeric characters
  - will always have a length > 4
output: integer
  - greatest product of four consecutive digits from input string

EXAMPLES

DATA STRUCTURES
needs:
  - way to create all possible consecutive 4-digit substrings
  - way to get product of each substring
  - way to get greatest product

start: string
  - array of all consecutive 4-digit substrings
  - array of products
finish: integer (greatest product)

ALGORITHM
- create an array of all 4-digit substrings from input string
- transform substrings array into an array of products
  - convert each substring into an integer
  - create an array of individual digits from integer
  - get product of digits
- return the greatest product
=end

# def greatest_product(string)
#   sequences = string.to_i.digits.each_cons(4).to_a
#   products = sequences.map { |sequence| sequence.inject(:*) }
#   products.max
# end

##
# def greatest_product(string)
#   substrings = string.chars.each_cons(4).map(&:join)
#   products = substrings.map do |substring|
#     substring.to_i.digits.inject(:*)
#   end
#   products.max
# end

# p greatest_product('23456') #== 360      # 3 * 4 * 5 * 6
# p greatest_product('3145926') == 540    # 5 * 9 * 2 * 6
# p greatest_product('1828172') == 128    # 1 * 8 * 2 * 8
# p greatest_product('123987654') == 3024 # 9 * 8 * 7 * 6

### FOURTEEN
=begin
Create a method that takes a single integer argument and returns the sum of all the multiples of 7 or 11 that are less than the argument. If a number is a multiple of both 7 and 11, count it just once.

For example, the multiples of 7 and 11 that are below 25 are 7, 11, 14, 21, and 22. The sum of these multiples is 75.

If the argument is negative, return 0.

PROBLEM 1:19
input: integer
  - can be positive or negtive

output: integer
  - sum of all multiples of 7 or 11 that are less than input integer
    - count a number only once if it is a multiple of both 7 and 11
  - return 0 if input integer is negative

EXAMPLES

DATA STRUCTURES
needs:
  - way to generate all multiples of 7 or 11 that are less than input integer
  - way to avoid counting a multiple of both 7 and 11 twice
  - way to get sum of multiples
  - way to deal with negative numbers?

start: integer
  - create a range from 7 up to input integer (non-inclusive)
  - select numbers from the range if they are multiples of 7 OR multiples of 11
finish: integer (sum of mulitples)

ALGORITHM
- create a range of potential multiples
  - from 7 up to (input integer - 1)
- for every number in the range
  - select it if:
    - it is evenly divisible by 7 OR
    - it is evenly divisible by 11
- return the sum of the selected multiples
=end

# def seven_eleven(number)
#   candidates = (7...number)
#   multiples = candidates.select do |candidate|
#     candidate % 7 == 0 || candidate % 11 == 0
#   end
#   multiples.sum
# end

##
# def seven_eleven(number)
#   candidates = (7...number)
#   candidates.sum do |candidate|
#     candidate % 7 == 0 || candidate % 11 == 0 ? candidate : 0
#   end
# end

# p seven_eleven(10) == 7
# p seven_eleven(11) == 7
# p seven_eleven(12) == 18
# p seven_eleven(25) == 75
# p seven_eleven(100) == 1153
# p seven_eleven(0) == 0
# p seven_eleven(-100) == 0

### THIRTEEN
=begin
Create a method that takes two strings as arguments and returns true if some portion of the characters in the first string can be rearranged to match the characters in the second. Otherwise, the method should return false.

You may assume that both string arguments only contain lowercase alphabetic characters. Neither string will be empty.

PROBLEM 1:11
input: 2 strings
  - not empty
  - contain only lowercase alphabetic characters

output: boolean
  - true if:
    - some portion of characters in string 1 can be rearranged to
      - match all characters in string 2
    - i.e. all characters of string 2 are present in string 1
      - in at least the same number
  - false otherwise

EXAMPLES

DATA STRUCTURES
needs:
  - way to determine if all string 2 characters are in string 1 in the right amount
    - way to compare counts of each letter in string 1 to counts in string 2

start: string1, string2
  - string1 counts of every letter in string2 must be >= string2 counts of that letter
finish: boolean

ALGORITHM
- consider each letter in string2
  - compare count of that letter in string2 to
    - count of that letter in string1
  - return true if all string1 counts >= string2 counts
  - return false otherwise
=end

# def unscramble(string1, string2)
#   string2.chars.all? do |char|
#     string1.count(char) >= string2.count(char)
#   end
# end

# p unscramble('ansucchlohlo', 'launchschool') == true
# p unscramble('phyarunstole', 'pythonrules') == true
# p unscramble('phyarunstola', 'pythonrules') == false
# p unscramble('boldface', 'coal') == true

### TWELVE
=begin
Create a method that takes a string as an argument and returns true if the string is a pangram, false if it is not.

Pangrams are sentences that contain every letter of the alphabet at least once. For example, the sentence "Five quacking zephyrs jolt my wax bed." is a pangram since it uses every letter at least once. Note that case is irrelevant.

PROBLEM 1:03
input: string
  - can contain any type of character

output: boolean
  - true if input string is a "pangram"
    - pangram:
      - contains every letter of alphabet at least once
      - ignore case: 'T' == 't'
  - false otherwise

EXAMPLES

DATA STRUCTURES
needs:
  - way to check if every letter in alphabet is used
    - regardless of case

start: string
  - array of all lowercase alphabetic letters
  - downcased string
end: boolean

ALGORITHM
- create an array of all lowercase alphabetic characters
- downcase the input string
- check if all letters in the alphabet array are present in the downcased string
  - return true if yes
  - return false if no
=end

# ALPHABET = ('a'..'z').to_a

# def is_pangram(string)
#   ALPHABET.all? { |letter| string.downcase.include?(letter) }
# end

# p is_pangram('The quick, brown fox jumps over the lazy dog!') == true
# p is_pangram('The slow, brown fox jumps over the lazy dog!') == false
# p is_pangram("A wizard's job is to vex chumps quickly in fog.") == true
# p is_pangram("A wizard's task is to vex chumps quickly in fog.") == false
# p is_pangram("A wizard's job is to vex chumps quickly in golf.") == true

# my_str = 'Sixty zippers were quickly picked from the woven jute bag.'
# p is_pangram(my_str) == true

### ELEVEN
=begin
Create a method that takes a nonempty string as an argument and returns an array consisting of a string and an integer. If we call the string argument s, the string component of the returned array t, and the integer component of the returned array k, then s, t, and k must be related to each other such that s == t * k. The values of t and k should be the shortest possible substring and the largest possible repeat count that satisfies this equation.

You may assume that the string argument consists entirely of lowercase alphabetic letters.

PROBLEM 12:46
input: string
  - not empty
  - contains only lowercase alphabetic characters
output: array
  - elements are:
    - substring
      - shortest possible substring
    - integer
      - largest possible repeat count
      - can be 1
  - that satisfy:
    - substring * repeat count == input string

EXAMPLES

DATA STRUCTURES
needs:
  - way to generate appropriate substrings
  - way to calculate repeat count
  - way to ensure shortest substring / largest repeat count is returned

start: string
  - array of all appropriate substrings
    - always begins at index 0
    - size can be from 1 up to input string length
  - array of each substring paired with its repeat count in a subarray
    - repeat count:
      - input string length / current substring length
  - return first subarray that satisfies formula
finish: array: [substring, repeat count]

ALGORITHM
- create an array of all candidate substrings
  - from length 1 up to string length
  - start index = 0
- transform substrings array:
  - each element should be a subarray
    - [substring, repeat count]
      - repeat count = string length / substring length
- find the first subarray that satisfies
  - substring * repeat count == string
=end

# def repeated_substring(string)
#   substrings = get_substrings(string)
#   pairs = substrings.map do |substring|
#     repeat_count = string.size / substring.size
#     [substring, repeat_count]
#   end
#   pairs.find { |pair| pair.inject(:*) == string }
# end

# def get_substrings(string)
#   substrings = []
#   lengths = (1..string.size)

#   lengths.each do |length|
#     substrings << string[0, length]
#   end
#   substrings
# end

# p repeated_substring('xyzxyzxyz') == ['xyz', 3]
# p repeated_substring('xyxy') == ['xy', 2]
# p repeated_substring('xyz') == ['xyz', 1]
# p repeated_substring('aaaaaaaa') == ['a', 8]
# p repeated_substring('superduper') == ['superduper', 1]

### TEN
=begin
Create a method that takes a string of digits as an argument and returns the number of even-numbered substrings that can be formed. For example, in the case of '1432', the even-numbered substrings are '14', '1432', '4', '432', '32', and '2', for a total of 6 substrings.

If a substring occurs more than once, you should count each occurrence as a separate substring.

PROBLEM
input: string
  - all characters are numeric

output: integer
  - number of consecutive substrings that can be formed that
    - represent an even number
  - if a substring occurs more than once, count each occurrence

EXAMPLES

DATA STRUCTURES
needs:
  - way to form all relevant substrings
  - way to treat substrings as numbers
  - way to count even substrings

start: string
  - array of all possible substrings
    - all start indexes, all lengths
  - array of substrings converted to integers
  - array of even integers
finish: integer (length of array)

ALGORITHM
- create an array of all possible substrings
  - create an empty array to hold substrings
  - create a range to control start indexes
    - 0 from 0 up to (string length - 1)
    -for each start index
      - create a range to control length
        - from 1 up to (string length - start index)
        - for each length
          - add a substring to substrings array
            - string[start index, length]

- select even substrings
  - convert current substring to an integer
  - select if the integer is even

- return length of even substrings array
=end

# def even_substrings(string)
#   substrings = get_substrings(string)
#   even_substrings = substrings.select { |substring| substring.to_i.even? }
#   even_substrings.size
# end

# def get_substrings(string)
#   substrings = []
#   min_length = 1
#   last_index = string.size - min_length
#   start_indexes = (0..last_index)

#   start_indexes.each do |start_index|
#     max_length = string.size - start_index
#     lengths = (min_length..max_length)

#     lengths.each do |length|
#       substrings << string[start_index, length]
#     end
#   end
#   substrings
# end

# p even_substrings('1432') == 6
# p even_substrings('3145926') == 16
# p even_substrings('2718281') == 16
# p even_substrings('13579') == 0
# p even_substrings('143232') == 12

### EIGHTEEN
=begin
Create a method that takes an array of integers as an argument. Determine and return the index N for which all numbers with an index less than N sum to the same value as the numbers with an index greater than N. If there is no index that would make this happen, return -1.

If you are given an array with multiple answers, return the index with the smallest value.

The sum of the numbers to the left of index 0 is 0. Likewise, the sum of the numbers to the right of the last element is 0.

PROBLEM 10:37
input: array
  - elements are integers

output: integer
  - represents index for which:
    - all numbers with index < sum to the same as
      - all numbers with index >
  - return -1 if no such index exists
  - if any ties, return the smallest index
  - sum of numbers to left of index 0 is 0
  - sum of numbers to right of last element is 0

EXAMPLES

DATA STRUCTURES
needs:
  - way to control slices that will be compared

start: array
  - range to control 'middle' index
    - from 0 up to array length
    - array[0...middle] == array[middle + 1, last index]

finish: integer

ALGORITHM
- create a range to track "middle" index
  - from 0 up to array length
- for each index
  - create and compare two slices:
    - array[0...index] == array[index + 1...array length]
  - return current index if true
  - otherwise continue
- return -1 if no index returned
=end

# def equal_sum_index(array)
#   indexes = (0..(array.size - 1))
#   middle_index = indexes.find do |index|
#     left_slice = array[0...index]
#     right_slice = array[(index + 1)..array.size]
#     left_slice.sum == right_slice.sum
#   end
#   middle_index || -1
# end

# p equal_sum_index([1, 2, 4, 4, 2, 3, 2]) == 3
# p equal_sum_index([7, 99, 51, -48, 0, 4]) == 1
# p equal_sum_index([17, 20, 5, -60, 10, 25]) == 0
# p equal_sum_index([0, 2, 4, 4, 2, 3, 2]) == -1

# The following test case could return 0 or 3. Since we're
# supposed to return the smallest correct index, the correct
# return value is 0.
# p equal_sum_index([0, 20, 10, -60, 5, 25]) == 0

### NINE
=begin
Create a method that takes two string arguments and returns the number of times that the second string occurs in the first string. Note that overlapping strings don't count: 'babab' contains 1 instance of 'bab', not 2.

You may assume that the second argument is never an empty string.

PROBLEM
input: 2 strings
  - string 1 can be empty
  - string 2 is never empty
output: integer
  - number of times string 2 occurs in string 1
    - overlapping strings don't count

EXAMPLES

DATA STRUCTURES
needs:
  - way to determine if string 2 occurs in string 1
  - way to avoid counting overlapping strings twice

start: 2 strings
  - variable to control start index
  - length of string 2: target_length
  - variable to count number of matches
finish: integer

ALGORITHM
- create a variable to track matches: set to 0
- create a variable to control starting index: set to 0
- create a variable for target length: set to string 2 length

- consider each index in string 1
  - skip to next iteration unless current index == starting index
  - compare a slice of string 1 to string 2
    - string1[current index, target length] == string2

    - if they are equal
      - increment matches count by 1
      - increment starting index by target length
    - otherwise
      - increment starting index by 1
- return matches count
=end

# def count_substrings(string1, string2)
#   matches = 0
#   start_index = 0
#   target_length = string2.size
#   last_index = string1.size - target_length
#   indexes = (0..last_index)

#   indexes.each do |index|
#     next unless index == start_index
#     if string1[index, target_length] == string2
#       matches += 1
#       start_index += target_length
#     else
#       start_index += 1
#     end
#   end
#   matches
# end

# p count_substrings('babab', 'bab') == 1
# p count_substrings('babab', 'ba') == 2
# p count_substrings('babab', 'b') == 3
# p count_substrings('babab', 'x') == 0
# p count_substrings('', 'x') == 0
# p count_substrings('bbbaabbbbaab', 'baab') == 2
# p count_substrings('bbbaabbbbaab', 'bbaab') == 2
# p count_substrings('bbbaabbbbaabb', 'bbbaabb') == 1

### EIGHT
=begin
Create a method that takes a non-empty string as an argument. The string consists entirely of lowercase alphabetic characters. The method should return the length of the longest vowel substring. The vowels of interest are "a", "e", "i", "o", and "u".

PROBLEM 8:23
input: string
  - not empty
  - contains only lowercase alphabetic characters
output: integer
  - length of longest substring that contains only vowels
    - vowels = a e i o u

EXAMPLES

DATA STRUCTURES
needs:
  - way to get all possible substrings
  - way to get vowel-only substrings
    - way to determine if a character is a vowel
  - way to determine longest all-vowel substring

start: string
  - array of all possible substrings
  - array of vowel-only substrings
  - array of vowel-only substring length
finish: integer (longest length)

ALGORITHM
- create an array of all lowercase vowels
- create an array of all possible substrings from input string
  - create an empty array to hold substrings: substrings
  - create a range to control start indexes: start_indexes
    - from 0 up to (string.size - 1)

    - for each start index
      - create a range to control length: lengths
        - from 1 up to (string.size - current start index)

      - for each length
        - add a subarray to subarrays

- create an array of all vowel-only substrings
  - select subarrays where all characters are included in vowels array
- create an array of vowel-only substring lengths
  - transform each subarray into its length
- return the greatest length
=end

# VOWELS = %w(a e i o u)

# def longest_vowel_substring(string)
#   substrings = get_substrings(string)
#   vowels_only = substrings.select do |substring|
#     substring.chars.all? { |char| VOWELS.include?(char) }
#   end
#   lengths = vowels_only.map(&:size)
#   # lengths.max || 0
# end

# def get_substrings(string)
#   substrings = []
#   min_length = 1
#   last_index = string.size - min_length
#   start_indexes = (0..last_index)

#   start_indexes.each do |start_index|
#     max_length = string.size - start_index
#     lengths = (min_length..max_length)

#     lengths.each do |length|
#       substrings << string[start_index, length]
#     end
#   end
#   substrings
# end

# p longest_vowel_substring('cwm') #== 0
# p longest_vowel_substring('many') == 1
# p longest_vowel_substring('launchschoolstudents') == 2
# p longest_vowel_substring('eau') == 3
# p longest_vowel_substring('beauteous') == 3
# p longest_vowel_substring('sequoia') == 4
# p longest_vowel_substring('miaoued') == 5

### SEVEN
=begin
Create a method that takes an array of integers as an argument and returns the number of identical pairs of integers in that array. For instance, the number of identical pairs in [1, 2, 3, 2, 1] is 2: there are two occurrences each of both 2 and 1.

If the array is empty or contains exactly one value, return 0.

If a certain number occurs more than twice, count each complete pair once. For instance, for [1, 1, 1, 1] and [2, 2, 2, 2, 2], the method should return 2. The first array contains two complete pairs while the second has an extra 2 that isn't part of the other two pairs.

PROBLEM 8:11
input: array
  - elements are integers
output: integer
  - number of pairs of elements
    - pairs do not overlap: [2, 2, 2, 2] contains 2 pairs
        - [2, 2, 2] contains 1 pair
    - paired elements do not need to be consecutive in input array
  - return 0 if input array is empty
  - return 0 if input array only contains 1 element

EXAMPLES

DATA STRUCTURES
needs:
  - way to determine number of complete pairs in input array

start: array
  - array of unique values in input array
  - array of pair counts of unique values
    - pair count = (count for that element in input array) / 2
finish: integer (sum of pair counts)

ALGORITHM
- create an array of unique values from input array
- get a count of pairs of each unique value
  - for each unique value
    - transform to (count of that value in input array) / 2
- sum the pairs count array and return the sum
=end

# def pairs(numbers)
#   uniques = numbers.uniq
#   pairs = uniques.map { |unique| (numbers.count(unique)) / 2 }
#   pairs.sum
# end

# p pairs([3, 1, 4, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7]) == 3
# p pairs([2, 7, 1, 8, 2, 8, 1, 8, 2, 8, 4]) == 4
# p pairs([]) == 0
# p pairs([23]) == 0
# p pairs([997, 997]) == 1
# p pairs([32, 32, 32]) == 1
# p pairs([7, 7, 7, 7, 7, 7, 7]) == 3

### SIX
=begin
Create a method that takes a string argument and returns a hash in which the keys represent the lowercase letters in the string, and the values represent how often the corresponding letter occurs in the string.

PROBLEM 7:56
input: string
  - can contain any type of character
  - can be empty
output: hash
  - counts of lowercase letters in input string
    - keys:
      - lowercase letters in string
    - values:
      - occurrences of that letter in the string
  - all other types of characters are ignored
  - if input string is empty, return empty hash
  - if input string contains no lowercase letters, return empty hash

EXAMPLES

DATA STRUCTURES
needs:
  - way to determine whether a character is lowercase or not
  - way to get counts of each lowercase character

start: string
  - array of all lowercase letters in alphabet
  - empty hash, with a default value of 0
finish: hash

ALGORITHM
- create an array of all lowercase alphabetic characters
- create an empty hash, with a default value of 0: counts
- consider each character in the input string
  - go to the next character unless the character appears in the alphabet array
  - increment the value for that key in the counts hash
- return the counts hash
=end

# LOWERCASE = ('a'..'z').to_a

# def count_letters(string)
#   counts = Hash.new(0)
#   string.each_char do |char|
#     next unless LOWERCASE.include?(char)
#     counts[char] += 1
#   end
#   counts
# end

# expected = {'w' => 1, 'o' => 2, 'e' => 3, 'b' => 1, 'g' => 1, 'n' => 1}
# p count_letters('woebegone') == expected

# expected = {'l' => 1, 'o' => 1, 'w' => 1, 'e' => 4, 'r' => 2,
#             'c' => 2, 'a' => 2, 's' => 2, 'u' => 1, 'p' => 2}
# p count_letters('lowercase/uppercase') == expected

# expected = {'u' => 1, 'o' => 1, 'i' => 1, 's' => 1}
# p count_letters('W. E. B. Du Bois') == expected

# p count_letters('x') == {'x' => 1}
# p count_letters('') == {}
# p count_letters('!!!') == {}

### FIVE
=begin
Create a method that takes a string argument and returns the character that occurs most often in the string. If there are multiple characters with the same greatest frequency, return the one that appears first in the string. When counting characters, consider uppercase and lowercase versions to be the same.

PROBLEM
input: string
  - can contain both upper and lowercase characters
output: string
  - single character
    - occurs most often in input string
    - if any ties, return the character that occurs first in input string
      - return lowercase version of that letter
    - ignore case: 'a' == 'A' in terms of counting

EXAMPLES

DATA STRUCTURES
needs:
  - way to count occurrences of every letter in input string
    - while ignoring case
  - way to get highest count
  - way to find first character with that count

start: string
  - downcased input string
  - array of lowercase unique characters in input string
    - array of individual letters from downcased string
    - array of unique values from that array
  - counts of each lowercase unique characters
    - transform uniques array
  - largest value in counts array
finish: string (first character with that value as its count)

ALGORITHM
- create a downcased version of the input string
- create an array of unique characters from downcased string
- create an array of counts of unique characters
  - for each unique character
    - transform character into its count in the downcased input string
- get the largest value from the counts array
- find the first character in the downcased string that has that value
=end

# def most_common_char(string)
#   downcased = string.downcase
#   uniques = downcased.chars.uniq
#   counts = uniques.map do |unique|
#     downcased.count(unique)
#   end
#   max_count = counts.max
#   downcased.chars.find { |char| downcased.count(char) == max_count }
# end

# p most_common_char('Hello World') == 'l'
# p most_common_char('Mississippi') == 'i'
# p most_common_char('Happy birthday!') == 'h'
# p most_common_char('aaaaaAAAA') == 'a'

# my_str = 'Peter Piper picked a peck of pickled peppers.'
# p most_common_char(my_str) == 'p'

# my_str = 'Peter Piper repicked a peck of repickled peppers. He did!'
# p most_common_char(my_str) == 'e'

### FOUR
=begin
Create a method that takes an array of integers as an argument and returns an array of two numbers that are closest together in value. If there are multiple pairs that are equally close, return the pair that occurs first in the array.

PROBLEM 7:07
input: array
  - elements are integers

output: array
  - the two values from input array that are closest in value
    - need not be consecutive
  - if any ties, return the earliest pair

EXAMPLES

DATA STRUCTURES
needs:
  - way to generate all possible pairs of elements from input array
    - don't need "reverse pairs"
      - only need to pair a given element with later elements from the array
  - way to get differences from each pair
  - way to get smallest difference and return pair with that difference

start: array
  - array of all possible pairs
    - possible indexes, first element: 0 up to (array length - 2)
    - possible indexes, second element: index1 + 1, up to (array length - 1)
    - length is always 2
  - smallest difference between pairs
finish: array (first pair with that difference)

ALGORITHM
- create an array of all relevant pairs of elements from input array
  - create an empty array to hold pair subarrays: subarrays
  - create a range to control index of the first element: index1
    - from 0 up to array length - 2

    - for each index1
      - create a range to control index of second element: index2
        - from index1 + 1 up to array length - 1

      - for each index2
        - add a subarray to subarrays
          - [array[index1], array[index2]]

- determine the smallest difference between any pair
  - transform subarrays array into differences
  - get the smallest value
- return the first pair with that difference
  - search through subarrays array and return first pair with smallest difference
=end

# def closest_numbers(numbers)
#   pairs = get_pairs(numbers)
#   differences = pairs.map { |pair| pair.inject(:-).abs }
#   min_difference = differences.min
#   pairs.find { |pair| pair.inject(:-).abs == min_difference }
# end

# def get_pairs(numbers)
#   pairs = []
#   first_indexes = (0..(numbers.size - 2))

#   first_indexes.each do |index1|
#     second_indexes = ((index1 + 1)..(numbers.size - 1))

#     second_indexes.each do |index2|
#      pairs << [numbers[index1], numbers[index2]]
#     end
#   end
#   pairs
# end

# p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
# p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
# p closest_numbers([12, 22, 7, 17]) == [12, 7]

### THREE
=begin
Create a method that takes a string argument and returns a copy of the string with every second character in every third word converted to uppercase. Other characters should remain the same.

PROBLEM 5:46
input: string

output: new string
  - every second character in every third word converted to uppercase
  - all other characters remain the same

EXAMPLES

DATA STRUCTURES
needs:
  - way to determine every third word
  - way to determine every second character

start: string
  - array of individual words
    - every third word: (index + 1) % 3 == 0
  - transform every third word:
    - array of individual characters
      - transform second character: (index + 1) % 2 == 0
  - transformed array
finish: string

ALGORITHM
- create an array of individual words form input string
- transform every third word
  - for each word with its index:

    - if (index + 1) % 3 == 0

      - create an array of individual characters from word
      - transform every second character
        - for each character with its index

          - if (index + 1) % 2 == 0
            - upcase that character
          - else do nothing

      - convert transformed characters array into a string

    - else do nothing
- convert transformed words array into a string and return it
=end

# def to_weird_case(string)
#   words = string.split
#   words.map.with_index do |word, index|
#     target?(index, 3) ? change_chars(word) : word
#   end.join(' ')
# end

# def target?(index, target)
#   (index + 1) % target == 0
# end

# def change_chars(word)
#   characters = word.chars
#   characters.map.with_index do |character, index|
#     target?(index, 2) ? character.upcase : character
#   end.join
# end

# original = 'Lorem Ipsum is simply dummy text of the printing world'
# expected = 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG world'
# p to_weird_case(original) == expected

# original = 'It is a long established fact that a reader will be distracted'
# expected = 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
# p to_weird_case(original) == expected

# p to_weird_case('aaA bB c') == 'aaA bB c'

# original = "Mary Poppins' favorite word is supercalifragilisticexpialidocious"
# expected = "Mary Poppins' fAvOrItE word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS"
# p to_weird_case(original) == expected

### TWO
=begin
Create a method that takes an array of integers as an argument. The method should return the minimum sum of 5 consecutive numbers in the array. If the array contains fewer than 5 elements, the method should return nil.

PROBLEM 5:36
input: array
  - elements are integers
    - can be positive or negative
ouptut: integer or nil
  - smallest sum of 5 consecutive integers in input array
    - can be positive or negative
  - if input array length < 5, return nil

EXAMPLES

DATA STRUCTURES
needs:
  - way to generate all possible 5 number sequences
  - way to get sums of each sequence
  - way to determine the smallest sum

start: array
  - array of all possible 5-element subarrays
  - transformed array: sums
finish: integer (smallest sum) or nil

ALGORITHM
- create an array of all possible 5-element subarrays
- transform this array into the sums of each subarray
- return the smallest sum
=end

# def minimum_sum(numbers)
#   sequences = numbers.each_cons(5).to_a
#   sums = sequences.map(&:sum)
#   sums.min
# end

# p minimum_sum([1, 2, 3, 4]) == nil
# p minimum_sum([1, 2, 3, 4, 5, -5]) == 9
# p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
# p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
# p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

### ONE
=begin
Create a method that takes an array of numbers as an argument. For each number, determine how many numbers in the array are smaller than it, and place the answer in an array. Return the resulting array.

When counting numbers, only count unique values. That is, if a number occurs multiple times in the array, it should only be counted once.

PROBLEM 5:28
input: array
  - elements are numbers
  - not empty

output: new array
  - elements are counts
    - how many other numbers in array are less than number in that position
      - only count unique values
  - same number of elements as input array

EXAMPLES

DATA STRUCTURES
needs:
  - way to compare number to all other unique values in input array
  - way to avoid double counting

start: array
  - array of unique values
  - transformed array
    - each number is transformed into a count of how many unique values are less than it
finish: new array

ALGORITHM
- create an array of unique values in the input array
- transform the input array
  - for each number
    - count how many unique values are less than it
- return the transformed array
=end

# def smaller_numbers_than_current(numbers)
#   uniques = numbers.uniq
#   numbers.map do |number|
#     uniques.count { |unique| number > unique }
#   end
# end

# p smaller_numbers_than_current([8, 1, 2, 2, 3]) == [3, 0, 1, 1, 2]
# p smaller_numbers_than_current([7, 7, 7, 7]) == [0, 0, 0, 0]
# p smaller_numbers_than_current([6, 5, 4, 8]) == [2, 1, 0, 3]
# p smaller_numbers_than_current([1]) == [0]

# my_array = [1, 4, 6, 8, 13, 2, 4, 5, 4]
# result   = [0, 2, 4, 5,  6, 1, 2, 3, 2]
# p smaller_numbers_than_current(my_array) == result

### BOUNCY COUNT
=begin
Some numbers have only ascending digits, like 123, 3445, 2489, etc. Some numbers have only descending digits, like 321, 5443, 9842, etc.

A number is "bouncy" if it has both ascending and descending digits, like 313, 92543, etc.

Write a method that takes a list of numbers and counts how many of them are bouncy.

PROBLEM 5:07
input: array
  - elements are integers
  - can be empty

output: integer
  - count of how many integers in input array are "bouncy"
    - bouncy:
      - has both ascending and descending digits
        - ascending: current digit < next digit
        - descending: current digit > next digit

EXAMPLES

DATA STRUCTURES
needs:
  - way to determine if an integer is bouncy
    - way to examine successive pairs of digits from input array numbers

start: array of integers
  - for each integer
    - array of individual digits
    - array of all consecutive two-element subarrays
    - count integer as bouncy if there is at least one:
      - pair where first < second
      - pair where first > second
finish: integer (count of bouncy numbers)

ALGORITHM
- for each integer in input array
  - create an array of individual digits
  - create an array of consecutive two-element subarrays: pair
    - check if any pair in array is ascending
    - check if any pair in array is descending
  - if both are true, count that integer as bouncy
- return count of bouncy integers
=end

# def bouncy_count(numbers)
#   numbers.count { |number| bouncy?(number) }
# end

# def bouncy?(number)
#   digits = number.digits.reverse
#   pairs = digits.each_cons(2).to_a

#   [:<, :>].all? do |comparator|
#     pairs.any? { |pair| pair.inject(comparator) }
#   end
# end

# p bouncy_count([]) == 0
# p bouncy_count([11, 0, 345, 21]) == 0
# p bouncy_count([121, 4114]) == 2
# p bouncy_count([176, 442, 80701644]) == 2

### ALTERNATING ODD AND EVEN
=begin
Write a function that returns the maximum possible consecutive alternating odd and even (or even and odd) numbers. Minimum possible length is 2. If there's none return [].

PROBLEM 1:07
input: array
  - elements are numbers
output: array
  - longest possible consecutive subarray where
    - numbers alternate between even and odd
    - minimum length: 2
    - maximum length: array length
  - if no alternating subarray, return an empty array

EXAMPLES

DATA STRUCTURES
needs:
  - way to generate all possible relevant subarrays
  - way to determine if a a subarray alternates between odd and even

start: array
  - array of all possible subarrays length > 1
  - array of all alternating subarrays
finish: array (longest alternating subarray)

ALGORITHM
- create an array of all possible subarrays
  - create an empty array to hold subarrays
  - create a range to represent start indexes
    - from 0 up to (array length - 2)
  - for every start index
    - create a range to represent possible lengths
      - from 2 up to (array length - current index)
    - for every length
      - add a subarray from current start index of current length to subarrays array
- create an array of only subarrays that are alternating
  - for each pair of elements in subarray
  - select subarray if all pairs alternate
    - if first number is odd, second must be even, and vice versa
- return the longest alternating subarray
  - return an empty array if no alternating subarrays
=end

# def longest_alternating_subarray(numbers)
#   subarrays = get_subarrays(numbers)
#   alternating = subarrays.select { |subarray| alternating?(subarray) }
#   alternating.max_by(&:size) || []
# end

# def get_subarrays(array)
#   subarrays = []
#   min_length = 2
#   last_index = array.size - min_length
#   start_indexes = (0..last_index)

#   start_indexes.each do |start_index|
#     max_length = array.size - start_index
#     lengths = (min_length..max_length)

#     lengths.each do |length|
#       subarrays << array[start_index, length]
#     end
#   end
#   subarrays
# end

# def alternating?(subarray)
#   pairs = subarray.each_cons(2).to_a
#   pairs.all? do |pair|
#     pair.first.odd? ? pair.last.even? : pair.last.odd?
#   end
# end

# p longest_alternating_subarray([1, 2, 3, 4, 5, 6]) == [1, 2, 3, 4, 5, 6]
# p longest_alternating_subarray([2, 4, 6, 8]) == []
# p longest_alternating_subarray([1, 3, 5, 7]) == []
# p longest_alternating_subarray([1, 1, 3, 7, 8, 5]) == [7, 8, 5]
# p longest_alternating_subarray([4, 6, 7, 12, 11, 9, 17]) == [6, 7, 12, 11]

### DECODER
=begin
We're receiving a set of messages in code. The messages are sets of text strings, like:

"alakwnwenvocxzZjsf"

Write a method to decode these strings into numbers. The decoded number should be the number of lowercase characters between the first two uppercase characters. If there aren't two uppercase characters, the number should be 0.

PROBLEM 8:34
input: array
  - elements are strings
    - can be empty
    - otherwise contain only upper and lowercase letter characters

output: array
  - elements are integers
    - number of lowercase characters between
      - first two uppercase characters in corresponding string
    - if not two uppercase characters, return 0

EXAMPLES

DATA STRUCTURES
needs:
  - way to identify uppercase characters
  - way to count number of lowercase characters in between first two uppercase characters

start: array of strings
  - array of all uppercase alphabetical characters
  - range to represent indexes in input string
    - from 0 up to string length - 1
  - array of indexes of uppercase character in string
  - (difference between first two indexes) - 1
finish: array of integers

ALGORITHM
- create an array of all  uppercase alphabetical characters
- consider each string in the input array
  - for each string
    - create a range to represent indexes in string
      - 0 up to (string length - 1)

      - for each index
        - select that index if the character at that index is included in the uppercase array
- if the size of the indexes array is < 2
  - return 0
- otherwise, get the difference between the first two indexes
- subtract 1 from the difference and return it
=end

# UPPERCASE = ('A'..'Z').to_a

# def decode(strings)
#   strings.map do |string|
#     uppercase_indexes = get_uppercase_indexes(string)
#     uppercase_indexes.size < 2 ? 0 : index_difference(uppercase_indexes)
#   end
# end

# def get_uppercase_indexes(string)
#   indexes = string.chars.each_index.to_a
#   indexes.select { |index| UPPERCASE.include?(string[index]) }
# end

# def index_difference(array)
#   array.take(2).inject(:-).abs - 1
# end

# p decode(['ZoL', 'heLlo', 'XX']) == [1, 0, 0]
# p decode(['foUrsCoreAnd', 'seven', '']) == [2, 0, 0]
# p decode(['lucYintheskyWith', 'dIaMonDs']) == [8, 1]
# p decode([]) == []

### LETTER COUNT
=begin
Write a method that takes a string as an argument and returns a hash containing the number of times each character present in the string occurs. The input string wil contain only alphabetic lowercase characters, and no spaces.

The hash keys should be symbols, and should be in alphabetical order, not order of appearance in the input string. The hash values should be the number of occurrences of the letter represented by the symbol.

PROBLEM 5:07
input: string
  - contains only alphabetic lowercase characters
  - no spaces

output: hash
  - keys:
    - letters that appear in input string
    - as symbols
    - should be in alphabetical order, not order of appearance in input string
  - values:
    - number of occurrences of key character in input string

EXAMPLES

DATA STRUCTURES
needs:
  - way to count occurrences of each letter
  - way to put keys in alphabetical order

start: string
  - array of all lowercase alphabetical letters
  - empty hash
finish: hash

ALGORITHM
- create an array of individual characters in the input string
- sort the array into alphabetical order
- create an empty hash, with a default value of 0
- for each letter in the array
  - increment the value of the key associated with that letter
- return the hash
=end

# def letter_count(string)
#   letters = string.chars.sort
#   counts = Hash.new(0)
#   letters.each do |letter|
#     counts[letter.to_sym] += 1
#   end
#   counts
# end

# ##
# def letter_count(string)
#   letters = string.chars.sort

#   letters.each_with_object(Hash.new(0)) do |letter, counts|
#     counts[letter.to_sym] += 1
#   end
# end

# p letter_count('codewars') == { :a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1 }
# p letter_count('activity') == { :a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1 }
# p letter_count('arithmetics') == { :a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2 }

### MAX SUM
=begin
Write a method that takes an array containing 0 or more integers and returns the maximum sum of a consecutive sequence of integers from that array.

The consecutive sequence can range from 0 elements up to all elements of the input array. A sequence with 0 elements in it should be considered to have a sum of 0.

PROBLEM 1:49
input: array
  - contains 0 or more integers
    - can be empty
output: integer
  - max sum of a consecutive sequence of integers
    - sequence can be from 0 elements up to all elements of input array
    - a sequence of 0 elements has a sum of 0

EXAMPLES

DATA STRUCTURES
needs:
  - way to get all possible sequences of integers (subarrays)
    - including 0 length sequences
  - way to get sum of each sequence
  - way to determine greatest sum of any sequence

start: array of integers
  - array of all possible sequences
  - transformed array: sums
finish: integer (greatest sum)

ALGORITHM
- get all possible sequences of integers
  - create an empty array to hold sequences
  - create a range of all possible start indexes
    - from 0 up to (array length - 1)
    - for every start index
      - create a range of possible lengths
        - from 0 up to (array length - current index)
        - for every length
          - add a subarray from current starting index of current length
            - to sequences array

- get sums of every sequence
  - transform sequences array into an array of sums
- return the greatest sum
=end

# def max_sum(numbers)
#   sequences = get_sequences(numbers)
#   sums = sequences.map(&:sum)
#   sums.max
# end

# def get_sequences(array)
#   sequences = [[]]
#   start_indexes = (0..(array.size - 1))

#   start_indexes.each do |start_index|
#     max_length = array.size - start_index
#     lengths = (1..max_length)

#     lengths.each do |length|
#       sequences << array[start_index, length]
#     end
#   end

#   sequences
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

PROBLEM 1:20
input: 2 strings
  - minimum length is 2
  - do not contain spaces

output: boolean
  - true if
    - a substring exists which appears in both input strings
      - only consider substrings of length 2 or greater
      - disregard case: 'ace' and 'Ace' are considered same substring
      - substring can be same length as input string
  - false otherwise

EXAMPLES

DATA STRUCTURES
needs:
  - way to generate all substrings of length 2 and greater
  - way to determine if a substring exists in both input strings

start: 2 strings
  - array of all relevant substrings from shortest input string
finish: boolean

ALGORITHM
  - get all relevant substrings:
  - determine which substring is shortest
  - create an array of all relevant substrings from shortest input string
    - create an empty array to hold substrings
    - create a range of starting indexes
      - from 0 up to (string length - 2)
    - for each starting index
      - create a range of possible lengths
        - from 2 up to (string length - current starting index)
      - add a substring from current startin index of current length
        - to substrings array
  - determine if any substrings appear in longer input string
    - for each substring, check if it appears in string
    - return true if yes
    - return false if no

=end

# def substring_twice?(string1, string2)
#   shorter, longer = [string1, string2].sort_by(&:size).map(&:downcase)
#   substrings = get_substrings(shorter)
#   substrings.any? { |substring| longer.include?(substring) }
# end

# def get_substrings(string)
#   substrings = []
#   min_length = 2
#   last_index = string.size - min_length
#   start_indexes = (0..last_index)

#   start_indexes.each do |start_index|
#     max_length = string.size - start_index
#     lengths = (min_length..max_length)

#     lengths.each do |length|
#       substrings << string[start_index, length]
#     end
#   end

#   substrings
# end

# p substring_twice?('face', 'Ace') == true
# p substring_twice?('face', 'ACTUALLY') == true
# p substring_twice?('face', 'gave') == false
# p substring_twice?('aa', 'aa') == true

### ALPHABETICAL ORDER
=begin
Write a method that, given a string, returns a new string containing only the alphabetic characters (all whitespace and non-alphabetic characters removed). These characters should be in case-insensitive alphabetical order, in the order they appear in the original string.

PROBLEM 1:05
input: string
  - can contain any type of character
    - can contain only whitespace
  - can be empty

output: new string
  - all whitespace and non-alpha characters removed
    - if no alpha characters in input string, return empty string
  - in case-insensitive alphabetical order
    - in order they appear in original string
      - i.e. uppercase of a particular letter should not be sorted ahead of lowercase of that letter; order should be based on order of appearance

EXAMPLES

DATA STRUCTURES
needs:
  - way to remove all non-alpha characters
  - way to sort alphabetically but case-insensitively

start: string
  - array of individual characters
  - array of only alpha characters
  - sorted array
output: string

ALGORITHM
- create an array of all possible alpha characters
- create an array of individual characters from input string
- select all characters that are also included in alpha characters array
- sort array by
  - downcased character
    - index
- convert sorted array into a string and return it
=end
# ALPHA_CHARACTERS = ('A'..'Z').to_a + ('a'..'z').to_a

# def alphabetized(string)
#   characters = string.chars
#   alphas = characters.select { |char| ALPHA_CHARACTERS.include?(char) }
#   sorted = alphas.sort_by.with_index do |character, index|
#     [character.downcase, index]
#   end
#   sorted.join
# end

# p alphabetized('') == ''
# p alphabetized(' ') == ''
# p alphabetized('9#$.%') == ''
# p alphabetized(' ba ') == 'ab'
# p alphabetized('Ab Ba') == 'AabB'
# p alphabetized('Ba Ab') == 'aABb'
# p alphabetized('9A #b$B .a%') == 'AabB'
# p alphabetized('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ') == 'aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ'

### CLOSEST VALUES
=begin
Write a method that takes an array of integers as an argument and returns the two numbers that are closest together in value. If more than one pair of integers satisfies this condition, return the pair whose elements occurs first in the input array.

You may assume that the input array will always contain at least three elements.

PROBLEM
input: array
  - contains integers
  - minimum length: 3

output: array
  - two elements
    - two elements from input array that are closest in value
    - if any ties, return the earliest pair
    - elements do not need to be consecutive

EXAMPLES

DATA STRUCTURES
needs:
  - way to compare each possible pair of numbers
    - don't need to worry about 'reverse pairs'
  - way to get difference between numbers in each pair
    - regardless of order: [4, 2] = 2 ; [2, 4] = 2 (NOT -2)
  - way to find earliest pair with smallest difference

start: array
  - array of all possible pairs
    - arranged in starting index order
  - smallest difference between numbers in pairs
  - first pair that has that same difference
finish: array (closest, earliest pair)

ALGORITHM
- get all possible forward pairs of numbers from input array
  - create an empty array to hold pair arrays
  - for each index in input array (number1_index)
    - for each index from number1_index to last index (number2_index)
      - create a pair
        - number at number1_index, number at number2_index
      - add pair to pairs array
- get the smallest difference between any two pairs
  - transform pairs array into differences
    - absolute value of numbers subtracted from each other
  - get the smallest difference: min_difference
- find the first pair that has same difference as min_difference
=end

# def closest_numbers(numbers)
#   pairs = get_pairs(numbers)
#   minimum_difference = pairs.map { |pair| pair.inject(:-).abs }.min
#   pairs.find { |pair| pair.inject(:-).abs == minimum_difference }
# end

# def get_pairs(array)
#   pairs = []
#   last_index = array.size - 1
#   array.each_index do |index1|
#     ((index1 + 1)..last_index).each do |index2|
#       pairs << [array[index1], array[index2]]
#     end
#   end
#   pairs
# end

# p closest_numbers([2, 4, 6, 7]) == [6, 7]
# p closest_numbers([5, 15, 25, 11, 20]) == [15, 11]
# p closest_numbers([3, 6, 8, 11, 13]) == [6, 8]
# p closest_numbers([12, 7, 17]) == [12, 7]

### DASHERIZER
=begin
Write a method that takes an integer as an argument and returns a string, with a dash placed between any consecutive odd digits.

PROBLEM 2:45
input: integer

output: string
  - same numeric characters as input string
  - dash placed between any consecutive odd digits

EXAMPLES

DATA STRUCTURES
needs:
  - way to convert integer to string
  - way to add dashes
    - way to detect consecutive odd digits

start: integer
  - array of individual digits
  - transformed array
finish: string

ALGORITHM
- convert input integer into an array of individual digits
- transform the array:
  - iterate over each element with its index:
    - if the digit is odd and the next digit is odd:
      - convert to a string and add a dash
    - else
      - convert to a string
- convert the array into a string and return it
=end

# def dasherizer(number)
#   digits = number.digits.reverse
#   digits.map.with_index do |digit, index|
#     consecutive_odds?(digits, index) ? digit.to_s + '-' : digit.to_s
#   end.join
# end

# def consecutive_odds?(digits, index)
#   next_digit = digits[index + 1] || 0
#   digits[index].odd? && next_digit.odd?
# end

# p dasherizer(2112) == '21-12'
# p dasherizer(201305742) == '201-305-742'
# p dasherizer(123456789) == '123456789'
# p dasherizer(217521) == '21-7-521'

### LONGEST ALPHABETICAL
=begin
Write a method that takes a string containing only lowercase letters as an argument, and returns the longest substring that is in alphabetical order. If there are multiple solutions, return the substring that occurs first in the input string. All input strings will be at least one character in length.

PROBLEM 12:01
input: string
  - contains only lowercase letters
  - at least one character in length
output: string
  - longest substring that is in alphabetical order
  - if any ties, return the earliest substring
  - substring can be same length as input string

EXAMPLES

DATA STRUCTURES
needs:
  - way to get all possible substrings from input string
  - way to determine if a substring is in alphabetical order
  - way to determine longest alphabetical substring
    - way to return earliest if a tie

start: string
  - array of all possible substrings
    - in start index order
  - array of all alphabetical substrings
  - longest length in that array
finish: string (first substring that matches that length)

ALGORITHM
- create an array of all possible substrings from input string
  - should be in start index order

  - create an empty array to hold substrings
  - for each index in input string
    - from 0 up to (string length - 1)

    - get every possible length substring from that index
      - length 1 up to (string length - current index)
      - add substring to substrings array

- select all substrings that are in alphabetical order
  - for each substring
    - create an array of individual characters
    - compare this array to sorted version of array
    - if equal, then substring is alphabetical

- return the longest (and earliest) substring
  - get the longest length of a substring in the alphabetical substrings array
  - select the first substring that matches that length
=end

# def longest(string)
#   substrings = get_substrings(string)
#   alpha_substrings = substrings.select { |substring| alphabetical?(substring) }
#   max_length = alpha_substrings.map(&:size).max
#   alpha_substrings.find { |substring| substring.size == max_length }
# end

# def get_substrings(string)
#   substrings = []
#   min_length = 1
#   last_index = string.size - min_length
#   start_indexes = (0..last_index)

#   start_indexes.each do |start_index|
#     max_length = string.size - start_index
#     lengths = (min_length..max_length)

#     lengths.each do |length|
#       substrings << string[start_index, length]
#     end
#   end

#   substrings
# end

# def alphabetical?(string)
#   string.chars.sort == string.chars
# end

# p longest('abc') == 'abc'
# p longest('abcace') == 'abc'
# p longest('asd') == 'as'
# p longest('nab') == 'ab'
# p longest('abcdeapbcdef') == 'abcde'
# p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
# p longest('asdfbyfgiklag') == 'fgikl'
# p longest('z') == 'z'
# p longest('zyba') == 'z'

### ALPHABET SCORE
=begin
Write a method that takes a string of words as an argument and returns the word that scores highest according to the letters it contains. Each letter of a word scores points according to its position in the alphabet: a = 1, b = 2, etc. So, for example, the word "ace" has a score of 9 (1 + 3 + 5).

If two words are tied for highest score, return the word that appears earliest in the original string.

You can assume that all letters in the input string are lowercase and all input strings are valid.

PROBLEM
input: string
  - contains "words"
    - consecutive non-space characters
  - all letters in string are lowercase

output: string
  - word with highest "alphabet score"
    - each letter scores points based on position in alphabet:
      - a = 1, b = 2, etc
  - if any ties, return word that appears earliest in input string

EXAMPLES

DATA STRUCTURES
needs:
  - way to consider each word individually
  - way to get score of each word
    - way to consider each character individually
    - way to score each letter
  - way to determine word to return
    - highest score
    - if tie, then earliest

start: string
  - array of individual words
  - array of individual characters in each word
finish: string (highest scoring word)

ALGORITHM
- create an array of all lowercase alphabetic characters
  - in order
  - prepend a '0'
- create an array of individual words from input string
- for each word
  - create an array of individual characters
    - convert each character into its alphabet score
      - get the index of that character form the alphabet array
    - get the sum of all scores
- return the word with the highest score
=end

# ALPHABET = ('a'..'z').to_a.prepend('0')

# def alphabet_score(string)
#   words = string.split
#   max_score = words.map { |word| score(word) }.max
#   words.find { |word| score(word) == max_score }
# end

# def score(word)
#   word.chars.map { |char| ALPHABET.index(char) || 0 }.sum
# end

# p alphabet_score('time is up') == 'time'
# p alphabet_score('time to stop') == 'stop'
# p alphabet_score('aced up') == 'up'
# p alphabet_score('ebb ace') == 'ebb'
# p alphabet_score('c ba') == 'c'

### DELETE A DIGIT
=begin
Write a method that takes an integer as an argument and returns the largest integer that can be obtained by deleting exactly one digit.

Assume all input integers will contain at least two digits

PROBLEM 8:41
input: integer
  - contains at least two digits
output: integer
  - largest integer that can be obtained by
    - deleting exactly one digit
  - all other digits remain in same order

EXAMPLES

DATA STRUCTURES
needs:
  - way to delete one digit without affecting other digits
  - way to determine largest number generated

start: integer
  - array of individual digits in input integer
  - array of subarrays
    - each subarray has one digit deleted
  - array of integers
output: integer (largest integer)

ALGORITHM
- get candidate integers
  - create an empty array to store subarrays
  - create a range from 0 up to (array length - 1)
  - for every number in the range
    - create a new subarray:
      - create an array of individual digits from input integer
      - delete element at current index
  - convert each subarray into an integer
    - first string, then integer
- return largest integer
=end

# def delete_digit(number)
#   last_index = number.to_s.size - 1
#   indexes = (0..last_index)

#   candidates = indexes.map do |index|
#     digits = number.digits.reverse
#     digits.delete_at(index)
#     digits.join.to_i
#   end

#   candidates.max
# end

##
# def delete_digit(number)
#   candidates = get_candidates(number)
#   candidates.max
# end

# def get_candidates(number)
#   all_digits = number.digits.reverse

#   all_digits.each_index.map do |index|
#     candidate_digits = number.digits.reverse
#     candidate_digits.delete_at(index)
#     candidate_digits.join.to_i
#   end
# end

# p delete_digit(10) == 1
# p delete_digit(12) == 2
# p delete_digit(123) == 23
# p delete_digit(321) == 32
# p delete_digit(12345) == 2345
# p delete_digit(62345) == 6345
# p delete_digit(791983) == 91983
# p delete_digit(1001) == 101

### REPEATED SUBSTRING
=begin
Write a method that takes a string as an argument and returns true if that string can be constructed by taking a substring and concatenating two or more copies of the substring together. Return false otherwise.

PROBLEM 8:04
input: string

output: boolean
  - true if:
    - input string can be constructed by
      - taking a substring and concatenating 2 or more copies together
    - case sensitive
      - 'abc' != 'ABC'
  - false otherwise

EXAMPLES

DATA STRUCTURES
needs:
  - way to get all possible substrings
    - max length is string length divided by 2
    - min length is 1
  - way to determine if substring repeated equals string

start: string
  - array of all candidate substrings
    - length 1 up to string length / 2
  - multiplier
    - string length / substring length
finish: boolean

ALGORITHM
- get all possible substrings
  - minimum length = 1
  - starting indexes: from index 0 up to string length - 1
  - maximum length = string length / 2
- determine if any substring can be repeated to produce string
  - for each substring
    - get multiplier
      - string length / substring length
    - test if substring * multiplier == string
=end

# def repeated_substring(string)
#   substrings = get_substrings(string)
#   substrings.any? do |substring|
#     multiplier = string.size / substring.size
#     substring * multiplier == string
#   end
# end

# def get_substrings(string)
#   min_length = 1
#   max_length = string.size / 2
#   lengths = (min_length..max_length)

#   lengths.map { |length| string[0, length] }
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

PROBLEM 7:07
input: 2 integers

output: boolean
  - true if:
    - 1st input integer has a "triple" of any number
      - sequence of at least three in a row of any number
    - 2nd input integer has a "double" of the same number
  - otherwise false

EXAMPLES

DATA STRUCTURES
needs:
  - way to find triples / doubles from input integers
    - way to generate all possible 3 or 2 digit sequences from input integers
    - way to determine if a sequence contains all the same number

start: 2 integers
  - both integers converted to arrays of digits
  - all 3 digit sequences from string 1
  - all triples from string 1
  - all 2 digit sequences from string 2
  - all doubles from string 2
finish: boolean:
  -true if the triple and double 'match'
  -false otherwise

ALGORITHM
- determine if 1st input integer contains a triple
  - convert integer to an array of individual digits
  - get all possible 3-digit subarrays
  - get all triples
  - if no triples, return false
- determine if 2nd input integer contains a double
  - convert integer to an array of individual digits
  - get all possible 2-digit subarrays
  - get all doubles
  - if no doubles, return false
- compare triples to doubles
  - transform triples array into array of single digits
  - for every double, check if first letter of double is included in single digits array
  - return true if a match
  - else return false
=end

# def triple_double(number1, number2)
#   potential_triples = get_potentials(number1, 3)
#   triples = get_multiples(potential_triples)
#   return false if triples.empty?

#   potential_doubles = get_potentials(number2, 2)
#   doubles = get_multiples(potential_doubles)
#   return false if doubles.empty?

#   triple_digits = triples.map(&:first)
#   doubles.any? { |double| triple_digits.include?(double.first) }
# end

# def get_potentials(number, length)
#   digits = number.digits.reverse
#   digits.each_cons(length).to_a
# end

# def get_multiples(potentials)
#   potentials.select do |potential|
#     potential.all? { |digit| digit == potential.first }
#   end
# end

# ##
# def triple_double?(number1, number2)
#   triple_digits = get_multiple_digits(number1, 3)
#   return false if triple_digits.empty?

#   double_digits = get_multiple_digits(number2, 2)
#   return false if double_digits.empty?

#   triple_digits.any? { |digit| double_digits.include?(digit) }
# end

# def get_multiple_digits(number, length)
#   digits = number.digits.reverse
#   potentials = digits.each_cons(length).to_a

#   multiples = potentials.select do |potential|
#     potential.all? { |digit| digit == potential.first }
#   end

#   multiples.map(&:first)
# end

# p triple_double(12345, 12345) == false
# p triple_double(1222345, 122345) == true
# p triple_double(1222345, 123345) == false
# p triple_double(666789, 12345666) == true
# p triple_double(451999277888, 41177722899) == true



### MULTIPLY ALL PAIRS
=begin
Write a method that, given two arrays each containing lists of numbers, returns a new array that contains the product of every pair of numbers that can be formed between the elements of the two arrays. The results should be sorted by increasing value.

You may assume that neither argument is an empty array.

PROBLEM 1:01
input: 2 arrays
  - elements are numbers
  - not empty
  - can be different sizes

output: array
  - products of every pair of numbers that can be formed between
    - one element from each input array
  - sorted in ascending value
  - don't need to consider 'reverse pairs'
    - [1], [4] => [4]
      - i.e. don't need to do both 1 * 4 AND 4 * 1
  - output array size = product of input array sizes

EXAMPLES

DATA STRUCTURES
needs:
- way to consider every pair of numbers
- way to avoid considering 'reverse pairs'

start: 2 arrays
  - empty array to hold products
finish: array (sorted products array)

ALGORITHM
- create an empty array to add products to
- for each number in array 1
  - for each number array 2
    - multiply numbers together
    - add to products array
- sort products array, and return it
=end

# def multiply_all_pairs(array1, array2)
#   products =[]

#   array1.each do |number1|
#     array2.each { |number2| products << (number1 * number2) }
#   end

#   products.sort
# end

# def multiply_all_pairs(array1, array2)
#   array1.each_with_object([]) do |number1, products|
#     array2.each { |number2| products << (number1 * number2) }
#   end.sort
# end

# p multiply_all_pairs([3], [1, 3, 2]) == [3, 6, 9]
# p multiply_all_pairs([1, 2], [3, 4]) == [3, 4, 6, 8]
# p multiply_all_pairs([1, 2], [4, 3, 1, 2]) == [1, 2, 2, 3, 4, 4, 6, 8]

### NEXT BIGGEST NUMBER
=begin
Write a method that, given a positive integer, returns the next biggest number that can be formed from the same digits. If no bigger number can be formed from those digits, return -1

PROBLEM 12:43
input: integer
  - positive
output: integer
  - next biggest number that can be formed from same digits
  - if no bigger number possible
    - return -1

EXAMPLES

DATA STRUCTURES
needs:
  - way to generate candidate numbers (i.e. with same digits)
  - way to determine if a number is next biggest
  - way to determine if no bigger number is possible

start: integer
  - greatest possible integer with given digits:
    - array of individual digits
    - array sorted largest to smallest
    - sorted array converted to an integer
  - range from (integer + 1) up to greatest possible integer
  - for each number in the range
    - converted to array of digits, then sorted
    - compared to sorted array of input integer digits
finish: integer
  - first number that has all the same digits as input integer

ALGORITHM
- determine the greatest possible integer using the same digits as input integer
  - convert input integer into an array of digits
  - sort from highest to lowest
  - convert into a string, then into an integer
- consider each number between input integer and greatest possible integer
  - if number contains all the same digits as input integer
    - return it
      - convert number to an array of digits
      - sort
      - compare for equality with input integer digits sorted
  - else continue
- return -1 if no integer found in range
=end

# def next_bigger_num(number)
#   max_number = get_max_number(number)
#   candidates = ((number + 1)..max_number)
#   result = candidates.find { |candidate| same_digits?(candidate, number) }
#   result || -1
# end

# def get_max_number(number)
#   number.digits.sort.reverse.join.to_i
# end

# def same_digits?(candidate, target)
#   candidate.digits.sort == target.digits.sort
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

PROBLEM 8:42
input: array
  - can be empty

output: array
  nested:
    - elements in input array are paired into subarrays
      - first element with last element
      - second element with second to last, etc
    - if input array length is odd
      - repeat middle element twice for final pair
    - number of subarrays = input array length / 2 (rounded up)
  - if input array is empty, return array will be empty

EXAMPLES

DATA STRUCTURES
needs:
  - way to get correct number of pairs / subarrays
  - way to get correct elements into each pair

start: array
  - number of subarrays: array length / 2.0, rounded up to integer
  - indexes
    - [0, -1], [1, -2], [2, -3]
finish: nested array

ALGORITHM
- create an empty array to hold subarrays
- determine the number of subarrays
  - array length  / 2.0, rounded up to integer
- for each subarray number (1 up to (array.size / 2.0).ceil): index
  - add a subarray to empty array
    - [[array[index], array[-(index + 1)]]
- return subarrays array
=end

# def pairs(array)
#   pairs = []
#   number_of_pairs = (array.size / 2.0).ceil

#   number_of_pairs.times do |pair_index|
#     pairs << [array[pair_index], array[-(pair_index + 1)]]
#   end
#   pairs
# end

# def pairs1(array)
#   number_of_pairs = (array.size / 2.0).ceil

#   number_of_pairs.times.map do |pair_index|
#     [array[pair_index], array[-(pair_index + 1)]]
#   end
# end

# p pairs([1, 2, 3, 4, 5, 6]) == [[1, 6], [2, 5], [3, 4]]
# p pairs([1, 2, 3, 4, 5]) == [[1, 5], [2, 4], [3, 3]]
# p pairs([1, 2]) == [[1, 2]]
# p pairs([1]) == [[1, 1]]
# p pairs([]) == []

### VOWEL SUBSTRINGS AGAIN
=begin
Write a method that takes a string as an argument and returns the number of "vowel substrings" within it. A "vowel substring" is a consecutive sequence of characters within the input string that consists only of vowels ('a', 'e', 'i', 'o', and 'u') and has all five vowels present in it at least once. All input strings will contain only lowercase letters.

PROBLEM 8:15
input: string
  - contains only lowercase letter characters

output: integer
  - number of "vowel strings" in input string
    - vowel string:
      - consecutive sequence of characters
      - contains only vowels (a e i o u)
      - every vowel is present at least once

EXAMPLES

DATA STRUCTURES
needs:
  - way to get all relevant substrings
    - minimum length = 5
  - way to get all substrings which contain only vowels
    - way to distinguish vowels from other letters
  - way to determine if an all-vowel substring contains at least one of each vowel

start: string
  - array of all possible substrings
    - length >= 5
  - array of vowel-only substrings
  - array of vowel substrings
finish: integer (length of array)

ALGORITHM
  - get all possible substrings from input string
    - minimum length = 5
    - start indexes: 0 up to (string length - 5)
    - maximum length = (string length - current start index)
  - get substrings that contain only vowels
    - create an array of vowels: %w(a e i o u)
    - select if every character in substring is included in vowels array
  - count vowel substrings
    - iterate over vowels array
      - check if all vowels occur in a substring
  - return count
=end

# VOWELS = %w(a e i o u)

# def count_vowel_substrings(string)
#   substrings = get_substrings(string)
#   vowels_only_substrings = get_vowels_only_substrings(substrings)
#   vowel_substring_count(vowels_only_substrings)
# end

# def get_substrings(string)
#   substrings = []
#   min_length = 5
#   last_index = (string.size - min_length)
#   start_indexes = (0..last_index)

#   start_indexes.each do |start_index|
#     max_length = string.size - start_index
#     lengths = (min_length..max_length)

#     lengths.each do |length|
#       substrings << string[start_index, length]
#     end
#   end
#   substrings
# end

# def get_vowels_only_substrings(substrings)
#   substrings.select do |substring|
#     substring.chars.all? { |char| VOWELS.include?(char) }
#   end
# end

# def vowel_substring_count(vowels_only_substrings)
#   vowels_only_substrings.count do |substring|
#     VOWELS.all? { |vowel| substring.include?(vowel) }
#   end
# end

# p count_vowel_substrings('abcde') == 0
# p count_vowel_substrings('aeiou') == 1
# p count_vowel_substrings('iaoue') == 1
# p count_vowel_substrings('aeiogu') == 0
# p count_vowel_substrings('aeiouu') == 2
# p count_vowel_substrings('aeiouuu') == 3
# p count_vowel_substrings('aaeeiioouu') == 4

### PAIRS
=begin
Write a function that takes an array as an argument, and returns an array with pairs of elements grouped into subarrays. The first element should be paired with the last, the second element with the second to last, etc.

If the array has an odd number of elements, repeat the middle element twice for the final pair.

PROBLEM 12:25
input: array
  - can be empty

output: array
  - contains subarrays with pairs of elements from input array
    - first element with last element
    - second element with second to last
    - etc
  - if input array length is odd:
    - repeat middle element twice for final pair
  - if input array empty
    - return empty array

EXAMPLES

DATA STRUCTURES
needs:
  - way to pair appropriate elements with each other
  - way to repeat middle element if array size is odd
  - way to deal with empty input array

start: array
  - counters to control current index
    - first: 0, then increment by 1
      - use reps index
    - second: array length - 1, then decrement by 1
      - array length - (reps index + 1)
  - variable to control number of reps
    - (array size + 1) / 2
finish: array

ALGORITHM
- create an empty array to hold pairs: pairs
- get the number of reps to perform
  - (array length + 1) / 2
- on each rep
  - add a subarray to pairs
    - first element: array[rep index]
    - second element: array[array length - (rep index + 1)]
- return pairs array
=end

# def pairs(array)
#   pairs = []
#   length = array.size
#   reps = (length + 1) / 2
#   reps.times { |rep| pairs << [array[rep], array[length - (rep + 1)]] }
#   pairs
# end

# def pairs1(array)
#   length = array.size
#   reps = (length + 1) / 2
#   reps.times.map { |rep| [array[rep], array[length - (rep + 1)]] }
# end

# p pairs([1, 2, 3, 4, 5, 6]) == [[1, 6], [2, 5], [3, 4]]
# p pairs([1, 2, 3, 4, 5]) == [[1, 5], [2, 4], [3, 3]]
# p pairs([1, 2]) == [[1, 2]]
# p pairs([1]) == [[1, 1]]
# p pairs([]) == []

### VOWEL SUBSTRINGS
=begin
Write a method that takes a string as an argument and returns the number of "vowel substrings" within it. A "vowel substring" is a consecutive sequence of characters within the input string that consists only of vowels ('a', 'e', 'i', 'o', and 'u') and has all five vowels present in it at least once. All input strings will contain only lowercase letters.

PROBLEM 11:54
input: string
  - contains only lowercase letters

output: integer
  - represents number of "vowel substrings"
    - consecutive sequence of characters from input string that
      - contains only vowels (a e i o u) and
        - contains all five vowels at least once
    - order does not matter

EXAMPLES

DATA STRUCTURES
needs:
  - way to determine if a substring consists only of vowels
    - way to determine if a character is a vowel
  - way to determine if all five vowels are present in a substring

start: string
  - array of vowels [a, e, i, o, u]
  - array of all possible substrings
    - minimum length: 5
    - maximum length: string length
    - start indexes: 0 up to string length - minimum length
  - array of substrings that contain only vowels
  - array of vowel substrings
finish: integer (size of vowel substrings array)

ALGORITHM
- create an array of all vowels: vowels
- get all candidate substrings from input string
  - start indexes: 0 up to (string length - 5)
    - lengths: 5 up to string length
- get all substrings that contain only vowels
  - all characters are included in vowels array
- get all vowel substrings
  - iterate over vowels array
    - select substrings where all vowels are used
- return size of vowel substrings array
=end

# VOWELS = %w(a e i o u)

# def count_vowel_substrings(string)
#   substrings = get_substrings(string)
#   only_vowels = get_only_vowels(substrings)
#   number_of_vowel_substrings(only_vowels)
# end

# def get_substrings(string)
#   substrings = []
#   min_length = 5
#   last_index = string.size - min_length
#   start_indexes = (0..last_index)

#   start_indexes.each do |start_index|
#     max_length = string.size - start_index
#     lengths = (min_length..max_length)

#     lengths.each do |length|
#       substrings << string[start_index, length]
#     end
#   end
#   substrings
# end

# def get_only_vowels(substrings)
#   substrings.select do |substring|
#     substring.chars.all? { |char| VOWELS.include?(char) }
#   end
# end

# def number_of_vowel_substrings(substrings)
#   substrings.count do |substring|
#     VOWELS.all? { |vowel| substring.include?(vowel) }
#   end
# end

# p count_vowel_substrings('abcde') == 0
# p count_vowel_substrings('aeiou') == 1
# p count_vowel_substrings('iaoue') == 1
# p count_vowel_substrings('aeiogu') == 0
# p count_vowel_substrings('aeiouu') == 2
# p count_vowel_substrings('aeiouuu') == 3
# p count_vowel_substrings('aaeeiioouu') == 4

### LETTER CHANGES
=begin
Write a method that takes a string as an argument and returns a new string with every letter character replaced with the 3rd letter following it in the alphabet ('a' becomes 'd', 'b' becomes 'e', etc).

Maintain the case of the original letter. Loop back to the beginning of the alphabet if the 3rd letter is past the end ('x' becomes 'a', 'Y' becomes 'B', etc). Leave any non-letter characters unchanged.

PROBLEM 9:08
input: string
  - can contain all types of characters

output: string
  - every letter character replaced with 3rd letter following it in alphabet
    - maintain case
    - loop back to beginning of alphabet if 3rd letter past the end
  - all other characters remain the same

EXAMPLES

DATA STRUCTURES
needs:
  - way to identify letter characters
  - way to get 3rd letter after a letter character
  - way to maintain case

start: string
  - array of all alphabetic characters, in order
    - uppercase and lowercase
      - append 'XYZ' and 'xyz'
  - array of individual letters in string
  - transformed array
finish: string
=end

# uppercase = ('A'..'Z').to_a + ('A'..'C').to_a
# lowercase = ('a'..'z').to_a + ('a'..'c').to_a
# ALPHABET = uppercase + lowercase

# def letter_changes(string)
#   string.chars.map do |char|
#     ALPHABET.include?(char) ? change_letter(char) : char
#   end.join
# end

# def change_letter(letter)
#   ALPHABET[ALPHABET.index(letter) + 3]
# end

# p letter_changes('abc') == 'def'
# p letter_changes('WxY') == 'ZaB'
# p letter_changes('364.39') == '364.39'
# p letter_changes("JaneDoe37@gmail.com") == 'MdqhGrh37@jpdlo.frp'

### SMALLER THAN CURRENT
=begin
Write a method that takes an array of numbers as an argument. For each number in the input array, determine how many other numbers in the array are less than that current number. Return these results in an array.

When counting how many numbers are less than the current number, only consider unique values. If a given number occurs more than once in the array, it should only be counted once.

PROBLEM 8:59
input: array
  - elements are numbers
  - not empty

output: array
  - each element: how many other unique numbers in the array are
    - less than the number at that position
  - only consider unique values
    - if a given number occurs more than once in the input array
      - only count it once

EXAMPLES

DATA STRUCTURES
needs:
- way to compare current number to all other UNIQUE numbers in array

start: array
  - array of unique values in input array
finish: array (transformed input array)

ALGORITHM
- create an array of unique values in input array: uniques
- transform the input array
  - for each number
    - count the number of values in the uniques array that are
      - less than the current number
    - make that count the new element in the transformed array
- return the transformed array
=end

# def smaller_than(array)
#   uniques = array.uniq
#   array.map do |number|
#     uniques.count { |unique| unique < number }
#   end
# end


# p smaller_than([1, 2]) == [0, 1] # 0 numbers are less than 1, 1 number is less than 2
# p smaller_than([1, 200]) == [0, 1]
# p smaller_than([1, 1, 2, 2]) == [0, 0, 1, 1]
# p smaller_than([1, 1, 2, 3]) #== [0, 0, 1, 2]
# p smaller_than([8, 1, 2, 3]) == [3, 0, 1, 2]
# p smaller_than([7, 7, 7]) == [0, 0, 0]
# p smaller_than([1]) == [0]



### SUBSTRING COUNT
=begin
Write a method that takes two strings as arguments and returns the number of times the second input string occurs as a substring within the first input string. Both input strings will consist solely of lowercase letters, and will always be at least one character in length.

PROBLEM 4:45
input: 2 strings
  - contains only lowercase letters
  - minimum length of 1

output: integer
  - number of times 2nd string occurs as a substring in 1st string
  - can be 0
  - overlapping substrings count
    - e.g. 'aaaa', 'aa' => 4

EXAMPLES

DATA STRUCTURES
needs:
  - way to count occurrences of string 2 in string 1

start: 2 strings: string1, string2
  - array of all possible substrings of same length as string 2 from string 1
  - matches for string 2 from those substrings
finish: integer (number of matches)

ALGORITHM
- get all possible candidate substrings
  - get length of string2
  - get all possible consecutive substrings of that length from string1
- count occurrences of string2 among those substrings
- return count
=end

# def count_substrings(string1, string2)
#   target_length = string2.size
#   substrings = get_substrings(string1, target_length)
#   substrings.count(string2)
# end

# def get_substrings(string, target_length)
#   subarrays = string.chars.each_cons(target_length).to_a
#   substrings = subarrays.map(&:join)
# end

# p count_substrings('abcdeb', 'b') == 2
# p count_substrings('cc', 'cc') == 1
# p count_substrings('abbcbb', 'bb') #== 2
# p count_substrings('abcdef', 'gh') == 0
# p count_substrings('aaaaa', 'aa') == 4

### GREATEST PRODUCT
=begin
Write a method that takes an integer and returns the greatest product of five consecutive digits from the integer. The input integer will always be positive and will always contain more than five digits.

PROBLEM 4:28
input: integer
  - positive
  - contains > 5 digits

output: integer
  - greatest product of 5 consecutive digits from input integer

EXAMPLES

DATA STRUCTURES
needs:
  - way to generate all possible 5-digit sequences
  - way to get products of all 5-digit sequences
  - way to choose greatest product

start: integer
  - array of individual digits
  - array of all 5 element subarrays
  - array of all products
finish: integer (greatest product)

ALGORITHM
- get all possible 5 digit sequences from input integer
  - create an array of individual digits from input integer
  - get all 5 digit subarrays
- transform all subarrays into their products
- return the greatest product
=end

# def greatest_product(integer)
#   subarrays = integer.digits.reverse.each_cons(5).to_a
#   products = subarrays.map { |subarray| subarray.inject(:*) }
#   products.max
# end

###
# def greatest_product(integer)
#   subarrays = get_subarrays(integer)
#   products = subarrays.map { |subarray| subarray.inject(:*) }
#   products.max
# end

# def get_subarrays(integer)
#   digits = integer.digits.reverse
#   target_length = 5
#   last_index = digits.size - target_length
#   start_indexes = (0..last_index)

#   start_indexes.map do |start_index|
#     digits[start_index, target_length]
#   end
# end

# p greatest_product(123456) #== 720 # (2 * 3 * 4 * 5 * 6)
# p greatest_product(923456) == 1080 # (9 * 2 * 3 * 4 * 5)
# p greatest_product(1234567890) == 15120 # (5 * 6 * 7 * 8 * 9)
# p greatest_product(2494037820244202221011110532909999) == 0

### ANAGRAM DIFFERENCES
=begin
Write a method that takes two strings as arguments and returns the total number of characters that must be removed from them to make them anagrams of each other. For this problem, two strings are anagrams if they contain all the same characters regardless of order. All input strings are either empty or contain only lowercase letters.

PROBLEM 12:37
input: 2 strings
  - can be empty
  - otherwise contain only lowercase letter characters

output: integer
  - represents total number of characters that
    - must be removed from input strings to make them "anagrams" of each other
  - anagrams:
    - contain all the same type and number of characters
      - regardless of order
    - two empty strings are considered anagrams
  - largest possible anagram is shorter of two input strings
    - minimum number of characters removed =
      - longer string length - shorter string length
  - if no characters in common, return will be combined lengths
  - (string 1 length - anagram length) + (string 2 length - anagram length)

EXAMPLES

DATA STRUCTURES
needs:
  - way to determine all the characters both strings have in common
  - way to determine how many characters must be removed
  - way to guard agains counting letters twice if they occur more often
    - in one string but not the other

start: 2 strings
  - array of letters both strings have in common (i.e. the anagram)
    - should not contain more of a particular letter than appears in either string
      - i.e. if string 1 has 2 'r's and string 2 has only 1 'r',
        - anagram can only contain 1 'r'
  - anagram length
finish: integer: string 1 length - anagram length + string 2 length - anagram length

ALGORITHM
- create an empty array to hold common characters
- iterate over each character in first string
  - if it appears in second string
    - add it to common characters array UNLESS
      - the count of that letter in the common characters array is >=
        - the count of that letter in the second string
- subtract the length of the common characters array from length of each input string, then add them together and return
-
=end

# def anagram_difference(string1, string2)
#   common_characters = []

#   string1.chars.each do |char|
#     if string2.include?(char)
#       common_count = common_characters.count(char)
#       count2 = string2.count(char)

#       common_characters << char unless common_count >= count2
#     end
#   end
#   common_size = common_characters.size
#   (string1.size - common_size) + (string2.size - common_size)
# end

###
# def anagram_difference(string1, string2)
#   common_characters = get_common_characters(string1, string2)
#   anagram_length = common_characters.size
#   (string1.size - anagram_length) + (string2.size - anagram_length)
# end

# def get_common_characters(string1, string2)
#   string1.chars.each_with_object([]) do |char, common_characters|
#     if string2.include?(char)
#       common_count = common_characters.count(char)
#       count2 = string2.count(char)
#       common_characters << char unless common_count >= count2
#     end
#   end
# end

# p anagram_difference('', '') == 0                     # anagrams: '', ''
# p anagram_difference('a', '') == 1                    # anagrams: '', ''
# p anagram_difference('', 'a') == 1                    # anagrams: '', ''
# p anagram_difference('ab', 'a') == 1                  # anagrams: 'a', 'a'
# p anagram_difference('ab', 'ba') == 0                 # anagrams: 'ab', 'ba'
# p anagram_difference('ab', 'cd') == 4                 # anagrams: '', ''
# p anagram_difference('a', 'aab') == 2                 # anagrams: 'a', 'a'
# p anagram_difference('codewarrs', 'hackerank') == 10 # anagrams: 'cear', 'acer'
# p anagram_difference('hackerank', 'codewarrs') == 10 # anagrams: 'cear', 'acer'

### ANAGRAMS
=begin
Write a method that takes two strings as arguments and returns true if they are anagrams of each other, false otherwise. For this problem, two strings are considered anagrams if they both contain all the same type and number of letters, regardless of case.

PROBLEM 12:10
input: 2 strings
  - can be empty

output: boolean
  - true if two strings are "anagrams"
    - both contain all the same type and number of letters
      - ignore case: 'abc' == 'AbC'
    - two empty strings are considered anagrams of each other
  - false otherwise

EXAMPLES

DATA STRUCTURES
needs:
  - way to access each individual character in strings
  - way to determine if both strings contain same kind and number of characters
  - way to treat upper and lowercase versions of same letter the same

start: 2 strings
  - count of each individual character in both strings
finish: boolean

ALGORITHM
- return false unless both string are the same length
- iterate over each character in string 1
  - if all downcased characters have same count as downcased characters in string 2
    - return true
  - otherwise return false

=end

# def anagram?(string1, string2)
#   same_size?(string1, string2) && same_letters?(string1, string2)
# end

# def same_size?(string1, string2)
#   string1.size == string2.size
# end

# def same_letters?(string1, string2)
#   downcased1 = string1.downcase
#   downcased2 = string2.downcase

#   downcased1.each_char.all? do |char|
#     downcased1.count(char) == downcased2.count(char)
#   end
# end

###
# def anagram?(string1, string2)
#   all_letters = (string1 + string2).chars.uniq.join.downcase
#   string1, string2 = [string1, string2].map(&:downcase)

#   all_letters.chars.all? do |char|
#     string1.count(char) == string2.count(char)
#   end
# end

# p anagram?('Creative', 'Reactive') == true
# p anagram?('Creative', 'Reactived') == false
# p anagram?('bold', 'DLOB') == true
# p anagram?('apple', 'apple') == true
# p anagram?('Apple', 'apple') == true
# p anagram?('apple', 'apply') == false
# p anagram?('apple', 'appl') == false
# p anagram?('', '') == true

### SHORTEST LENGTH SUBARRAY
=begin
Write a method that takes two inputs: an array of positive integers, and a positive integer. The method should return the shortest length of a subarray of consecutive elements from the input array for which the sum of its numbers is greater than or equal to the input integer. If no such subarray exists, return 0

PROBLEM 8:39
input: array, integer
  - array:
    - contains only positive integers
    - can be empty
  - integer:
    - positive
output: integer
  - represents shortest length of
    - a subarray of consecutive elements from input array
      - for which sum of its numbers >= input integer
  - subarray can consist of all elements from input array
  - return 0 if no such subarray exists

EXAMPLES

DATA STRUCTURES
needs:
  - way to generate all possible consecutive subarrays from input array
  - way to get sums of each subarray
  - way to choose shortest subarray that meets criteria

start: array, integer
  - array of all possible subarrays
    - from starting index 0 up to (array.size - 1)
    - from length 1 up to (array.size - starting index)
  - array of subarrays whose sum >= input integer
  - shortest subarray
finish: integer (shortest subarray length)

ALGORITHM
- get all possible subarrays from input array
  - create an empty array to hold subarrays: `subarrays`
  - set a variable `min_length` to 1
  - set a variable `last_index` to array length - min_length
  - create a range `start_indexes`: (0..last_index)

  - for each index in `start_indexes`
    - set a variable `max_length` to array length - current index
    - create a range `lengths`: (min_length..max_length)

    - for each length in `lengths`
      - add a subarray to `subarrays`
        - array[current starting index, current length]

  return `subarrays`

- select subarrays whose sum >= input integer
- return the length of the shortest such subarray
=end

# def shortest_length(numbers, target)
#   subarrays = get_subarrays(numbers)
#   candidates = subarrays.select { |subarray| subarray.sum >= target }
#   shortest = candidates.min_by { |candidate| candidate.size } || []
#   shortest.size
# end

# def get_subarrays(array)
#   subarrays = []
#   min_length = 1
#   last_index = array.size - min_length
#   start_indexes = (0..last_index)

#   start_indexes.each do |start_index|
#     max_length = array.size - start_index
#     lengths = (min_length..max_length)

#     lengths.each do |length|
#       subarrays << array[start_index, length]
#     end
#   end
#   subarrays
# end

###
# def get_subarrays(array)
#   min_length = 1
#   max_length = array.size
#   lengths = (min_length..max_length)

#   lengths.flat_map do |length|
#     array.each_cons(length).to_a
#   end
# end
###
#
# p shortest_length([2, 3, 1, 2, 4, 3], 7) == 2 # [4, 2]
# p shortest_length([1, 10, 5, 2, 7], 9) == 1 # [10]
# p shortest_length([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4 # [100, 1, 0, 200]
# p shortest_length([1, 2, 4, 1], 8) == 4 # [1, 2, 4, 1]
# p shortest_length([1, 2, 4], 8) == 0
# p shortest_length([], 1) == 0

### EIGHTEEN
=begin
Create a method that takes an array of integers as an argument. Determine and return the index N for which all numbers with an index less than N sum to the same value as the numbers with an index greater than N. If there is no index that would make this happen, return -1.

If you are given an array with multiple answers, return the index with the smallest value.

The sum of the numbers to the left of index 0 is 0. Likewise, the sum of the numbers to the right of the last element is 0.

PROBLEM 11:09
input: array
  - contains only integers

output: integer
  - index for which
    - sum of all numbers with indexes less than that index
    - equals
    - sum of all numbers with indexes greater than that index
  - if no such index, return -1
  - if more than 1 such index, return lowest index
  - sum of numbers to left of first index is 0
  - sum of numbers to right of last index is 0

EXAMPLES

DATA STRUCTURES
needs:
  - way to access all elements to right and left of a given index
  - way to compare sums of left and right elements
  - way to handle 'left of first index' and 'right of last index' sums

start: array of integers
  - variables to track left and right sums
    - set to 0 ???
  - subarrays to represent left and right slices
    - left slice:
      - [0...current index]
    - right slice:
      - [(current index + 1)..(array size)]

finish: integer (index)j
  - return -1 if no index found

ALGORITHM
XXX- create two variables to track left and right sums
  - left_sum, right_sum
    - left_sum = 0
    - right_sum = array[1..array.size]

- create a range to track current index
  - indexes = (0..array.size - 1)

- for each index
  - create left_slice
    - array[0...current_index]
  - create right_slice
    - array[(current_index + 1)..array.size]

  - update sums of both slices
  - compare sums
    - if they are equal
      - return current_index
    - otherwise, continue

- return -1 if no index found
=end

# def equal_sum_index(numbers)
#   indexes = (0..(numbers.size - 1))

#   midpoint = indexes.find do |current_index|
#     left_slice = numbers[0...current_index]
#     right_slice = numbers[(current_index + 1)..numbers.size]
#     left_slice.sum == right_slice.sum
#   end

#   midpoint || -1
# end

# p equal_sum_index([1, 2, 4, 4, 2, 3, 2]) == 3
# p equal_sum_index([7, 99, 51, -48, 0, 4]) == 1
# p equal_sum_index([17, 20, 5, -60, 10, 25]) == 0

# p equal_sum_index([0, 20, 10, -60, 5, 25]) == 0
# The above test case could return 0 or 3. Since we're
# supposed to return the smallest correct index, the correct
# return value is 0.

### SEVENTEEN
=begin
Create a method that takes an array of integers as an argument. The method should determine the minimum integer value that can be appended to the array so the sum of all the elements equal the closest prime number that is greater than the current sum of the numbers. For example, the numbers in [1, 2, 3] sum to 6. The nearest prime number greater than 6 is 7. Thus, we can add 1 to the array to sum to 7.

Notes:
    The array will always contain at least 2 integers.
    All values in the array must be positive (> 0).
    There may be multiple occurrences of the various numbers in the array.

PROBLEM 10:31
input: array
  - contains only integers
  - will always contain at least 2 integers
  - all integers are positive
  - integers can appear more than once

output: integer
  - minimum integer that can be appended to array
    - so that sum of all elements is equal to
      - next greater prime number
    - i.e. integer that when added to sum of input array integers
      -  will equal next greater prime number

EXAMPLES

DATA STRUCTURES
needs:
  - way to sum input array
  - way to determine next greater prime number

start: array of integers
  - sum of input array
  - next greater prime number
finish: integer (difference between the two)

ALGORITHM
- get the sum of the input array integers: `sum`

- find the next greater prime number
  - set `candidate` variable to `sum` + 1
  - start a loop

    - determine if `candidate` is a prime number
      - create a range from 2 up to square root of `candidate`
      - return true if no number in that range
        - is evenly divisible into `candidate`
      - otherwise return false

    - if yes, return that number
    - if no
      - increment `candidate` by 1
      - continue loop

- return the difference between `sum` and `candidate`
=end

# def nearest_prime_sum(numbers)
#   sum = numbers.sum
#   next_prime = find_next_prime(sum)
#   next_prime - sum
# end

# def find_next_prime(number)
#   candidate = number + 1

#   candidate += 1 until prime?(candidate)

#   candidate
# end

# def prime?(number)
#   max_possible_factor = Integer.sqrt(number)
#   possible_factors = (2..max_possible_factor)

#   possible_factors.none? do |possible_factor|
#     number % possible_factor == 0
#   end
# end

# p nearest_prime_sum([1, 2, 3]) == 1        # Nearest prime to 6 is 7
# p nearest_prime_sum([5, 2]) == 4           # Nearest prime to 7 is 11
# p nearest_prime_sum([1, 1, 1]) == 2        # Nearest prime to 3 is 5
# p nearest_prime_sum([2, 12, 8, 4, 6]) == 5 # Nearest prime to 32 is 37

# # Nearest prime to 163 is 167
# p nearest_prime_sum([50, 39, 49, 6, 17, 2]) == 4

### SIXTEEN
=begin
Create a method that returns the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. You may assume that the input string contains only alphanumeric characters.

PROBLEM 3:08
input: string
  - contains only alphanumeric characters
  - letters can be any case

output: integer
  - count of distinct alphabetic or numeric characters that
    - appear more than once
    - case insensivite: treat 'a' and 'A' as the same character
  - can be 0

EXAMPLES

DATA STRUCTURES
needs:
  - way to determine if a given character occurs more than once
  - way to treat upper and lowercase letters as the same character
  - way to keep track of count of number of multiple-occurence characters

start: string
  - downcased string
  - array of unique downcased characters from string
finish: integer: count of unique characters that occur more than once

ALGORITHM
- create a downcase version of the input string
- create an array of unique individual characters from that string
- count the number of those unique characters that occur more than once in downcased string
- return that count
=end

# def distinct_multiples(string)
#   downcased = string.downcase
#   uniques = downcased.chars.uniq
#   uniques.count { |letter| downcased.count(letter) > 1 }
# end

# p distinct_multiples('xyz') == 0               # (none
# p distinct_multiples('xxyypzzr') == 3          # x, y, z
# p distinct_multiples('xXyYpzZr') == 3          # x, y, z
# p distinct_multiples('unununium') == 2         # u, n
# p distinct_multiples('multiplicity') == 3      # l, t, i
# p distinct_multiples('7657') == 1              # 7
# p distinct_multiples('3141592653589793') == 4  # 3, 1, 5, 9
# p distinct_multiples('2718281828459045') == 5  # 2, 1, 8, 4, 5

### FIFTEEN
=begin
Create a method that takes a string argument that consists entirely of numeric digits and computes the greatest product of four consecutive digits in the string. The argument will always have more than 4 digits.

PROBLEM 2:40
input: string
  - contains only numeric characters
  - will always have a length > 4

output: integer
  - greatest product of 4 consecutive digits

EXAMPLES

DATA STRUCTURES
needs:
  - way to get all sequences of four consecutive digits
  - way to change substrings into arrays of individual characters
  - way to convert string digits into integers
  - way to get products
  - way to get greatest product

start: string
  - array of individual digits converted to integers
  - array of all four-digit subarrays
  - array of all products
finish: integer (greatest product)

ALGORITHM
- create an array of individual characters from input string
- transform into an array of integers
- create an array of all 4-element subarrays
  - start indexes: from 0 up to (array length - 4)
  - lengths: always 4
- transform into an array of product of each subarray's integers
- return the greatest product
=end

# def greatest_product(string)
#   digits = string.chars.map(&:to_i)
#   subarrays = get_subarrays(digits)
#   products = subarrays.map { |subarray| subarray.inject(:*) }
#   products.max
# end

# def get_subarrays(array)
#   subarrays = []
#   target_length = 4
#   last_index = array.size - target_length
#   start_indexes = (0..last_index)

#   start_indexes.each do |start_index|
#     subarrays << array[start_index, target_length]
#   end

#   subarrays
# end

###
# def get_subarrays(array)
#   array.each_cons(4).to_a
# end
###

# p greatest_product('23456') == 360      # 3 * 4 * 5 * 6
# p greatest_product('3145926') == 540    # 5 * 9 * 2 * 6
# p greatest_product('1828172') == 128    # 1 * 8 * 2 * 8
# p greatest_product('123987654') == 3024 # 9 * 8 * 7 * 6

### FOURTEEN
=begin
Create a method that takes a single integer argument and returns the sum of all the multiples of 7 or 11 that are less than the argument. If a number is a multiple of both 7 and 11, count it just once.

For example, the multiples of 7 and 11 that are below 25 are 7, 11, 14, 21, and 22. The sum of these multiples is 75.

If the argument is negative, return 0.

PROBLEM 2:31
input: integer
  - can be positive, negative, or zero

output: integer
  - sum of all multiples of 7 or 11
    - that are less than input integer
    - if multiple of BOTH 7 and 11
      - only count that multiple once
  - if input integer is negative, return 0

EXAMPLES

DATA STRUCTURES
needs:
  - way to find all multiples of 7 & 11 less than input integer
  - way to sum multiples
  - way to deal with negative input integers?

start: integer
  - array of all multiples of 7 & 11 less than input integer
finish: integer (summed array)

ALGORITHM
- get all unique multiples of 7 and 11 less than input integer
  - create a range from 7 up to (input integer - 1)
    - select numbers from range if they are multiples of 7 or 11
- get sum of those multiples and return it
  - return 0 if input integer is < 1
=end

# def seven_eleven(number)
#   multiples = (7...number).select { |num| num % 7 == 0 || num % 11 == 0 }
#   multiples.sum
# end

# p seven_eleven(10) == 7
# p seven_eleven(11) == 7
# p seven_eleven(12) == 18
# p seven_eleven(25) == 75
# p seven_eleven(100) == 1153
# p seven_eleven(0) == 0
# p seven_eleven(-100) == 0

### THIRTEEN
=begin
Create a method that takes two strings as arguments and returns true if some portion of the characters in the first string can be rearranged to match the characters in the second. Otherwise, the method should return false.

You may assume that both string arguments only contain lowercase alphabetic characters. Neither string will be empty.

PROBLEM 9:12
input: 2 strings
  - both contain only lowercase alphabetic characters
    - case is irrelevant
  - neither string is empty
  - can be different lengths

output: boolean
  - true if:
    - some portion of characters in string 1
      - can be rearranged to match characters in string 2
    - string 1 can contain letters that are not in string 2

  - false otherwise
    - string 2 can contain letters that are not in string 1
      - will produce a return of `false`

EXAMPLES

DATA STRUCTURES
needs:
  - way to determine whether all letters from string 2 appear in string 1

start: string1, string 2
  - hash from string1
    - keys are letters
    - values are counts of that letter
  - array of individual characters in string2
finish: boolean

ALGORITHM
- create a hash from string1
  - keys are letters
  - values are counts
- create an array of individual letters in string 2
- for every letter in string 2, check
  - if it exists as a key in string1 hash AND
  - if the hash value for that letter is >= count of that letter in string2
- return true if all letters pass that test, false otherwise
=end

# def unscramble(string1, string2)
#   string1_hash = string1.chars.tally
#   string2.chars.all? do |char|
#     string1_hash[char] && string1_hash[char] >= string2.count(char)
#   end
# end

# def unscramble(string1, string2)
#   string2.chars.all? { |char| string1.count(char) >= string2.count(char) }
# end

# p unscramble('ansucchlohlo', 'launchschool') == true
# p unscramble('phyarunstole', 'pythonrules') == true
# p unscramble('phyarunstola', 'pythonrules') == false
# p unscramble('boldface', 'coal') == true

### GRAHAM JARVIS' TA QUESTION
=begin
Some numbers have only ascending digits, like 123, 3445, 2489, etc.
Some numbers have only descending digits, like 321, 5443, 9842, etc.
A number is "bouncy" if it has both ascending and descending digits, like 313, 92543, etc.
Write a method that takes a list of numbers and counts how many of them are bouncy.

PROBLEM 11:51
input: array
  - can be empty
  - otherwise contains integers

output: integer
  - represents number of 'bouncy' elements in input array
    - 'bouncy':
      - contains both ascending digits and descending digits
      - order and occurences of ascending / descending is not important
        - e.g. 92543: down, up, down, down
  - input array is empty, return 0

EXAMPLES

DATA STRUCTURES
needs:
  - way to consider each number in input array
  - way to consider each pair of digits in each number
  - way to determine if a given pair is ascending or descending
  - way to determine whether a number has both ascending and descending pairs

start: array of numbers
  - array of individual digits in each number
  - range for indexes: from 0 up to array length - 2
    - number at current index <=> number at current index + 1
    - if at least one is ascending and one is descending, count that number as bouncy
finish: integer (number of bouncy numbers)

[1, 2, 1]

ALGORITHM
- create a variable to track number of bouncy numbers in input array
  - set to 0
- for each number in the input array
  - create an array of individual digits
  - examine each pair of digits
    - if any pair is ascending AND
    - any pair is descending
    - increment bouncy numbers count
- return bouncy numbers count
=end

# def bouncy_count(numbers)
#   count = 0

#   numbers.each do |number|
#     digits = number.digits.reverse
#     last_index = digits.size - 2

#     ascending = (0..last_index).any? do |current_index|
#       digits[current_index] < digits[current_index + 1]
#     end

#     descending = (0..last_index).any? do |current_index|
#       digits[current_index] > digits[current_index + 1]
#     end

#     count += 1 if ascending && descending
#   end

#   count
# end

# p bouncy_count([]) == 0
# p bouncy_count([11, 0, 345, 21]) == 0
# p bouncy_count([121, 4114]) == 2
# p bouncy_count([176, 442, 80701644]) == 2

### refactored
# def bouncy_count(numbers)
#   count = 0

#   numbers.each do |number|
#     digits = number.digits.reverse
#     count += 1 if ascending?(digits) && descending?(digits)
#   end

#   count
# end

# def ascending?(digits_array)
#   last_index = digits_array.size - 2
#   (0..last_index).any? do |current_index|
#     digits_array[current_index] < digits_array[current_index + 1]
#   end
# end

# def descending?(digits_array)
#   last_index = digits_array.size - 2
#   (0..last_index).any? do |current_index|
#     digits_array[current_index] > digits_array[current_index + 1]
#   end
# end
###

### NORA VOGT'S TA QUESTION
=begin
Write a function that returns the maximum possible consecutive alternating odd and even (or even and odd) numbers. Minimum possible length is 2. If there's none return [].

PROBLEM 11:07
input: array
  - contains integers

output: array
  - longest possible sequence of
    - consecutive alternating even/odd or odd/even numbers
  - minimum length = 2
  - return an empty array if no such sequence
  - can be entire sequence of input array

EXAMPLES

DATA STRUCTURES
needs:
  - way to get all possible subarrays of consecutive elements
    - minimum length 2
  - way to determine if a subarray alternates between odd and even

start: array
  - array of all possible subarrays
    - minimum length 2
  - array of all subarrays that alternate
finish: array (longest alternating subarray)

ALGORITHM
- get all possible subarrays, minimum length 2
  - create an empty array to hold subarrays
  - consider every starting index from 0 up to array length - 2
    - consider every possible length from 2 up to (current_index - length)
      - add subarray from [start index, length] to subarrays array

- get all alternating subarrays
  - for each subarray:
    - select it if:
      - for all pairs of consecutive elements in the array
        - if the first element is odd
          - the second element is even
        - elsif the first element is even
          - the second element is odd

- return the longest alternating subarray, or an empty array
=end

# def longest_alternating_subarray(array)
#   sequences = get_sequences(array)
#   alternators = sequences.select { |sequence| alternating?(sequence) }
#   alternators.max_by(&:size) || []
# end

# def get_sequences(array)
#   sequences = []
#   last_index = array.size - 2

#   (0..last_index).each do |start_index|
#     max_length = array.size - start_index
#     (2..max_length).each do |length|
#       sequences << array[start_index, length]
#     end
#   end
#   sequences
# end

# def alternating?(array)
#   last_index = array.size - 2

#   (0..last_index).all? do |current_index|
#     number = array[current_index]
#     next_number = array[current_index + 1]

#     if number.odd?
#       next_number.even?
#     elsif number.even?
#       next_number.odd?
#     end

#   end
# end

# p longest_alternating_subarray([1, 2, 3, 4, 5, 6]) == [1, 2, 3, 4, 5, 6]
# p longest_alternating_subarray([2, 4, 6, 8]) == []
# p longest_alternating_subarray([1, 3, 5, 7]) == []
# p longest_alternating_subarray([1, 1, 3, 7, 8, 5]) == [7, 8, 5]
# p longest_alternating_subarray([4, 6, 7, 12, 11, 9, 17]) == [6, 7, 12, 11]

### TWELVE
=begin
Create a method that takes a string as an argument and returns true if the string is a pangram, false if it is not.

Pangrams are sentences that contain every letter of the alphabet at least once. For example, the sentence "Five quacking zephyrs jolt my wax bed." is a pangram since it uses every letter at least once. Note that case is irrelevant.

PROBLEM 4:44
input: string

output:boolean
  - true if input string is a 'pangram'
    - uses every letter of the alphabet at least once
    - ignore case
      - 'a' and 'A' are treated the same
  - false otherwise

EXAMPLES

DATA STRUCTURES
needs:
  - way to determine if every alphabet letter is used at least once

start: string
  - array of all alphabetic characters (lowercase)
  - downcased version of input string
  - conditional based on count of each letter
finish: boolean

ALGORITHM
- create an array of all lowercase alphabetic characters
- create a downcased version of the input string
- iterate over the alphabet array
  - return 'false' if any letter has a count of 0
  - return 'true' if all have a count > 0
=end

# LETTERS = ('a'..'z').to_a

# def is_pangram?(string)
#   LETTERS.all? { |letter| string.downcase.count(letter).positive? }
#   # LETTERS.none? { |letter| string.downcase.count(letter).zero? }
# end

# p is_pangram?('The quick, brown fox jumps over the lazy dog!') #== true
# p is_pangram?('The slow, brown fox jumps over the lazy dog!') == false
# p is_pangram?("A wizard's job is to vex chumps quickly in fog.") == true
# p is_pangram?("A wizard's task is to vex chumps quickly in fog.") == false
# p is_pangram?("A wizard's job is to vex chumps quickly in golf.") == true

# my_str = 'Sixty zippers were quickly picked from the woven jute bag.'
# p is_pangram?(my_str) == true

### ELEVEN
=begin
Create a method that takes a nonempty string as an argument and returns an array consisting of a string and an integer. If we call the string argument s, the string component of the returned array t, and the integer component of the returned array k, then s, t, and k must be related to each other such that s == t * k. The values of t and k should be the shortest possible substring and the largest possible repeat count that satisfies this equation.

You may assume that the string argument consists entirely of lowercase alphabetic letters.

PROBLEM 3:51
input: string: `string`
  - not empty
  - contains only lowercase alphabetic letters

output: array
  - two elements
    - string: `substring`
      - substring of input string
      - can == entire input string
    - integer: `repeat_count`
      - represents times `substring` is multiplied to equal `string`
      - can be 1 (if `substring` == entire input string)
    - must satisfy: `substring` * `repeat_count` == `string`
      - `substring` should be shortest possible substring
      - `repeat_count` should be highest possible number

EXAMPLES

DATA STRUCTURES
needs:
  - way to generate potential substrings
    - all will start at index 0
    - length can be from 1 up to input string length
  - way to determine potential repeat count
    - string length / substring length
  - way to test whether substring * repeat_count equals string
    - substring * repeat_count == string

start: string
  - array of all possible substrings
    - all start at index 0
    - length: from 1 up to input string length
  - array of all substrings sorted by length (shortest to longest)
  - repeat_count: input string length / current substring length
finish: [substring, repeat_count]
  - first substring which return true to:
    - substring * repeat_count == string]

ALGORITHM
- get all possible substrings from first index
  - create an empty array to hold substrings: substrings
  - get all possible length substrings that start at index 0
    - lengths: from 1 up to input string length
      - for each length
        - add appropriate substring to `substrings` array
          - string[0, current length]
- find shortest substring that satisfies formula
  - transform into a nested array
    - repeat count = string length / substring length
    - [substring, repeat_count]

  - for each subarray
    - test: substring * repeat_count == string
    - return first subarray that satisfies test
=end

# def repeated_substring(string)
#   substrings = get_substrings(string)
#   candidates = get_candidates(substrings)
#   candidates.find { |candidate| candidate.inject(:*) == string }
# end

# def get_substrings(string)
#   substrings = []
#   max_length = string.size
#   (1..max_length).each do |current_length|
#     substrings << string[0, current_length]
#   end
#   substrings
# end

# def get_candidates(substrings)
#   substrings.map do |substring|
#     repeat_count = substrings.last.size / substring.size
#     [substring, repeat_count]
#   end
# end

###
# def repeated_substring(string)
#   1.upto(string.size).each do |current_length|
#     current_substring = string[0, current_length]
#     repeat_count = string.length / current_length
#     pair = [current_substring, repeat_count]
#     return pair if pair.inject(:*) == string
#   end
# end

# p repeated_substring('xyzxyzxyz') == ['xyz', 3]
# p repeated_substring('xyxy') == ['xy', 2]
# p repeated_substring('xyz') == ['xyz', 1]
# p repeated_substring('aaaaaaaa') == ['a', 8]
# p repeated_substring('superduper') == ['superduper', 1]

### TEN
=begin
Create a method that takes a string of digits as an argument and returns the number of even-numbered substrings that can be formed. For example, in the case of '1432', the even-numbered substrings are '14', '1432', '4', '432', '32', and '2', for a total of 6 substrings.

If a substring occurs more than once, you should count each occurrence as a separate substring.

PROBLEM 3:20
input: string
  - contains only numeric characters

output: integer
  - represents number of even-numbered substrings that can be created
    - repetitions are included in count
    - substring can equal entire input string
  - can be 0
    - if no even number in input string

EXAMPLES

DATA STRUCTURES
needs:
  - way to get all possible substrings
  - way to determine which substrings represent even numbers
  - way to count number of even-numbered substrings

start: string
  - array of all possible substrings
  - filtered array: only even-numbered substrings
finish: integer (size of filtered array)

ALGORITHM
- get all possible substrings
  - create an empty array to hold substrings
  - consider each starting index
    - from 0 up to (string length - 1)

  - get all possible substrings from that starting index
    - use length
      - from 1 up to (string length - current starting index)
  - add substrings to substring array
    - string[starting index, current length]

- find even-numbered substrings
  - for each substring
    - convert it to an integer
    - select it if it is even
    - ignore otherwise
- return number of even-numbered substrings
  - size of even-numbered substrings array
=end

# def even_substrings(string)
#   substrings = get_substrings(string)
#   even_numbered_substrings = substrings.select do |substring|
#     substring.to_i.even?
#   end
#   even_numbered_substrings.size
# end

# def get_substrings(string)
#   substrings = []
#   last_index = string.size - 1

#   (0..last_index).each do |start_index|
#     max_size = string.size - start_index

#     (1..max_size).each do |length|
#       substrings << string[start_index, length]
#     end
#   end
#   substrings
# end

####
# def even_substrings(string)
#   even_substrings = get_even_substrings(string)
#   even_substrings.size
# end

# def get_even_substrings(string)
#   substrings = []
#   last_index = string.size - 1

#   (0..last_index).each do |start_index|
#     add_even_substrings(string, start_index, substrings)
#   end

#   substrings
# end

# def add_even_substrings(string, start_index, substrings)
#   max_size = string.size - start_index
#   (1..max_size).each do |length|
#     current_substring = string[start_index, length]
#     substrings << current_substring if current_substring.to_i.even?
#   end
# end

# p even_substrings('1432') == 6
# p even_substrings('3145926') == 16
# p even_substrings('2718281') == 16
# p even_substrings('13579') == 0
# p even_substrings('143232') == 12

### NINE
=begin
Create a method that takes two string arguments and returns the number of times that the second string occurs in the first string. Note that overlapping strings don't count: 'babab' contains 1 instance of 'bab', not 2.

You may assume that the second argument is never an empty string.

PROBLEM 1:13
input: 2 strings
  - first string can be empty
  - second string is never empty

output: integer
  - represents number of times that 2nd string occurs in 1st
    - overlapping strings don't count:
      - 'bab' only occurs once in 'babab'
      - i.e. can only count each letter once
  - if first string is empty, return 0

EXAMPLES

DATA STRUCTURES
needs:
  - way to find occurrences of 2nd string in 1st string
  - way to keep track of number of occurrences
  - way to avoid double counting

start: 2 strings
  - counter to track number of matches
  - compare slices from 1st string to 2nd string
    - slice size == 2nd string size
    - index of last character of matching slice ==
      - where to start searching again after match found
finish: integer

ALGORITHM
- create a counter to track matches: matches = 0
- create a counter to track starting index: start_index = 0
- consider each possible start index of string1
  - from 0 up to (string1 length - string2 length): current_index
    - skip this iteration unless current_index == start_index
    - for each current_index
      - compare a slice starting from that index
        - and with the same size as string2
          - to string2: string1[current_index, string2 length] == string2
      - if they match
        - increment matches by 1
        - set start_index to: current_index + string2 length
      - otherwise
        - increment start_index by 1
- return matches
=end

# def count_substrings(string1, string2)
#   matches = 0
#   start_index = 0
#   max_index = string1.size - string2.size

#   (0..max_index).each do |current_index|
#     next unless current_index == start_index
#     length = string2.size

#     if string1[current_index, length] == string2
#       matches += 1
#       start_index = current_index + length
#     else
#       start_index += 1
#     end
#   end

#   matches
# end

# p count_substrings('babab', 'bab') == 1
# p count_substrings('babab', 'ba') == 2
# p count_substrings('babab', 'b') == 3
# p count_substrings('babab', 'x') == 0
# p count_substrings('', 'x') == 0
# p count_substrings('bbbaabbbbaab', 'baab') == 2
# p count_substrings('bbbaabbbbaab', 'bbaab') == 2
# p count_substrings('bbbaabbbbaabb', 'bbbaabb') == 1

### EIGHT
=begin
Create a method that takes a non-empty string as an argument. The string consists entirely of lowercase alphabetic characters. The method should return the length of the longest vowel substring. The vowels of interest are "a", "e", "i", "o", and "u".

PROBLEM 11:00
input: string
  - not empty
  - contains only lowercase alphabetic characteers
output: integer
  - length of longest 'vowel substring'
    - substring consisting solely of vowels
      - vowels: a e i o u
  - can be 0
    - if no vowels in input string

EXAMPLES

DATA STRUCTURES
needs:
  - way to get all vowel substrings from input string
  - way to determine longest vowel substring

start: string
  - array of all possible substrings
  - array of all vowel substrings
  - transformed array: lengths
  - largest length
finish: integer

ALGORITHM
- get all possible substrings
  - create an empty array to hold substrings
  - create a range to represent starting index
    - start at index 0, then index 1, up to final index
      - final index: (string length - 1)

    - create a range to represent current length
      - start at length 1, up to maximum length
        - maximum length: string length - current index
    - add string[starting index, current length] to substrings array
- get all vowel substrings
  - select only substrings that contain only vowels (a e i o u)
- get length of longest vowel substrings
=end

# def longest_vowel_substring(string)
#   substrings = get_substrings(string)
#   vowel_substrings = substrings.select do |substring|
#     substring.each_char.all? { |char| 'aeiou'.include?(char) }
#   end
#   largest = vowel_substrings.max_by(&:size) || ''
#   largest.size
# end

# def get_substrings(string)
#   substrings = []
#   final_index = string.size - 1

#   (0..final_index).each do |start_index|
#     max_length = string.size - start_index

#     (1..max_length).each do |length|
#       substrings << string[start_index, length]
#     end
#   end
#   substrings
# end

# p longest_vowel_substring('cwm') == 0
# p longest_vowel_substring('many') == 1
# p longest_vowel_substring('launchschoolstudents') == 2
# p longest_vowel_substring('eau') == 3
# p longest_vowel_substring('beauteous') == 3
# p longest_vowel_substring('sequoia') == 4
# p longest_vowel_substring('miaoued') == 5

### FOURTEEN
=begin
Create a method that takes a single integer argument and returns the sum of all the multiples of 7 or 11 that are less than the argument. If a number is a multiple of both 7 and 11, count it just once.

For example, the multiples of 7 and 11 that are below 25 are 7, 11, 14, 21, and 22. The sum of these multiples is 75.

If the argument is negative, return 0.

PROBLEM 10:40
input: integer
  - can be positive, 0, or negative
  - if negative, return 0
  - if 0, return 0

output: integer
  - sum of all multiples of 7 or 11 that are
    - less than input integer
    - only count a particular multiple once:
      - if multiple of both 7 and 11, count it just once

EXAMPLES

DATA STRUCTURES
needs:
  - way to consider every number between 7 and (input integer - 1)
  - way to determine if a multiple of 7 or 11
  - way to exclude double counting
    - if multiple of BOTH 7 and 11

start: integer
  - range: from 7 up to integer - 1
  - array of all multiples of 7 or 11 from that range
  - sum of multiples array
finish: integer

ALGORITHM
- create a range from 7 up to (input integer - 1)
- for every number in that range
  - select it if it is a multiple of 7 or a multiple of 11
- get the sum of that array
=end

# # def seven_eleven(number)
# #   multiples = (7...number).select { |num| num % 7 == 0 || num % 11 == 0 }
# #   multiples.sum
# # end

# # def seven_eleven(number)
# #   (1...number).filter_map do |candidate|
# #     candidate if [7, 11].any? { |divisor| candidate % divisor == 0 }
# #   end.sum
# # end

# def seven_eleven(number)
#   ((7...number).step(7).to_a + (11...number).step(11).to_a).uniq.sum
# end

# p seven_eleven(10) == 7
# p seven_eleven(11) == 7
# p seven_eleven(12) == 18
# p seven_eleven(25) == 75
# p seven_eleven(100) == 1153
# p seven_eleven(0) == 0
# p seven_eleven(-100) == 0

### SEVEN
=begin
Create a method that takes an array of integers as an argument and returns the number of identical pairs of integers in that array. For instance, the number of identical pairs in [1, 2, 3, 2, 1] is 2: there are two occurrences each of both 2 and 1.

If the array is empty or contains exactly one value, return 0.

If a certain number occurs more than twice, count each complete pair once. For instance, for [1, 1, 1, 1] and [2, 2, 2, 2, 2], the method should return 2. The first array contains two complete pairs while the second has an extra 2 that isn't part of the other two pairs.

PROBLEM 9:09
input: array
  - elements are integers
  - some integers may be repeated
  - may be empty
  - may contain only 1 value

output: integer
  - represents the number of 'identical pairs'
    - an identical pair contains the same two numbers
    - numbers need not be contiguous
  - if no identical pairs, return 0
    - an empty input array
    - an array with only one element
    - an array with no repeated numbers
  - count only 'complete' pairs
    - if there are 5 occurrences of a number, there are only 2 complete pairs

EXAMPLES

DATA STRUCTURES
needs:
  - way to count occurrences of each unique number
  - way to determine 'complete' pairs

start: array
  - array of unique integers from input array: uniques
  - transformed unique array: counts for each unique integer: pairs
  - transformed counts array: each count divided by 2: pair_counts
finish: integer: sum of pair_counts array

ALGORITHM
- create an array of the unique values in the input array
- transform this array into counts of the occurrences of each unique value
- transform counts array: divide each value by 2 (integer division)
- return the sum of that array
=end

# def pairs(numbers)
#   uniques = numbers.uniq
#   counts = uniques.map { |number| numbers.count(number) }
#   pair_count = counts.map { |count| count / 2 }
#   pair_count.sum
# end

# def pairs(numbers)
#   numbers.uniq.map { |number| numbers.count(number) / 2 }.sum
# end

# p pairs([3, 1, 4, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7]) == 3
# p pairs([2, 7, 1, 8, 2, 8, 1, 8, 2, 8, 4]) == 4
# p pairs([]) == 0
# p pairs([23]) == 0
# p pairs([997, 997]) == 1
# p pairs([32, 32, 32]) == 1
# p pairs([7, 7, 7, 7, 7, 7, 7]) == 3

### SIX
=begin
Create a method that takes a string argument and returns a hash in which the keys represent the lowercase letters in the string, and the values represent how often the corresponding letter occurs in the string.

PROBLEM 8:32
input: string
  - may contain both lower and uppercase letter characters
  - may contain punctuation, whitespace
  - may be empty
  - may contain 0 lowercase letters

output: hash
  - keys: each lowercase letter in string (as a string)
  - values: number of occurrences of that letter
  - if no lowercase letters in input string, return empty hash
    - empty, or only uppercase, punctuation, etc

EXAMPLES

DATA STRUCTURES
needs:
  - way to consider each character in input string
  - way to distinguish lowercase letters from any other letters
  - way to count occurrences of lowercase letters

start: string
  - array of all lowercase alphabetic characters
  - empty hash, default value of 0
  - array of individual characters
  - conditional
    - if lowercase, add to hash count
    - else ignore
finish: hash

ALGORITHM
- create an array of all lowercase alphabetic characters: LOWERCASE
- create an empty hash, with a default value of 0: counts
- create an array of individual characters from the input string
  - for each character:
    - if it is not lowercase, go to the next character
    - if it is lowercase, increment that letter in counts hash
- return the counts hash
=end

# LOWERCASE = ('a'..'z').to_a

# def count_letters(string)
#   counts = Hash.new(0)
#   string.chars.each do |char|
#     counts[char] += 1 if LOWERCASE.include?(char)
#   end
#   counts
# end

# expected = {'w' => 1, 'o' => 2, 'e' => 3, 'b' => 1, 'g' => 1, 'n' => 1}
# p count_letters('woebegone') == expected

# expected = {'l' => 1, 'o' => 1, 'w' => 1, 'e' => 4, 'r' => 2,
#             'c' => 2, 'a' => 2, 's' => 2, 'u' => 1, 'p' => 2}
# p count_letters('lowercase/uppercase') == expected

# expected = {'u' => 1, 'o' => 1, 'i' => 1, 's' => 1}
# p count_letters('W. E. B. Du Bois') == expected

# p count_letters('x') == {'x' => 1}
# p count_letters('') == {}
# p count_letters('!!!') == {}

### FIVE
=begin
Create a method that takes a string argument and returns the character that occurs most often in the string. If there are multiple characters with the same greatest frequency, return the one that appears first in the string. When counting characters, consider uppercase and lowercase versions to be the same.

PROBLEM 9:11
input: string
  - contains upper and lowercase letters
output: string
  - most frequent character
    - case insensitive: 'a' == 'A' in terms of counting
    - returned character should be lower case
  - if any ties, return character that appears first in the string

EXAMPLES

DATA STRUCTURES
needs:
  - way to consider each character
  - way to count occurrences of every character
    - way to treat different case characters as the same character
  - way to find the earliest character with the highest count

start: string
  - array of individual characters
  - hash with character counts?
finish: one-character string

ALGORITHM
- create an array of the downcased individual characters in the string
- examine each character
  - get the number of times the downcased version of that character occurs in the downcased string
  - return the earliest character with the highest number of occurences
=end

# def most_common_char(string)
#   lowercase = string.downcase
#   lowercase.chars.max_by { |char| lowercase.count(char) }
# end

# p most_common_char('Hello World') == 'l'
# p most_common_char('Mississippi') == 'i'
# p most_common_char('Happy birthday!') == 'h'
# p most_common_char('aaaaaAAAA') == 'a'

# my_str = 'Peter Piper picked a peck of pickled peppers.'
# p most_common_char(my_str) == 'p'

# my_str = 'Peter Piper repicked a peck of repickled peppers. He did!'
# p most_common_char(my_str) == 'e'

### FOUR
=begin
Create a method that takes an array of integers as an argument and returns an array of two numbers that are closest together in value. If there are multiple pairs that are equally close, return the pair that occurs first in the array.

PROBLEM 5:12
input: array
  - elements are integers
output: array
  - contains two integers:
    - the two from input array that are closest in value
      - need not be contiguous
    - return first pair if there are more than one pair equally close
      - presumably: which pair's first number occurs first

EXAMPLES

DATA STRUCTURES
needs:
  - a way to compare each number to every other number
  - a way to get the difference in value between each pair
  - a way to identify the pair with the smallest difference

start: array
  - array of all possible pairs
    - no need for 'reverse' pairs: [5, 25] and not [25, 5]
    - first number index: from 0 up to (array length - 1)
    - second number index: (current index + 1) up to (array length - 1)
  - pairs array sorted by difference between its elements
output: array (smallest difference pair)

ALGORITHM
- get all possible pairs:
  - create an empty array to hold pairs: pairs
  - create a range from 0 up to (array length - 1): index1
    - for each number in index1
      - create a range from (index1 + 1) up to (array length - 1): index2
      - add an array with elements at index 1 and index 2 to pairs
- return the pair with the smallest difference between its elements
=end

# def closest_numbers(array)
#   pairs = get_pairs(array)
#   pairs.min_by { |pair| pair.inject(:-).abs }
# end

# def get_pairs(array)
#   pairs = []
#   last_index = array.size - 1

#   (0..last_index).each do |index1|
#     ((index1 + 1)..last_index).each do |index2|
#       pairs << [array[index1], array[index2]]
#     end
#   end

#   pairs
# end

# p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
# p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
# p closest_numbers([12, 22, 7, 17]) == [12, 7]

### THREE
=begin
Create a method that takes a string argument and returns a copy of the string with every second character in every third word converted to uppercase. Other characters should remain the same.

PROBLEM 4:40
input: string

output: new string
  - in every third word
    - every second character converted to uppercase
      - if less than two characters, word is unchanged
    - 'word' = contiguous string of non-space characters
  - all other characters remain the same

EXAMPLES

DATA STRUCTURES
needs:
  - way to access each individual word
    - way to identify every third word
  - way to access each indvidual character in third words
    - way to identify every second character
    - way to change case of appropriate characters

start: string
  - array of individual words
    - with indexes
      - (index + 1) % 3 == 0?
  - array of individual characters for every third word
    - with indexes
      - is index odd?
  - transformed array of individual characters of every third word
  - transformed array of individual words
finish: new string

ALGORITHM
- create an array of individual words from input string
- transform words array:
  - for every word and its index
    - check whether it is a 'third word'
      - is (index + 1) evenly divisible by 3?

      - if yes
        - create an array of individual characters from that word
        - transform characters array:
          - check whether it is a 'second character'
            - is index odd?
          - if yes
            - uppercase that character
          - if no
            - do nothing

      - if no
        - do nothing

- convert words array into a string and return it
=end

# def to_weird_case(string)
#   words = string.split
#   weird_words = words.map.with_index do |word, index|
#     (index + 1) % 3 == 0 ? change_word(word) : word
#   end
#   weird_words.join(' ')
# end

# def change_word(word)
#   characters = word.chars
#   characters.map.with_index do |character, index|
#     index.odd? ? character.upcase : character
#   end.join
# end

# original = 'Lorem Ipsum is simply dummy text of the printing world'
# expected = 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG world'
# p to_weird_case(original) == expected

# original = 'It is a long established fact that a reader will be distracted'
# expected = 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
# p to_weird_case(original) == expected

# p to_weird_case('aaA bB c') == 'aaA bB c'

# original = "Mary Poppins' favorite word is supercalifragilisticexpialidocious"
# expected = "Mary Poppins' fAvOrItE word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS"
# p to_weird_case(original) == expected

### TA SESSION
=begin
Implement a function that calculates the sum of numbers inside of a string.

You can expect that the string will include only positive numbers.

PROBLEM 10:00
input: string
  - contains one or more numeric characters
  - mixed in with non-numeric characters (letters, spaces, etc)
output: integer
  - sum of all 'numbers' in input string
    - 'number' is a contiguous string of numeric characters
    - multiple numeric charactes in a row represents a multi-digit number
    - only positive numbers are represented

EXAMPLES

DATA STRUCTURES
needs:
  - a way to determine if a character is numeric
  -  a way to separate numeric characters from other characters
  * a way to keep contiguous strings of numeric characters together
  - a way to convert numeric characters into integers
  - a way to sum all the integers

start: string
  - array of all numeric characters
  - empty array to hold numeric strings
  - empty string to add numeric characters to
  - array of all numeric strings
  - array of integers
finish: integer (sum)

ALGORITHM
- create a constant: an array of all numeric characters: NUMERICS
- create an empty array to hold numeric strings: numeric_strings
- create an empty string to hold numeric characters: num_string

- iterate over each character of the input string
  - if current character is numeric
    - add character to num_string
  - if current charact is NOT numeric
    - add num_string to numeric_strings array
      - unless num_string is empty
    - reset num_string to empty

- add num_string to numeric_strings
  - unless num_string is empty

- transform numeric_strings into integers
- return the sum of those integers
=end

# NUMERICS = ('0'..'9').to_a

# def sum_of_numbers(string)
#   numeric_strings = get_numeric_strings(string)
#   integers = numeric_strings.map(&:to_i)
#   integers.sum
# end

# def get_numeric_strings(string)
#   numeric_strings = []
#   num_string = ''

#   string.each_char do |char|
#     if NUMERICS.include?(char)
#       num_string << char
#     else
#       numeric_strings << num_string unless num_string.empty?
#       num_string = ''
#     end
#   end

#   numeric_strings << num_string unless num_string.empty?
#   numeric_strings
# end

# p sum_of_numbers("L12aun3ch Sch3oo451") == 469
# p sum_of_numbers("HE2LL3O W1OR5LD") == 11
# p sum_of_numbers("The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog") == 3635

### TWO
=begin
Create a method that takes an array of integers as an argument. The method should return the minimum sum of 5 consecutive numbers in the array. If the array contains fewer than 5 elements, the method should return nil.

PROBLEM 7:40
input: array
  - elements are integers

- output: integer or nil
  - nil if input array contains fewer than 5 elements
  - otherwise: smallest sum of 5 consecutive elements in array

EXAMPLES

DATA STRUCTURES
needs:
  - way to get all five-element subarrays from input array
    - way to sum subarrays
  - way to return nil if length < 5

start: array
  - array of all possible 5-element subarrays
  - array of sums of those subarrays
  - smallest sum
finish: integer or nil

ALGORITHM
- return `nil` if input array length < 5
- get all possible 5-element subarrays
  - start at index 0, up to array length - 5
  - length is always 5
- transform into an array of sums
- return smallest sum
=end

# def minimum_sum(numbers)
#   subarrays = get_subarrays(numbers)
#   sums = subarrays.map(&:sum)
#   sums.min
# end

# def get_subarrays(array)
#   last_index = array.size - 5
#   (0..last_index).map do |start_index|
#     array[start_index, 5]
#   end
# end

# p minimum_sum([1, 2, 3, 4]) == nil
# p minimum_sum([1, 2, 3, 4, 5, -5]) == 9
# p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
# p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
# p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

### ONE
=begin
Create a method that takes an array of numbers as an argument. For each number, determine how many numbers in the array are smaller than it, and place the answer in an array. Return the resulting array.

When counting numbers, only count unique values. That is, if a number occurs multiple times in the array, it should only be counted once.

PROBLEM 7:16
input: array
  - elements are numbers

output: array
  - each element is based on:
    - how many unique number in input array are smaller than
      - the number at that position in the input array
    - can be 0
  - only consider unique values
    - if a number occurs multiple times in input array
      - only count it once in terms of how many numbers are smaller than
        - current number under consideration
  - same size as input array

EXAMPLES

DATA STRUCTURES
needs:
  - way to count how many unique array numbers are smaller than current number
  - way to consider only unique values when counting

start: array
  - array of unique values
  - transformed input array
finish: array

[8, 1, 2, 2, 3] # input
[8, 1, 2, 3]    # uniques


ALGORITHM
- create an array containing only unique numbers from input array: `uniques`
- for each number in input array
  - count how many numbers in `uniques` are smaller
  - transform number into that count
- return the transformed array
=end

# def smaller_numbers_than_current(numbers)
#   uniques = numbers.uniq
#   numbers.map do |number|
#     uniques.count { |unique| number > unique }
#   end
# end

# p smaller_numbers_than_current([8, 1, 2, 2, 3]) == [3, 0, 1, 1, 2]
# p smaller_numbers_than_current([7, 7, 7, 7]) == [0, 0, 0, 0]
# p smaller_numbers_than_current([6, 5, 4, 8]) == [2, 1, 0, 3]
# p smaller_numbers_than_current([1]) == [0]

# my_array = [1, 4, 6, 8, 13, 2, 4, 5, 4]
# result   = [0, 2, 4, 5, 6,  1, 2, 3, 2]
# p smaller_numbers_than_current(my_array) == result
