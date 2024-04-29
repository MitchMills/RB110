### EASY 5.1 ASCII
=begin
Write a method that determines and returns the ASCII string value of a string that is passed in as an argument. The ASCII string value is the sum of the ASCII values of every character in the string. (You may use String#ord to determine the ASCII value of a character.)

PROBLEM 6:11
input: string
  - can contain any characters
  - can be empty
output: integer
  - sum of the ASCII values of all characters in the string

EXAMPLES

DATA STRUCTURES
- needs:
  - way to access each individual character
  - way to determine each characters' ascii value
  - way to sum all values

- input: string
  - array of individual characters
  - transformed array of ascii values for each character
  - sum of all values
- output: integer

ALGORITHM
- access each individual character
  - create an array of each
- determine its ascii value
  - transform array into each character's ascii value
- sum all these values and return sum
=end

# def ascii_value(string)
#   string.chars.map(&:ord).sum
# end

# def ascii_value(string)
#   string.chars.inject(0) { |sum, char| sum += (char.ord) }
# end

def ascii_value(string)
  string.sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
