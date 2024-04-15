### STRINGY STRINGS
=begin
Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

PROBLEM
input: integer
  - positive
  - represents desired length of output string

output: string
  - length = input integer
  - alternating 1s and 0s, starting with 1

EXAMPLES

DATA STRUCTURES
- needs:
  - way to determine whether next character is 1 or 0

- input: integer
  - empty string to add 1s and 0s to
  - boolean toggle to determine 1s or 0s
    - true = 1, false = 0
- output: string

- ALGORITHM
  - create an empty string
  - create a variable to control adding a 1 or 0: add_one
    - set it to true
  - for the desired length
    - add a character to the empty string
      - if add_one is true, add a '1'
      - else add a '0'
  - return the string
=end

# def stringy(length)
#   string = ''
#   add_one = true
#   length.times do
#     next_character = add_one ? '1' : '0'
#     string << next_character
#     add_one = !add_one
#   end
#   string
# end

# def stringy(length)
#   string = ''
#   length.times do |index|
#     next_character = index.even? ? '1' : '0'
#     string << next_character
#   end
#   string
# end

# def stringy(length, first_character = '1')
# string = ''
# characters = first_character == '1' ? ['1', '0'] : ['0', '1']

# length.times do |index|
#   next_character = index.even? ? characters[0] : characters[1]
#   string << next_character
# end
# string
# end

# def stringy(length)
#   (1..length).map { |place| place.odd? ? '1' : '0' }.join
# end

# def stringy(length, start_with_one = true)
#   characters = start_with_one ? %w(1 0) : %w(0 1)
#   (1..length).map { |place| place.odd? ? characters[0] : characters[1] }.join
# end

# def stringy(length, first = 1)
#   second = first == 1 ? 0 : 1
#   Array.new(length) { |index| index.even? ? first : second }.join
# end

def stringy(length, first = 1)
  Array.new(length) { |index| index.even? ? first : 1 - first }.join
end


p stringy(6) == '101010'
p stringy(9) == '101010101'
p stringy(4) == '1010'
p stringy(7) == '1010101'
