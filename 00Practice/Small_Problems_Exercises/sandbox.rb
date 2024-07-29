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

def first_and_last_case(string)
  multiples = get_multiples(string)
  indexes = get_indexes(multiples, string)

  string.chars.map.with_index do |char, index|
    indexes.include?(index) ? char.upcase : char
  end.join
end

def get_multiples(string)
  string.chars.uniq.select do |char|
    string.count(char) > 1
  end
end

def get_indexes(multiples, string)
  all_indexes = multiples.map do |letter|
    string.chars.each_index.select do |index|
      string[index] == letter
    end
  end

  all_indexes.map do |indexes|
    [indexes.first, indexes.last]
  end.flatten
end

p first_and_last_case('abc') == 'abc'
p first_and_last_case('aaabc') == 'AaAbc'
p first_and_last_case('aaabccbb') == 'AaABCCbB'

string = 'thequickbrownfoxjumpsoverthelazydog'
new_string = 'THEqUickbROwnfoxjUmpsoveRTHElazydOg'
p first_and_last_case(string) == new_string
