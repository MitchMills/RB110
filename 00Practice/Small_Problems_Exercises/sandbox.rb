=begin

We're receiving a set of messages in code. The messages are sets of text strings, like:
"alakwnwenvocxzZjsf"
Write a method to decode these strings into numbers. The decoded number should be the number of lowercase characters between the first two uppercase characters. If there aren't two uppercase characters, the number should be 0.

PROBLEM 9:45
input: Array
  - elements are text strings
    - strings can be empty
  - can be empty
output: Array
  - elements are integers
  - same number of elements as the input array
  - decoded:
    - number of lowercase characters between first two uppercase characters
    - if string does not have two uppercase characters, 0
    - if input array is empty, return empty array

EXAMPLES

DATA STRUCTURES
- needs:
  - need a way to distinguish upper and lowercase letters
  - need a way to determine if there are at least two uppercase characters in each string
  - need a way to count lowercase characters between uppercase

- start: array of strings
  - string indexing
  - array of all uppercase alphabetic characters
  - array of indexes where uppercase characters are
  - first two indexes: difference
- end: array of integers

'foUrsCoreAnd'
2 5 : index2 - indexd1 - 1
'lucYintheskyWith'

ALGORITHM
- create an array of all uppercase alpha characters
- consider each text string in input array
  - convert string into an array of charactersf
  - transform into a number
    - create an array of each index where an uppercase letter appears
      - select indexes with uppercase letters
    - find the difference between the first two indexes
      - if not two indexes, return 0
- return transformed array
=end

UPPERCASE = ('A'..'Z').to_a

####
# def decode(strings)
#   strings.map do |string|
#     indexes = get_indexes(string)
#     indexes.size < 2 ? 0 : indexes.take(2).inject(:-).abs - 1
#   end
# end

# def get_indexes(string)
#   string.chars.each_index.select do |index|
#     UPPERCASE.include?(string[index])
#   end
# end
####

def decode(strings)
  strings.map do |string|
    sequences = space(string).join.split
    if space(string).count(' ') < 2 || sequences.size == 0
      0
    else
      UPPERCASE.include?(string[0]) ? sequences[0].size : sequences[1].size
    end
  end
end

def space(string)
  string.chars.map do |char|
    UPPERCASE.include?(char) ? ' ' : char
  end
end

p decode(['ZoL', 'heLlo', 'XX']) #== [1, 0, 0]
p decode(['foUrsCoreAnd', 'seven', '']) #== [2, 0, 0]
p decode(['lucYintheskyWith', 'dIaMonDs']) #== [8, 1]
p decode([]) #== []


# FURTHER EXPLORATION
  # ['lucYinth$%eskyWith']
  # =>


# [1, 2, 3, 4].map do |num|
  # how map works
  # each element gets bound to block parameter
