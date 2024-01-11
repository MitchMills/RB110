### MEXICAN WAVE
=begin
MEXICAN WAVE
In this simple Kata your task is to create a function that turns a string into a Mexican Wave. You will be passed a string and you must return that string in an array where an uppercase letter is a person standing up.
Rules
1. The input string will always be lower case but may be empty.
2. If the character in the string is whitespace then pass over it as if it was an empty seat.

5:50
PROBLEM
input: string
  - contains only lowercase alpha characters and spaces
  - may be empty

output: array
  - if input string is empty, return empty array
  - array has same number of elements (strings) as letters in input string (skip spaces)
  - each string in array is the same word(s) as the input string
    - one letter is capitalized
    - first letter of first element, second of second, etc
    - preserve spaces in input string but skip over them

EXAMPLES

DATA STRUCTURES
- input: string
  - array of each word in input string # ['two', 'words']
  -
- output: array
=end

p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
p wave("") == []
p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
p wave(" gap ") == [" Gap ", " gAp ", " gaP "]



### SHERLOCK'S POCKETS
=begin
SHERLOCK'S POCKETS
Sherlock has to find suspects on his latest case. He will use your method, dear Watson. Suspect in this case is a person which has something not allowed in his/her pockets.
Allowed items are defined by array of numbers.
Pockets contents are defined by map entries where key is a person and value is one or few things represented by an array of numbers (can be nil or empty array if empty).
Example:
pockets = {
bob: [1],
tom: [2, 5],
jane: [7]
}
Write a method which helps Sherlock to find suspects. If no suspect is found or there are no pockets (pockets == nil), the method should return nil.

7:05
PROBLEM
input: hash, array
  - hash: people and items in their pockets
    - keys are persons
    - values are arrays
      - arrays contain integers
      - represent items in pockets
        - if a number is not in array of allowed items, person is a suspect
  - array: allowed items
    - contains integers
    - integers represent allowed items

output: array or nil
  - array contains persons who had a non-allowed item in their pocket
    - pocket contains number that is not present in allowed array
  - return nil if no suspects
    - i.e. all items in all pockets are allowed

EXAMPLES

DATA STRUCTURES
- input: hash, array

- output: array

ALGORITHM
- iterate over the values of each key in `pockets` hash
  - if an integer is not present in the `allowed` array
    - add key to a `suspects` array
- return `suspects` array, or nil if `suspects` array is empty
=end

# def find_suspects(pockets, allowed_items)
#   suspects = pockets.each_with_object([]) do |(person, contents), suspects|
#     contents.each do |item|
#       suspects << person unless allowed_items.include?(item)
#     end
#   end
#   suspects.empty? ? nil : suspects.uniq
# end

# def find_suspects(pockets, allowed_items)
# suspects = pockets.each_with_object([]) do |(person, contents), suspects|
#   suspects << person unless contents.all? { |item| allowed_items.include?(item) }
# end
# suspects.empty? ? nil : suspects
# end

# def find_suspects(pockets, allowed_items)
#   suspects = pockets.reject do |person, items|
#     items.all? { |item| allowed_items.include?(item) }
#   end.keys
#   suspects.empty? ? nil : suspects
# end

# pockets = {
# bob: [1],
# tom: [2, 5],
# jane: [7]
# }
# p find_suspects(pockets, [1, 2]) #== [:tom, :jane]
# p find_suspects(pockets, [1, 7, 5, 2]) #== nil
# p find_suspects(pockets, []) #== [:bob, :tom, :jane]
# p find_suspects(pockets, [7]) #== [:bob, :tom]





### ALPHABET POSITION
=begin
ALPHABET POSITION
In this kata you are required to, given a string, replace every letter with its position in the alphabet.
If anything in the text isn't a letter, ignore it and don't return it.
"a" = 1, "b" = 2, etc.
Example
alphabet_position("The sunset sets at twelve o' clock.")
Should return "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11" (as a string)

7:22
PROBLEM
input: string
  - can contain alpha and non-alpha characters, upper and lowercase

output: string
  - each alpha character is replaced by number of its position in the alphabet
    - score is same for upper and lowercase letters: a = 1, A = 1
    - one space between each number (words are not preserved)
  - non-alpha characters are removed

 EXAMPLES

 DATA STRUCTURES
 - input: string
  - array of all alpha characters in order
    - add a non-letter character in first position so that index == position
  - array of individual characters in downcased input string
  - array of only alpha characters
 - output: new string

 ALGORITHM
 - create an array of the alphabet, add a 0 in the first position
 - replace letters with appropriate numbers in input string
  - downcase the string
  - create an array of individual characters
  - remove all non-alpha characters
    - if a character isn't included in the alphabet array, remove it
  - transform each character into a number using the alphabet array
  - join the numbers back together with a space in between each number
=end

# ALPHABET = ('a'..'z').to_a.prepend(0)

# def alphabet_position(string)
#   chars = string.downcase.chars
#   letters = chars.select { |char| ALPHABET.include?(char) }
#   letters.map { |letter| ALPHABET.index(letter) }.join(' ')
# end

# p alphabet_position('a1a2a BBB.')
# p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"
# p alphabet_position("-.-'") == ""





### HIGHEST SCORING WORD
=begin
HIGHEST SCORING WORD
Given a string of words, you need to find the highest scoring word. Each letter of a word scores points according to its position in the alphabet: a = 1, b = 2, c = 3 etc. You need to return the highest scoring word as a string. If two words score the same, return the word that appears earliest in the original string. All letters will be lowercase and all inputs will be valid.

7:01
PROBLEM
input: string
  - contains words
    - a word is a contiguous string of letters separated by whitespace
  - contains only alpha characters
    - all lowercase

output: string
  - highest scoring word
    - score is determined by letters in word
      - a = 1, b = 2, etc
    - if tie, return earliest word in input string

EXAMPLES

DATA STRUCTURES
input: string
  - array of alphabetic characters in order to use for scoring
    - add a 0 to the beginning so that index of a = 1, etc # [0, 'a', 'b', . . .]
  - array of each word in input string # ['man', 'i', 'need', . . .]
  - array of each character in each word ['m', 'a', 'n' . . .]
  - array of each character converted to its score [13, 1, 14]
  - array of sums: index of highest sum can be used to access original word?
  - maybe: hash with words as keys and scores as values?
output: string

ALGORITHM
- create an array of the alphabet in order, add a 0 in the first position
- separate input string into array of individual words
- iterate over words array
  - get score for each word
    - iterate over each letter in word
    - transform each letter into index of that letter from alphabet array
    - get sum of all indexes
- create a hash
  - keys are words
  - values are scores
- sort hash, first by scores (descending), then by place in original string
- return first key in sorted hash
=end

# ALPHABET = ('a'..'z').to_a.prepend(0)

# def high(string)
#   words = string.split
#   scores = {}

#   words.each_with_index do |word, index|
#     scores[index] = get_score(word)
#   end

#   winner_index = scores.sort do |(index1, score1), (index2, score2)|
#     [score2, index1] <=> [score1, index2]
#   end.to_h.keys.first

#   words[winner_index]
# end

###
# def high(string)
#   words = string.split
#   scores = get_scores(words)
#   winner_index = get_winner_index(scores)
#   words[winner_index]
# end

# def get_scores(words)
#   words.each_with_index.with_object({}) do |(word, index), scores|
#     scores[index] = get_score(word)
#   end
# end

# def get_score(word)
#   word.chars.map { |char| ALPHABET.index(char) }.sum
# end

# def get_winner_index(scores)
#   scores.sort do |(index1, score1), (index2, score2)|
#     [score2, index1] <=> [score1, index2]
#   end.to_h.keys.first
# end

# p high('man i need a taxi up to ubud') == 'taxi'
# p high('what time are we climbing up the volcano') == 'volcano'
# p high('take me to semynak') == 'semynak'
# p high('aaa b') == 'aaa'
# p high('aaa b c ba')
# p high('c b aaa ab')
# p high('z ya xb wc vd ue tf sg rh qi pj ok nl mm ln ko jp iq hr gs ft eu dv cw bx ay')





### ANAGRAM DETECTION
=begin
ANAGRAM DETECTION
An anagram is the result of rearranging the letters of a word to produce a new word.
Note: anagrams are case insensitive
Complete the function to return true if the two arguments given are anagrams of each other; return false otherwise.
Examples
"foefet" is an anagram of "toffee"
"Buckethead" is an anagram of "DeathCubeK"

7:41
PROBLEM
input: two strings
  - contain upper and lowercase letters

output: boolean
  - true if input strings are anagrams of each other, false otherwise
  - anagram means all the same letters in same amounts as each other
    - case insensitive

EXAMPLES

DATA STRUCTURES
- input: strings
  - array of individual characters in each string
    - downcased
    - sorted
    - compared
- output: boolean

ALGORITHM
- get individual characters from each string
  - create two arrays
- downcase and sort characters
- compare them
  - return true if they are equal, false otherwise
=end

# def is_anagram?(string1, string2)
#   letters1 = string1.downcase.chars.sort
#   letters2 = string2.downcase.chars.sort
#   letters1 == letters2
# end

# p is_anagram?('Creative', 'Reactive') == true
# p is_anagram?("foefet", "toffee") == true
# p is_anagram?("Buckethead", "DeathCubeK") == true
# p is_anagram?("Twoo", "WooT") == true
# p is_anagram?("dumble", "bumble") == false
# p is_anagram?("ound", "round") == false
# p is_anagram?("apple", "pale") == false




### ANAGRAM DIFFERENCE
=begin
ANAGRAM DIFFERENCE
Given two words, how many letters do you have to remove from them to make them anagrams?
Example
First word : c od e w ar s (4 letters removed)
Second word : ha c k er r a nk (6 letters removed)
Result : 10
Hints
A word is an anagram of another word if they have the same letters (usually in a different order). Do not worry about case. All inputs will be lowercase.

6:56
PROBLEM
input: two strings
  - can be empty
  - if not empty, contains only lowercase alpha characters

output: integer
  - number of letters that must be removed from either or both strings to make them anagrams
  - anagram:
    - same letters (type and count)
    - can be in same or different order
  - two empty strings are considered anagrams of each other
  - if two strings contain no letters in common, all letters must be removed

EXAMPLES

DATA STRUCTURES
input: two strings
  - array of each character in shorter string # %w(c o d e w a r s)
  - array with characters that don't appear in longer string removed #  %w(c e a r)
  - differences in lengths # 8 - 4 = 4; 10 - 4 = 6
output: integer (sum of length differences)

ALGORITHM
- determine which input string is shorter
  - sort by length
  - if same length, use first string
- remove non-common characters from shorter string
  - iterate over array of characters in shorter string
    - select only characters that are included in longer string
- get number of common characters in shorter string
- get differences
  - each string's length - number of common characters
- add differences and return that number
=end

# def anagram_difference(string1, string2)
#   shorter, longer = find_shorter_string(string1, string2)
#   common_characters = find_common_characters(shorter, longer)
#   removed = common_characters.size * 2
#   (string1+ string2).size - removed
# end

# def find_shorter_string(string1, string2)
#   [string1, string2].sort_by(&:size)
# end

# def find_common_characters(shorter, longer)
#   shorter.chars.select { |char| longer.include?(char) }
# end

# p anagram_difference('', '') == 0
# p anagram_difference('a', '') == 1
# p anagram_difference('ab', 'a') == 1
# p anagram_difference('ab', 'ba') == 0
# p anagram_difference('ab', 'cd') == 4
# p anagram_difference('aab', 'a') == 2
# p anagram_difference('codewars', 'hackerrank') == 10




### STRING PAIRS
=begin
STRING PAIRS
Complete the solution so that it splits the string into pairs of two characters. If the string contains an odd number of characters then it should replace the missing second character of the final pair with an underscore ('_').

2:20
PROBLEM
input: string
  - can be empty
output: array
  - if input string is empty, return empty array
  - contains strings
    - each string contains two characters from input string
      - strings are in order of input string
      - if input string length is odd, last pair will end with an underscore
    - array length is (input string length + 1)/ 2

EXAMPLES

DATA STRUCTURES
- input: string
  - empty array to contain pairs
  - range from 0 up to string length # 'abc' => (0..2)
- output: array

ALGORITHM
- get pairs
  - get substrings
    - start at every other index, starting at first index
      - start at index 0, then index 2 . . .
      - length is always 2
    - if substring is only one character, add underscore
   - add each substring to empty array
   - return the array
=end

# def solution(string)
#   indexes = (0...string.size).step(2).to_a
#   p indexes
#   indexes.map do |index|
#     pair = string[index, 2]
#     pair.size < 2 ? pair + '_' : pair
#   end
# end

# def solution(string)
#   index = 0
#   pairs = []
#   return [] if string.size == 0
#   loop do
#     pairs << string[index, 2]
#     index += 2
#     break if index >= string.size
#   end
#   pairs[-1] += '_' if pairs[-1].size < 2
#   pairs
# end

# p solution('abc') == ['ab', 'c_']
# p solution('abcdef') #== ['ab', 'cd', 'ef']
# p solution("abcdefg") == ["ab", "cd", "ef", "g_"]
# p solution("") #== []




### ANAGRAMS LIST
=begin
ANAGRAMS LIST
What is an anagram? Well, two words are anagrams of each other if they both contain the same letters. For example:
'abba' & 'baab' == true
'abba' & 'bbaa' == true
'abba' & 'abbba' == false
'abba' & 'abca' == false
Write a function that will find all the anagrams of a word from a list. You will be given two inputs a word and an array with words. You should return an array of all the anagrams or an empty array if there are none.

4:12
PROBLEM
input: string, array
  - string is a single word
  - array is a list of words
output: array
  - list of words from input array that are anagrams of input string
    - anagrams: both words contain all and only the same letters in same amounts (can be the same word)
    - case sensitive? decision: yes
  - return empty array if input array contains no anagrams of input string

EXAMPLES

DATA STRUCTURES
- input: string, array
  - string and array words split into individual characters and sorted
- output: array

ALGORITHM
- iterate over input array
  - select elements that are anagrams of input string
    - separate into individual characters and then sort in order to compare
=end

# def anagrams(target, words)
#   words.select { |word| word.chars.sort == target.chars.sort }
# end

# p anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) == ['aabb', 'bbaa']
# p anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) == ['carer', 'racer']
# p anagrams('laser', ['lazing', 'lazy', 'lacer']) == []



### EXPONENTS
=begin
EXPONENTS
Create a method called "power" that takes two integers and returns the value of the first argument raised to the power of the second. Return nil if the second argument is negative.

Note: The ** operator has been disabled.


PROBLEM
input: two integers
  - can be positive or negative or 0

outuput: integer or nil
  - if second input integer is negative, return nil
  - otherwise return value of first integer raised to power of second
  - if second integer is 0, return value should be 1
  - if first integer is negative, return value will be negative if second integer is odd, positive if even

EXAMPLES

DATA STRUCTURES
- input: two integers
  - guard clause(s)?: if second integer is negative or 0
  - array containing first integer the number of times of second integer
- output: integer

ALGORITHM
- return nil if second integer is less than 0
- return 1 if second integer is 0
- create an array
  - size is second integer
  - each element is first integer
- multiply all elements in array
- return the product
=end

# def power(num1, num2)
#   return nil if num2 < 0
#   Array.new(num2, num1).inject(:*) || 1
# end

# def power(num1, num2)
#   return nil if num2 < 0
#   result = 1
#   num2.times { result *= num1 }
#   result
# end

# p power(2, 3) == 8
# p power(10, 0) == 1
# p power(-5, 3) == -125
# p power(-4, 2) == 16
# p power(3, 2) == 9
# p power(-5, 3) == -125
# p power(-4, 2) == 16
# p power(8, -2) == nil



### MEAN SQUARE ERROR
=begin
Complete the function that accepts two integer arrays of equal length compares the value each member in one array to the corresponding member in the other squares the absolute value difference between those two values and returns the average of those squared absolute value difference between each member pair.
Examples
[1, 2, 3], [4, 5, 6] --> 9 because (9 + 9 + 9) / 3
[10, 20, 10, 2], [10, 25, 5, -2] --> 16.5 because (0 + 25 + 25 + 16) / 4
[-1, 0], [0, -1] --> 1 because (1 + 1) / 2

8:25
PROBLEM
input: two arrays
  - equal length to each other
  - contain only integers

output: float
  - each integer in first array is compared to corresponding integer in second array
    - get absolute value difference between them
    - square that number
  - squares are added up and divided by length of arrays (float division)

EXAMPLES

DATA STRUCTURES
- input: two arrays
  - array of squares
- output: float

ALGORITHM
- get differences between each pair of corresponding numbers
- square those numbers
- divide by length of arrays
- return that number
=end

# def solution(array1, array2)
#   squares = (0...array1.size).map do |index|
#     (array1[index] - array2[index]).abs**2
#   end
#   (squares.sum).to_f / array1.size
# end

# p solution([1, 2, 3], [4, 5, 6]) == 9
# p solution([10, 20, 10, 2], [10, 25, 5, -2]) == 16.5
# p solution([-1, 0], [0, -1]) == 1



### PETE THE BAKER
=begin
Pete likes to bake some cakes. He has some recipes and ingredients. Unfortunately he is not good in maths. Can you help him to find out, how many cakes he could bake considering his recipes? Write a function cakes(), which takes the recipe (object) and the available ingredients (also an object) and returns the maximum number of cakes Pete can bake (integer). For simplicity there are no units for the amounts (e.g. 1 lb of flour or 200 g of sugar are simply 1 or 200). Ingredients that are not present in the objects, can be considered as 0.
Examples:ß
// must return 2
cakes({flour: 500, sugar: 200, eggs: 1}, {flour: 1200, sugar: 1200, eggs: 5, milk: 200});
// must return 0
cakes({apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100}, {sugar: 500, flour: 2000, milk: 2000});

8:27
PROBLEM
input: two hashes
  - first hash is recipe
  - second hash is available ingredients
  - keys are ingredients, values are amounts
  - hash can be empty
output: integer
  - maximum number of times recipe can be made given available ingredients
  - no units
  - if an ingredient is not present in a hash, its amount is 0

EXAMPLES

DATA STRUCTURES
- input: hashes
  - array of integers: divide available ingredients by recipe ingredients (integer division)
  - output integer is smallest number from array
- output: integer
=end

# def cakes(recipe, stock)
#   results = []
#   recipe.each do |ingredient, amount|
#     result = stock[ingredient] ? stock[ingredient] / amount : 0
#     results << result
#   end
#   results.min
# end

# def cakes(recipe, stock)
#   recipe.map do |ingredient, amount|
#     stock[ingredient] ? stock[ingredient] / amount : 0
#   end.min
# end

# p cakes({"flour"=>500, "sugar"=>200, "eggs"=>1},
# {"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200}) == 2
# p cakes({"cream"=>200, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},
# {"sugar"=>1700, "flour"=>20000, "milk"=>20000, "oil"=>30000, "cream"=>5000}) == 11
# p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},
# {"sugar"=>500, "flour"=>2000, "milk"=>2000}) == 0
# p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},
# {"sugar"=>500, "flour"=>2000, "milk"=>2000, "apples"=>15, "oil"=>20}) == 0
# p cakes({"eggs"=>4, "flour"=>400},{}) == 0
# p cakes({"cream"=>1, "flour"=>3, "sugar"=>1, "milk"=>1, "oil"=>1, "eggs"=>1},
# {"sugar"=>1, "eggs"=>1, "flour"=>3, "cream"=>1, "oil"=>1, "milk"=>1}) == 1





### LONGEST SUBSTRING
=begin
LONGEST SUBSTRING
Find the longest substring in alphabetical order. The input will only consist of lowercase characters and will be at least one letter long. If there are multiple solutions, return the one that appears first.

7:41
PROBLEM
input: string
  - contains only lowercase letter characters
  - at least 1 character in length

outuput: string
  - longest substring from input string that is in alphabetical order
  - if multiple substrings, return one that occurs first
  - substring can be entire input string
  - will be at least 1 character in length
  - repetitions of the same letter count

EXAMPLES

DATA STRUCTURES
- input: string
  - array of all possible substrings
    - starting at each index: 0 up to (string length - 1)
    - all possible sizes from that index (string length - current index)
  - array of only alphabetical substrings
    - select those that remain the same when sorted
  - first longest string
- output: string

ALGORITHM
- get all possible substrings
  - iterate over input string
    - start at index 0, up to last index (string length - 1)
      - start at length 1, up to maximum length from that index (sting length - current index)
- get only alphabetical substrings
  - select substrings that are the same after begin sorted alphabetically
- get first longest alphabetical substring
  - find the length of longest substring(s)
  - find the first occurence of a substring of that length
- return that substring
=end


# def longest(string)
#   substrings = get_all_substrings(string)
#   alpha_substrings = get_alpha_substrings(substrings)
#   max_length = get_max_length(alpha_substrings)
#   get_first_longest(alpha_substrings, max_length)
# end

# def get_first_longest(substrings, longest)
#   substrings.each do |substring|
#     return substring if substring.size == longest
#   end
# end

# def get_max_length(array)
#   array.sort_by { |string| string.size }.last.size
# end

# def get_alpha_substrings(substrings)
#   substrings.select do |substring|
#     substring.chars.sort == substring.chars
#   end.uniq
# end

# def get_all_substrings(string)
#   substrings = []
#   max_index = string.size - 1
#   (0..max_index).each do |current_index|
#     max_length = string.size - current_index
#     (1..max_length).each do |current_length|
#       substrings << string[current_index, current_length]
#     end
#   end
#   substrings
# end

# p longest('asd') == 'as'
# p longest('nab') == 'ab'
# p longest('abcdeapbcdef') == 'abcde'
# p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
# p longest('asdfbyfgiklag') =='fgikl'
# p longest('z') == 'z'
# p longest('zyba') == 'z'




### SCRAMBLIES
=begin
SCRAMBLIES
Complete the function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise returns false.
Notes: Only lower case letters will be used (a-z). No punctuation or digits will be included.

8:02
PROBLEM
input: two strings
  - contain only lowercase letters
    - no punctuation or digits

output: boolean
  - true if second string can be created from (some) characters in second string
  - false otherwise

EXAMPLES

DATA STRUCTURES
input: two strings
  - array of each character in second string
output: boolean

ALGORITHM
- remove characters from first string that don't occur in second string
- sort both strings
- create hashes with count of each character in each string
- compare the two hashes
  - if first string hash has same or greater counts as second string hash, return true
=end

# def scramble(string1, string2)
#   letters = string1.chars.select { |char| string2.include?(char) }
#   hash1 = letters.sort.tally
#   hash2 = string2.chars.sort.tally

#   return false unless hash2.keys.all? { |key| hash1.include?(key) }
#   hash1.all? { |letter, count| hash1[letter] >= hash2[letter] }
# end

# p scramble('rkqodlw', 'world') == true
# p scramble('cedewaraaossoqqyt', 'codewars') == true
# p scramble('katas', 'steak') == false
# p scramble('scriptjava', 'javascript') == true
# p scramble('scriptjave', 'javascript') == false
# p scramble('scriptingjava', 'javascript') == true




### FIND THE MINE
=begin
FIND THE MINE
You've just discovered a square (NxN) field and you notice a warning sign. The sign states that there's a single bomb in the 2D grid-like field in front of you.

Write a function that accepts a 2D array, and returns the location of the mine. The mine is represented as the integer 1 in the 2D array. Areas in the 2D array that are not the mine will be represented as 0s. The location returned should be an array (Tuple<int, int> in C#) where the first element is the row index, and the second element is the column index of the bomb location (both should be 0 based). All 2D arrays passed into your function will be square (NxN), and there will only be one mine in the array.

7:05
PROBLEM
input: nested array
  - square: outer array has same number of elements as each inner array
  - each inner array contains 0s and maybe a 1
    - only a single 1 is in one of the inner arrays
    - all other inner array elements are 0s

output: array
  - first element is which inner array contains the 1
  - second element is which element of that inner array is the 1

EXAMPLES

DATA STRUCTURES
input: nested array

output: array

ALGORITHM
- find which inner array contains the 1
  - iterate over each element in the outer array
    - get the index of the element that includes a 1
- find which element of that inner array contains the 1
  - iterate over each element in the inner array
    - get the index of the 1
- return the index of each in an array
=end

# def mine_location(outer_array)
#   outer_index = find_index(outer_array)
#   inner_index = find_index(outer_array[outer_index])
#   [outer_index, inner_index]
# end

# def find_index(array)
#   array.each_with_index do |element, index|
#     return index if [element].flatten.include?(1)
#   end
# end
###

# def mine_location(outer_array)
#   last_index = outer_array.size - 1
#   (0..last_index).each do |outer_index|
#     (0..last_index).each do |inner_index|
#       current_number = outer_array[outer_index][inner_index]
#       return [outer_index, inner_index] if current_number == 1
#     end
#   end
# end
###

# def mine_location(outer_array)
#   outer_array.each_with_index do |inner_array, outer_index|
#     inner_array.each_with_index do |number, inner_index|
#       return [outer_index, inner_index] if number == 1
#     end
#   end
# end

# p mine_location( [ [1, 0, 0], [0, 0, 0], [0, 0, 0] ] ) == [0, 0]
# p mine_location( [ [0, 0, 0], [0, 1, 0], [0, 0, 0] ] ) == [1, 1]
# p mine_location( [ [0, 0, 0], [0, 0, 0], [0, 1, 0] ] ) == [2, 1]
# p mine_location([ [1, 0], [0, 0] ]) == [0, 0]
# p mine_location([ [1, 0, 0], [0, 0, 0], [0, 0, 0] ]) == [0, 0]
# p mine_location([ [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0] ]) == [2, 2]



### OCCURRENCES
=begin
OCCURRENCES
Write a method that takes a string as an argument and groups the number of times each character appears in the string as a hash sorted by the highest number of occurrences.

The characters should be sorted alphabetically e.g:
get_char_count("cba") => {1=>["a", "b", "c"]}

You should ignore spaces, special characters and count uppercase letters as lowercase ones.

9:01
PROBLEM
input: string
  - contains upper and lowercase letters
  - can contain spaces and non-letter characters

output: hash
  - keys are integers
    - number of times the characters in the values array occur
    - sorted from highest to lowest
  - values are arrays
    - each array contains the characters that occur that number of times
      - each element is a single-character string
      - elements should be in alphabetical order
      - uppercase letters are counted as lowercase
      - numbers come before letters
      - ignore spaces and non-alphanumeric characters

EXAMPLES

DATA STRUCTURES
- input: string
  - array of downcased individual characters from string
  - array of only the alpha-numeric characters from that array
    - create an array of all alpha and numeric characters to use for selection
  - separate arrays of characters with the same count
- output: hash

ALGORITHM
- downcase string and separate into an array of individual characters
- select only the characters that are alpha or numeric
- create a hash with the count of each character as keys, characters with that count as values in an array
  - iterate over the array of characters
    - if the count of a character already exists as a key
      - add that character to the array
    - else create a key value pair for that count and character
  - sort each array alphabetically
- sort the hash by keys
- return the hash
=end

# ALPHANUMERICS = ('0'..'9').to_a + ('a'..'z').to_a

# def get_char_count(string)
#   characters = string.downcase.chars
#   letters = characters.select { |char| ALPHANUMERICS.include?(char) }

#   counts = {}
#   letters.each do |letter|
#     count = letters.count(letter)
#     if counts[count]
#       counts[count] << letter unless counts[count].include?(letter)
#     else
#       counts[count] = [letter]
#     end
#   end
#   sorted_values = counts.each_value { |value| value.sort! }
#   sorted_values.sort { |a, b| b <=> a }.to_h
# end
###

# def get_char_count(string)
#   characters = string.downcase.chars
#   letters = characters.select { |char| ALPHANUMERICS.include?(char) }
#   uniques = letters.uniq

#   counts = {}
#   uniques.each do |letter|
#     count = letters.count(letter)
#     counts[count] ? counts[count] << letter : counts[count] = [letter]
#   end
#   sorted_values = counts.each_value { |value| value.sort! }
#   sorted_values.sort { |a, b| b <=> a }.to_h
# end
###

# p get_char_count("Mississippi") == {4=>["i", "s"], 2=>["p"], 1=>["m"]}
# p get_char_count("Hello. Hello? HELLO!!") == {6=>["l"], 3=>["e", "h", "o"]}
# p get_char_count("aaa...bb...c!") == {3=>["a"], 2=>["b"], 1=>["c"]}
# p get_char_count("aaabbbccc") == {3=>["a", "b", "c"]}
# p get_char_count("abc123") == {1=>["1", "2", "3", "a", "b", "c"]}




### TITLE CASE
=begin
TITLE CASE
A string is considered to be in title case if each word in the string is either (a) capitalised (that is, only the first letter of the word is in upper case) or (b) considered to be an exception and put entirely into lower case unless it is the first word, which is always capitalised.

Write a function that will convert a string into title case, given an optional list of exceptions (minor words). The list of minor words will be given as a string with each word separated by a space. Your function should ignore the case of the minor words string -- it should behave in the same way even if the case of the minor word string is changed.

8:36
PROBLEM
input: one or two strings
  - first string: to be converted
  - second string (optional): exception words
    - both contain words separated by spaces
    - both may contain mix of upper and lowercase letters

output: string
  - same words as first input string, but in title case
  - title case:
    - every word has first letter uppercase and rest of word lowercase
    - UNLESS: word is in exception list AND is not first word
      - then all lowercase
  - if no exception list, put every word in title case

EXAMPLES

DATA STRUCTURES
- input: two strings
  - array of each word: ['a', 'clash', 'of', 'KINGS']
  - transformed array: ['A', 'Clash', 'of', 'Kings']
- output: string

ALGORITHM
- get an array of individual words from each input string
  - if no second input string, create an empty array (default parameter)
- transform each word in first array
  - put first word in title case
  - iterate over the rest of the words:
    - if word is included in second array, downcase
    - else title case
- join first array into a string
- return the string
=end

# def title_case(title, exceptions = '')
#   words = title.split.map(&:capitalize)
#   minor_words = exceptions.split.map(&:capitalize)
#   words.map! do |word|
#     minor_words.include?(word) ? word.downcase : word
#   end
#   words[0].capitalize!
#   words.join(' ')
# end

# p title_case('a clash of KINGS', 'a an the of') == 'A Clash of Kings'
# p title_case('THE WIND IN THE WILLOWS', 'The In') == 'The Wind in the Willows'
# p title_case('the quick brown fox') == 'The Quick Brown Fox'




### PERSISTANCE
=begin
PERSISTANCE
Write a function, persistence, that takes in a positive parameter num and returns its multiplicative persistence, which is the number of times you must multiply the digits in num until you reach a single digit.
For example:
persistence(39) # returns 3, because 3*9=27, 2*7=14, 1*4=4 # and 4 has only one digit
persistence(999) # returns 4, because 9*9*9=729, 7*2*9=126, # 1*2*6=12, and finally 1*2=2
persistence(4) # returns 0, because 4 is already a one-digit number

7:17
PROBLEM
input: integer
  - positive

output: integer
  - represents number of times to multiply individual digits with each other to reach a single digit number as the product
  - return 0 if input integer is already a single digit number

EXAMPLES

DATA STRUCTURES
input: integer
  - counter to keep track of number of multiplications
  - array of individual integers
  - product of that array
  - size of array
outuput: integer
  - counter

ALGORITHM
- set a counter to 0
- set current_num to input integer
- get the product of individual digits
  - separate current_num into an array of individual digits
  - if size = 1, return counter
  - else get product
  - set current_num to equal product
  - increment counter by 1
  - repeat
- return counter
=end

# def persistence(number)
#   counter = 0
#   current_num = number

#   loop do
#     digits = current_num.digits
#     break if digits.size == 1
#     product = digits.inject(:*)
#     current_num = product
#     counter += 1
#   end
#   counter
# end

# p persistence(39) == 3
# p persistence(4) == 0
# p persistence(25) == 2
# p persistence(999) == 4





### EXPANDED NUMBERS
=begin
EXPANDED NUMBER
You will be given a number and you will need to return it as a string in Expanded Form.

For example:
expanded_form(12); # Should return '10 + 2'
expanded_form(42); # Should return '40 + 2'
expanded_form(70304); # Should return '70000 + 300 + 4'

NOTE: All numbers will be whole numbers greater than 0.

2:56
PROBLEM
input: integer
  - whole number
  - greater than 0 / positive

output: string
  - set of numbers that added together equal input integer
    - 1s place, 10s place, etc
    - in order from largest place to smallest place

EXAMPLES

DATA STRUCTURES
input: integer # 70304
  - integer converted to array of individual digits # [7, 0 ,3, 0, 4]
  - transform
    - digit * 10**(length - index - 1) [70000, 0, 300, 0, 4]
  - select elements greater than 0, convert to string # [70000, 300, 4]
outuput: string

ALGORITHM
- convert input integer into an array of digits
- transform the array into component numbers
  - digit * 10**(length - index - 1)
- select elements greater than 0
- convert into a string joined by '+'
=end

# def expanded_form(integer)
#   digits = integer.digits.reverse
#   expanded = digits.map.with_index do |digit, index|
#     digit * 10**(digits.size - index - 1)
#   end
#   expanded.select { |element| element > 0 }.join(' + ')
# end

# def expanded_form(integer)
#   digits = integer.digits
#   expanded = digits.map.with_index do |digit, index|
#     digit * 10**index
#   end.reverse
#   expanded.select { |element| element > 0 }.join(' + ')
# end

# p expanded_form(12) #== '10 + 2'
# p expanded_form(42) #== '40 + 2'
# p expanded_form(70304) #== '70000 + 300 + 4'




### SPIN WORDS
=begin
SPIN WORDS
Write a method that takes in a string of one or more words, and returns the same string, but with all five or more letter words reversed (Just like the name of this Kata). Strings passed in will consist of only letters and spaces. Spaces will be included only when more than one word is present.

Examples: spinWords( "Hey fellow warriors" ) => returns "Hey wollef sroirraw"

p spinWords("Hey fellow warriors") == "Hey wollef sroirraw"
p spinWords("This is a test") == "This is a test"
p spinWords("This is another test") == "This is rehtona test"
P spinWords(‘test’) == ‘test’

9:13
PROBLEM
input: string
  - contains one or more words
  - contains only letters and spaces
    - no puncuation, special characters, etc
  - spaces only occur between words

output: string
  - same characters as input string
  - words with more than 4 characters should have characters reversed
  - words stay in same place as in input string, regardless of whether they are reversed
  - maintain case

EXAMPLES

DATA STRUCTURES
- input: string
  - array of individual words
  - transformed array: eligible words are reversed
- outuput: string

ALGORITHM
- separate input string into an array of individual words
- transform this array
  - if word length is >= 5, reverse
  - else, leave as is
- join transformed array into a string
- return the string
=end

# def spin_words(string)
#   words = string.split
#   words.map do |word|
#     word.size > 4 ? word.reverse : word
#   end.join(' ')
# end

# p spin_words("Hey fellow warriors") == "Hey wollef sroirraw"
# p spin_words("This is a test") == "This is a test"
# p spin_words("This is another test") == "This is rehtona test"
# p spin_words("test") == "test"




### TEN MINUTE WALK
=begin
You live in the city of Cartesia where all roads are laid out in a perfect grid. You arrived ten minutes too early to an appointment, so you decided to take the opportunity to go for a short walk. The city provides its citizens with a Walk Generating App on their phones -- everytime you press the button it sends you an array of one-letter strings representing directions to walk (eg. ['n', 's', 'w', 'e']). You always walk only a single block in a direction and you know it takes you one minute to traverse one city block, so create a function that will return true if the walk the app gives you will take you exactly ten minutes (you don't want to be early or late!) and will, of course, return you to your starting point.

Return false otherwise.

Note: you will always receive a valid array containing a random assortment of direction letters ('n', 's', 'e', or 'w' only). It will never give you an empty array (that's not a walk, that's standing still!).

p is_valid_walk(['n','s','n','s','n','s','n','s','n','s']) == true
p is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e']) == false
p is_valid_walk(['w']) == false
p is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == false

7:10
PROBLEM
input: array
  - contains one or more one character strings
  - each string contains one of four letters: n s e w
  - represents a 'walk'
    - each letter counts as a one minute walk in that direction

output: boolean
  - true if:
    - there are exactly ten elements in the input array
    - there are a balanced set of n,s and e,w pairs
      - i.e. number of n = number of s, nubmer of e = number of w
  - false otherwise

DATA STRUCTURES
- input: array
  - count of elements in input array
  - count of each letter in input array:
    - hash: keys are letters, values are counts
- output: boolean

ALGORITHM
- count the number of elements in the input array
  - return false unless size == 10
- count the number of occurences of each letter in input array
  - return false unless n == s && e == w
=end

# def valid_walk?(directions)
#   counts = directions.tally
#   counts.values.sum == 10 &&
#   counts['n'] == counts['s'] &&
#   counts['e'] == counts['w']
# end

# p valid_walk?(['n','s','n','s','n','s','n','s','n','s']) == true
# p valid_walk?(['w','e','w','e','w','e','w','e','w','e','w','e']) == false
# p valid_walk?(['w']) == false
# p valid_walk?(['n','n','n','s','n','s','n','s','n','s']) == false



### DUBSTEP
=begin
DUBSTEP
Polycarpus works as a DJ in the best Berland nightclub, and he often uses dubstep music in his performance. Recently, he has decided to take a couple of old songs and make dubstep remixes from them.

Let's assume that a song consists of some number of words (that don't contain WUB). To make the dubstep remix of this song, Polycarpus inserts a certain number of words "WUB" before the first word of the song (the number may be zero), after the last word (the number may be zero), and between words (at least one between any pair of neighbouring words), and then the boy glues together all the words, including "WUB", in one string and plays the song at the club.

For example, a song with words "I AM X" can transform into a dubstep remix as "WUBWUBIWUBAMWUBWUBX" and
cannot transform into "WUBWUBIAMWUBX".

Recently, Jonny has heard Polycarpus's new dubstep track, but since he isn't into modern music, he decided to find out what was the initial song that Polycarpus remixed. Help Jonny restore the original song.

Input
The input consists of a single non-empty string, consisting only of uppercase English letters, the string's length doesn't exceed 200 characters

Output
Return the words of the initial song that Polycarpus used to make a dubsteb remix. Separate the words with a space.

Examples
song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB") => WE ARE THE CHAMPIONS MY FRIEND

p song_decoder("A WUB B WUB C") == "A B C"
p song_decoder("A WUBWUBWUB B WUBWUBWUB C") == "A B C"
p song_decoder("WUB A WUB B WUB C WUB") == "A B C"

7:00
PROBLEM
input: string
  - not empty
  - only uppercase alphabetic characters
  - max length is 200 characters

output: string
  - represents a song title
  - words separated with spaces
  - all uppercase alphabetic characters
  - interstitial WUBs removed
  - song title does not contain any WUBs
  - at least one WUB between each word
  - can be one or more WUBs at beginning and end of string

EXAMPLES

DATA STRUCTURES
- input: string
  - array of all possible three-character substrings
    - "AWUBBWUBC" [AWU, WUB, UBB, BBW, BWU, WUB, UBC]
    - indexes of beginning of each wub [1, 5]: use to remove three-character slices from input string
- output: string

ALGORITHM
- get all possible three-character substrings from input string
  - start at index 0, up to index (input string length - 3)
  - length is alway 3
- get indexes of each WUB in that array
  - indexes will be start indexes of slices
- use indexes to remove three-character slices from input string
- return string, separated by spaces
=end

# def song_decoder(string)
#   letters = string.split('WUB')
#   letters.select { |letter| letter != '' }.join(' ')
# end

# p song_decoder("AWUBBWUBC") == "A B C"
# p song_decoder("AWUBWUBWUBBWUBWUBWUBC") == "A B C"
# p song_decoder("WUBAWUBBWUBCWUB") == "A B C"
# p song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB") == 'WE ARE THE CHAMPIONS MY FRIEND'




### KEBABIZE
=begin
Modify the kebabize function so that it converts a camel case string into a kebab case.

kebabize('camelsHaveThreeHumps') // camels-have-three-humps
kebabize('camelsHave3Humps') // camels-have-humps

Notes: the returned string should only contain lowercase letters

p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'

8:00
PROBLEM
input: string
  - one word (no spaces)
  - in camel case
    - first subword starts lowercase
    - all other subwords start uppercase
    - all other characters are lowercase (or non-alphabetic)

output: string
  - contains only the alphabetic characters from the first string
    - non-alphabetic characters are removed
  - in kebab case
    - all lowercase
    - a dash between each word

EXAMPLES

DATA STRUCTURES
input: string
  - array of all uppercase alphabetic characters (to determine where to add dashes)
  - array of all alphabetic characters (to filter out non-alphabetic characters)
  - array of characters in input string
    - array of only alphabetic characters # ['m', 'y', 'C', 'a', ...]
    - array of downcased characters with dashes added # ['m', 'y', '-c', 'a', ...]
output: string

ALGORITHM
- create an array of uppercase alphabetic characters
- create an array of all alphabetic characters
- remove non-alphabetic characters from input string
  - convert input string into an array of individual characters
  - select only characters that are included in all alpha array
- add dashes to uppercase characters
  - transform array by prepending a dash to uppercase characters
- downcase all characters
- join array into a string
- return string
=end

# UPPERCASE_ALPHABET = ('A'..'Z').to_a
# ALPHABET = UPPERCASE_ALPHABET + ('a'..'z').to_a

# def kebabize(string)
#   only_alpha = get_only_alpha(string)
#   dashed = add_dashes(only_alpha)
#   dashed.join.downcase
# end

# def get_only_alpha(string)
#   string.chars.select { |char| ALPHABET.include?(char) }
# end

# def add_dashes(array)
#   array.map do |char|
#     UPPERCASE_ALPHABET.include?(char) ? char.prepend('-') : char
#   end
# end

# p kebabize('myCamelCasedString') == 'my-camel-cased-string'
# p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'






### DETECT PANGRAM
=begin
A pangram is a sentence that contains every single letter of the alphabet at least once. For example, the sentence "The quick brown fox jumps over the lazy dog" is a pangram, because it uses the letters A-Z at least once (case is irrelevant).
Given a string, detect whether or not it is a pangram. Return True if it is, False if not. Ignore numbers and punctuation.

p panagram?("The quick brown fox jumps over the lazy dog.") == true
p panagram?("This is not a pangram.") == false

7:47
PROBLEM
input: string

output: boolean
  - true if input string is a pangram, false if not
  - pangram:
    - contains one of every single letter of the alphabet at least once
    - ignore case
    - ignore non-alphabetic characters
    - order is irrelevant

EXAMPLES

DATA STRUCTURES
input: string
  - string of alphabet (lowercase)

output: boolean

ALGORITHM
- create a string that contains alphabetic characters (lowercase)
- iterate over alphabet
  - check if current letter is included in input string
  - return true if all are included, else false
=end

# def pangram?(string)
#   alphabet = ('a'..'z').to_a
#   alphabet.all? { |letter| string.downcase.include?(letter) }
# end

# p pangram?("The quick brown fox jumps over the lazy dog.") == true
# p pangram?("This is not a pangram.") == false






### TOP THREE WORDS
=begin
Top Three Words
Write a function that, given a string of text (possibly with punctuation and line-breaks), returns an array of the top-3 most occurring words, in descending order of the number of occurrences.

Assumptions:
A word is a string of letters (A to Z) optionally containing one or more apostrophes (') in ASCII. (No need to handle fancy punctuation.)
Matches should be case-insensitive, and the words in the result should be lowercased.
Ties may be broken arbitrarily.
If a text contains fewer than three unique words, then either the top-2 or top-1 words should be returned, or an empty array if a text contains no words.

Examples:
top_3_words("In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.")
# => ["a", "of", "on"]

top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e")
# => ["e", "ddd", "aa"]

top_3_words(" //wont won't won't")
# => ["won't", "wont"]

Bonus points (not really, but just for fun):
Avoid creating an array whose memory footprint is roughly as big as the input text.
Avoid sorting the entire array of unique words.

7:13am
PROBLEM / EXAMPLES
input: string
  - can contain punctuation and line breaks

output: array
  - three elements
    - top three most common words in input string
      - descending order (most common, 2nd most common, 3rd most common)
      - all lowercase letters
    - word:
      - string of alphabetic characters
        - may contain one or more apostrophes
        - matches should be case-insensitive ('top' and 'Top' are treated as same word)
    - ties can be broken arbitrarily
    - if fewer than three unique words:
      - return top two, or top one
      - return empty array if no words

DATA STRUCTURES
- input: string
  - array of individual words in string
  - downcased array of words
  - hash of words and occurences: keys are words, values are counts
  - sorted hash
  - top three keys
- output: array

ALGORITHM
- separate input string into an array of individual words
  - eliminate all words that don't contain at least one alphabetic character
    - downcase all words
    - separate each word into an array of individual characters
    - compare against an array of lowercase alphabetic characters
- get count of occurences of each word
  - sort from most common to least common
- get three most common words
- return in an array
=end

# ALPHA_CHARACTERS = ('a'..'z').to_a
# VALID_CHARACTERS = ALPHA_CHARACTERS + ["'"]

# def top_3_words(text)
#   words = get_words(text)
#   counts = get_word_counts(words)
#   get_top_3(counts)
# end

# def get_words(text)
#   all_words = text.split.map(&:downcase)
#   clean_words = all_words.map do |word|
#     word.chars.select { |char| VALID_CHARACTERS.include?(char) }.join
#   end
#   clean_words.select do |word|
#     word.chars.any? { |char| ALPHA_CHARACTERS.include?(char) }
#   end
# end

# def get_word_counts(words)
#   words.tally.sort_by { |word, count| [count, word] }.to_h
# end

# def get_top_3(hash)
#   hash.keys.reverse.take(3)
# end

# p top_3_words("a a a b c c d d d d e e e e e") == ["e", "d", "a"]
# p top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"]
# p top_3_words(" //wont won't won't ") == ["won't", "wont"]
# p top_3_words(" , e .. ") == ["e"]
# p top_3_words(" ... ") == []
# p top_3_words(" ' ") == []
# p top_3_words(" ''' ") == []
# p top_3_words("""In a village of La Mancha, the name of which I have no desire to call to mind, there lived not long since one of those gentlemen that keep a lance in the lance-rack, an old buckler, a lean hack, and a greyhound for coursing. An olla of rather more beef than mutton, a salad on most nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra on Sundays, made away with three-quarters of his income.""") == ["a", "of", "on"]






### TYPOGLYCEMIA GENERATOR
=begin
TYPOGLYCEMIA GENERATOR
Background
There is a message that is circulating via public media that claims a reader can easily read a message where the inner letters of each word are scrambled, as long as the first and last letters remain the same and the word contains all the letters.

Another example shows that it is quite difficult to read the text where all the letters are reversed rather than scrambled.

In this kata we will make a generator that generates text in a similar pattern, but instead of scrambled or reversed, ours will be sorted alphabetically

Requirement
return a string where:
1) the first and last characters remain in original place for each word
2) characters between the first and last characters must be sorted alphabetically
3) punctuation should remain at the same place as it started, for example: shan't -> sahn't

Assumptions
1) words are seperated by single spaces
2) only spaces separate words, special characters do not, for example: tik-tak -> tai-ktk
3) special characters do not take the position of the non special characters, for example: -dcba -> -dbca
4) for this kata puctuation is limited to 4 characters: hyphen(-), apostrophe('), comma(,) and period(.)
5) ignore capitalisation

p scramble_words('professionals') == 'paefilnoorsss'
p scramble_words('i') == 'i'
p scramble_words('') == ''
p scramble_words('me') == 'me'
p scramble_words('you') == 'you'
p scramble_words('card-carrying') == 'caac-dinrrryg'
p scramble_words("shan't") == "sahn't"
p scramble_words('-dcba') == '-dbca'
p scramble_words('dcba.') == 'dbca.'
p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's
nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul
neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."

7:00
PROBLEM / EXAMPLES
input: string
  - contains lowercase alphabetic characters
  - can contain four non-alpha characters: - ' , .
  - can be empty
  - contains "words"
    - words are separated by single spaces
    - non-alpha characters do not separate words: e.g. 'tic-tac' is one word

output: string
  - contains same characters as input string
  - contains same number of 'words' as input string
  - all non-alpha characters remain in place
  - first and last alpha characters remain in place
   - if first or last character is non-alpha, it doesn't count as first alpha character
      - e.g. '-dcba' => '-dbca'
  - alpha characters between first and last positions should be alphabetized
  - if input string contains only one, two, or three alpha characters, return input string
  - if input string is empty, return empty string
  - non-alpha characters do not separate words
    - e.g 'card-carrying' => 'caac-dinrrryg'

DATA STRUCTURES
- input: string # "you've gotta"
  - array of separate words in input string # ["you've", "gotta"]
    - array of each character in each word # %w(y o u ' v e')
      - array of middle characters %w(o u ' v')
    - transformed array of each character # %w(y o u ' v e')
  - array of transformed words # ["you've", "gotta"]
- output: string

ALGORITHM
- separate input string into separate words
- transform each word according to the criteria
  - separate each word into its individual characters

    - select middle characters
      - find index of first and last alpha character
        - take slice of array from (first index + 1) to (last index - 1)
      - store indexes of non-alpha characters
    - sort middle characters alphabetically
      - re-insert non-alpha characters using stored indexes
    - add back starting and ending characters
    - join characters back into string

- join separate words back into string
- return that string

=end

# ALPHABET = ('a'..'z').to_a

# def scramble_words(string)
#   words = string.split
#   # words.map do |word|
#   #   change_word(word)
#   # end
#   # words.join(' ')
# end

# def change_word(string)
#   characters = string.chars
#   middle_characters = get_middle_characters(characters)
#   alphabetized = alphabetize_middle_characters(middle_characters)
# end

# def get_middle_characters(characters)
#   first_index = (1...characters.size).find do |index|
#     ALPHABET.include?(characters[index])
#   end

#   last_index = (1...characters.size).find do |index|
#     ALPHABET.include?(characters[-index])
#   end

#   characters[first_index .. (characters.size - last_index)]
# end

# def alphabetize_middle_characters(array)
#   punctuation = array.each_index.select do |index|
#     %w(- ' , .).include?(array[index])
#   end
#   array.sort

# end

# p alphabetize_middle_characters(%w(a c - ' , . b c))

# p scramble_words('professionals') == 'paefilnoorsss'
# p scramble_words('i') == 'i'
# p scramble_words('') == ''
# p scramble_words('me') == 'me'
# p scramble_words('you') == 'you'
# p scramble_words('card-carrying') #== 'caac-dinrrryg'
# p scramble_words("shan't") == "sahn't"
# p scramble_words('-dcba') == '-dbca'
# p scramble_words('dcba.') == 'dbca.'
# p scramble_words("you've gotta dance") # like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."




### REPEATED SUBSTRING
=begin
Repeated Substring
For a given nonempty string s find a minimum substring t and the maximum number k, such that the entire string s is equal to t repeated k times. The input string consists of lowercase latin letters. Your function should return an array [t, k]

Example #1:
for string s = "ababab"
the answer is ["ab", 3]

Example #2:
for string s = "abcde"
the answer is ["abcde", 1] because for this string "abcde" the minimum substring t, such that s is t repeated k times, is itself.

p repeated_substring("ababab") == ["ab", 3]
p repeated_substring("abcde") == ["abcde", 1]

9:41
PROBLEM / EXAMPLES
input: string
  - contains only lowercase alphabetic characters
  - is not empty

output: array
  - two elements: string and integer
    - string is a substring of input string
      - can be repeated to create the input string
      - smallest substring that will meet the criteria
      - can be the entire input string
    - integer is the number of times substring must be repeated to create input string
      - if substring is the entire input string, integer is 1
      - integer is a multiple of the length of the input string
        - substring length times integer equals input string length

DATA STRUCTURES
input: string
  - array of all possible substrings?
  - array  of all multiples of input string length
    - array of all possible substrings of those lengths
  - array of all substrings that can be repeated to produce input string
  - shortest substring
output: array: [substring, multiple]

ALGORITHM
- get all multiples of the input string length
  - create a range from 2 up to input string length
    - select numbers from range that divide evenly into input string length
    - store in array
- get all possible substrings of those lengths
  - iterate over array of multiples
    - for each multiple, get all possible substrings of that length
      - lengths are multiples
      - starting indexes: from 0 up to max index for that length
        - max index: (string length - current length)
    - store in an array
- select substrings that can repeat to produce input string
  - iterate over array of substrings
    - select those for which substring length x (input string length / substring length) equals the input string
    - store in an array
- get shortest substring
- return array of shortest substring and multiple
  - multiple is (input string length / substring length)
=end

### solution 1
# def repeated_substring(string)
#   multiples = get_multiples(string.size)

#   substrings = get_substrings(string, multiples)
#   repeaters = get_repeaters(string, substrings)

#   smallest = repeaters.min_by { |string| string.size} || string
#   multiple = (string.size / smallest.size)
#   [smallest, multiple]
# end

# def get_multiples(number)
#   max = number / 2
#   (1..max).select do |num|
#     number % num == 0
#   end
# end

# def get_substrings(string, multiples)
#   multiples.each_with_object([]) do |current_length, substrings|
#     max_index = string.size - current_length
#     (0..max_index).each do |start_index|
#       substrings << string[start_index, current_length]
#     end
#   end.uniq
# end

# def get_repeaters(string, substrings)
#   substrings.select do |substring|
#     multiplier = string.size / substring.size
#     substring * multiplier == string
#   end
# end
###

### solution 2
# def repeated_substring(string)
#   substrings = get_substrings(string)
#   counts = substrings.tally
#   repeaters = get_repeaters(string, counts)

#   smallest = repeaters.min_by { |string| string.size} || string
#   multiple = (string.size / smallest.size)
#   [smallest, multiple]
# end

# def get_substrings(string)
#   max_length = string.size / 2
#   (1..max_length).each_with_object([]) do |current_length, substrings|
#     max_index = string.size - current_length
#     (0..max_index).each do |start_index|
#       substrings << string[start_index, current_length]
#     end
#   end
# end

# def get_repeaters(string, counts)
#   counts.keys.select do |substring|
#     substring * counts[substring] == string
#   end
# end
###

# p repeated_substring("ababab") == ["ab", 3]
# p repeated_substring("abcde") == ["abcde", 1]
# p repeated_substring("aaaa") == ["a", 4]




### NTH LETTER
=begin
Complete the function that takes an array of words.
You must concatenate the nth letter from each word to construct a new word which should be returned as a string,
where n is the position of the word in the list.
For example:
["yoda", "best", "has"] --> "yes"
^ ^ ^
n=0 n=1 n=2
Note: Test cases contain valid input only - i.e. a string array or an empty array; and each word will have enough letters.

p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No', 'No']) == 'No'
p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) == 'Codewars

7:08
PROBLEM / EXAMPLES
input: array
  - each element is a "word": string with no spaces
    - can contain non-alphabetic characters, e.g. 'X-ray'
  - can be empty
  - each word has a length of at least index + 1

output: string
  - composed of one letter from each string in the input array concatenated together
    - letter is same index as index of the element in the input array
      - for element at index n, get letter from that element from index n
  - if input array is empty, return an empty string
  - maintain case
  - string has same number of letters as input array has elements

DATA STRUCURES
input: array of strings # ['yoda', 'best', 'has']]
  - array of individual characters in each string # ['y', 'o', 'd', 'a']
  - array of appropriate characters from each string # ['y', 'e', 's']

output: string # 'yes'

ALGORITHM
- get appropriate character from each input string
  - iterate over the indexes of the input array
    - transform each index into the appropriate character
      - use the index of the element to get the character at that index from the element
- join these characters into a new string
- return that string
=end

# def nth_char(words)
#   letters = get_letters(words)
#   letters.join
# end

# def get_letters(words)
#   last_index = words.size - 1
#   (0..last_index).map do |index|
#     words[index][index]
#   end
# end

# p nth_char(['yoda', 'best', 'has']) == 'yes'
# p nth_char([]) == ''
# p nth_char(['X-ray']) == 'X'
# p nth_char(['No', 'No']) == 'No'
# p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) == 'Codewars'





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
p odd_substrings("222") == 0

1:01
PROBLEM / EXAMPLES
input: string
  - contains only integers
  - assumption: no empty input strings

output: integer
  - represents the number of odd substrings that can be created
    - do not need to be unique, i.e. duplicates count towards total
  - substrings can be from size 1 up to size of input string

DATA STRUCTURES
- input: string
  - array of all possible substrings
  - array of substrings that are odd numbers
- output: integer: size of array

ALGORITHM
- get all possible substrings
  - start index: from 0 up to last index (one less than length of input string)
    - length: from 1 up to length that can be created from that starting index
      - 1 up to (input string length - current starting index)
    - put each `string[start_index, length]` into an array
- select substrings that represent odd numbers
  - convert each substring into an integer
  - select only odd integers into an array
- return size of that array
=end

# def odd_substrings(string)
#   all_substrings = get_all_substrings(string)
#   odd_substrings = get_odd_substrings(all_substrings)
#   odd_substrings.size
# end

# def get_all_substrings(string)
#   max_index = string.size - 1
#   (0..max_index).each_with_object([]) do |current_index, substrings|
#     substrings << get_substrings(string, current_index)
#   end.flatten
# end

# def get_substrings(string, current_index)
#   max_length = string.size - current_index
#   (1..max_length).map do |current_length|
#     string[current_index, current_length]
#   end
# end

# def get_odd_substrings(substrings)
#   substrings.select do |substring|
#     substring.to_i.odd?
#   end
# end

# p odd_substrings("1341") == 7
# p odd_substrings("1357") == 10
# p odd_substrings("13471") == 12
# p odd_substrings("134721") == 13
# p odd_substrings("1347231") == 20
# p odd_substrings("13472315") == 28
# p odd_substrings("222") == 0





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
