### EASY 4.1 SHORT LONG SHORT
=begin
Write a method that takes two strings as arguments, determines the longest of the two strings, and then returns the result of concatenating the shorter string, the longer string, and the shorter string once again. You may assume that the strings are of different lengths.

PROBLEM
input: two strings
  - two different lengths
  - one string may be empty
output: string
  - concatentated input strings: shorter + longer + shorter

EXAMPLES

DATA STRUCTURES
- needs:
  - way to determine which string is shortest / longest

- input: 2 strings
  - array of both strings sorted by length
- output: string

ALGORITHM
- create an array containing both input strings
- sort the array by length
- concatenate strings: short + long + short
- return that string
=end

def short_long_short(string1, string2)
  short, long = [string1, string2].sort_by(&:size)
  short + long + short
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
