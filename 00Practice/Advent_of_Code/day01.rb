### PART TWO
=begin
It looks like some of the digits are actually spelled out with letters: one, two, three, four, five, six, seven, eight, and nine also count as valid "digits".

Equipped with this new information, you now need to find the real first and last digit on each line. For example:

two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen

In this example, the calibration values are 29, 83, 13, 24, 42, 14, and 76. Adding these together produces 281.

What is the sum of all of the calibration values?
=end

number_words = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
numbers = ('1'..'9').to_a
DIGITS = number_words.zip(numbers).to_h
# {"one"=>"1", "two"=>"2", "three"=>"3", "four"=>"4", "five"=>"5", "six"=>"6", "seven"=>"7", "eight"=>"8", "nine"=>"9"}


def calibration_value(values)
  converted_values = convert_values(values)
  # calibration_values = get_calibration_values(converted_values)
  # calibration_values.sum
end

def convert_values(values)
  substrings = get_substrings(values)

end

def get_substrings(array)
  array.each_with_object([]) do |string, substrings|
    max_index = string.size - 1
    (0..max_index).each do |current_index|
      max_length = string.size - current_index
      max_length = 5 if max_length > 5
      (1..max_length).each do |current_length|
        substrings << string[current_index, current_length]
      end
    end
  end
end

def get_calibration_values(values)
  digits = get_digits(values)
  digits.map { |array| [array[0], array[-1]].join.to_i } 
end

def get_digits(array)
  array.map do |string|
    numbers = '0123456789'
    string.chars.select { |char| numbers.include?(char) }
  end
end

test_values = ['two1nine', 'eightwothree', 'abcone2threexyz', 'xtwone3four', '4nineeightseven2', 'zoneight234', '7pqrstsixteen']

p calibration_value(test_values) #== 281

# values = File.read('day01.txt').split(/\n/)
# p calibration_value(values)



### PART ONE
=begin
The newly-improved calibration document consists of lines of text; each line originally contained a specific calibration value that the Elves now need to recover. On each line, the calibration value can be found by combining the first digit and the last digit (in that order) to form a single two-digit number.

For example:

1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet

In this example, the calibration values of these four lines are 12, 38, 15, and 77. Adding these together produces 142.

Consider your entire calibration document. What is the sum of all of the calibration values?

8:52
PROBLEM / EXAMPLES
input: array of strings
  - strings contains alpha characters and digits
    - no spaces or non alphanumeric characters
    - will contain at least one digit

output: integer
  - sum of all calibration values
    - calibration value for each string is combination of first and last digits in the string into a two digit number
      -e.g. '1abc2' => 12
      - if only one digit is in string, treat as both first and last digit
        - e.g. 'treb7uchet' => 77
      - ignore any digits that are not the first and last digits

DATA STRUCTURES
- input: array
  - strings
    - array of characters
    - array of only digits
    - array of only first and last digits: calibration value
- output: integer: sum of all calibration values

ALGORITHM
- get calibration value for each string
  - iterate over input array
    - separate each string into an array of characters
      - select only the number characters from each array
      - transform that array so it contains only the first and last number character
      - transform each array into a two digit integer
- get sum of all calibration values
=end

# def calibration_value(values)
#   calibration_values = get_calibration_values(values)
#   calibration_values.sum
# end

# def get_calibration_values(values)
#   digits = get_digits(values)
#   digits.map { |array| [array[0], array[-1]].join.to_i } 
# end

# def get_digits(array)
#   array.map do |string|
#     numbers = '0123456789'
#     string.chars.select { |char| numbers.include?(char) }
#   end
# end

# values = File.read('day01.txt').split(/\n/)
# p calibration_value(values)

