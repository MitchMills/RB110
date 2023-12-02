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

PROBLEM / EXAMPLES
input: array
  - all elements are strings
  - strings contains alpha and numeric characters
    - no spaces or non alphanumeric characters
    - may contain 'number words' (e.g. 'three')
      - these will be treated as numbers
    - all strings contain at least one number (numeric character or number word)

output: integer
  - sum of all "calibration values"
    - calibration value for each string is first and last numbers combined into a two digit number
      -e.g. 'two1nine3' => 23
      - if only one number in string, treat as both first and last number
        - e.g. 'trebfiveuchet' => 55
      - ignore any numbers that are not the first and last

DATA STRUCTURES
- input: array of strings

  - hash
    - keys are numeric characters and number words
    - values are corresponding numeric characters
      - {'1' => '1', ... 'one' => '1'}

  - individual string # '1ab3c2nine'
    - array of all substrings # ['1', '1a', '1ab' . . .]
    - array of only substrings that could be numbers
      - numeric characters: length 1 # '1'
      - number words: lengths 3, 4, 5 # 'one', 'five', 'three' . . .
      - exclude any other lengths
    - array of only substrings that actually are numbers # ['1', '3', '2', 'nine']
    - array of those substrings converted to numeric characters only # ['1', '3', '2', '9']
    - array of first and last numbers # ['1', '9']
    - string # '19'
    - two digit number (calibration value) # 19

- output: integer: sum of all calibration values

ALGORITHM
- Create hash to convert number words to numeric characters

- Get calibration value for each string in input array
  - transform each string into array of numeric characters
    - get all possible substrings that could be numbers
      - transform each string into an array of substrings
        - start at index 0, up to last index (length - 1)
          - this tracks current index
        - start at length 1, up to max length from that index (string length - current index)
          - this tracks current length
          - exclude substrings of length 2 or length > 5
        - get substring from that current index and of that current length
    - select only substrings that actually are numbers: numeric characters and number words
      - check whether substring is one of the keys in the hash
    - convert number words into numeric characters
        - use hash
  - transform array of numeric characters into calibration value
    - concatenate first and last numeric characters
    - convert to an integer

- Get sum of all calibration values
=end

number_characters = ('1'..'9').to_a
number_words = %w(one two three four five six seven eight nine)
keys = number_characters + number_words
values = number_characters + number_characters
WORDS_TO_DIGITS = (keys).zip(values).to_h

def calibration_value2(values)
  converted_values = get_converted_values(values)

  calibration_values = get_calibration_values(converted_values)
  calibration_values.sum
end

def get_converted_values(values)
  substrings = get_all_substrings(values)
  num_substrings = get_num_substrings(substrings)
  convert_values(num_substrings)
end

def get_all_substrings(array)
  array.map do |string|
    substrings = get_substrings(string)
  end
end

def get_substrings(string)
  max_index = string.size - 1

    (0..max_index).each_with_object([]) do |current_index, substrings|
      max_length = string.size - current_index
      max_length = 5 if max_length > 5

      (1..max_length).each do |current_length|
        next if current_length == 2
        substrings << string[current_index, current_length]
      end
    end
end

def get_num_substrings(array)
  array.map do |subarray|
    subarray.select { |string| WORDS_TO_DIGITS.include?(string) }
  end
end

def convert_values(array)
  array.map do |subarray|
    subarray.map { |string| WORDS_TO_DIGITS[string] }
  end
end

def get_calibration_values(values)
  values.map { |array| [array.first, array.last].join.to_i } 
end

values = File.read('day01.txt').split(/\n/)
p calibration_value2(values)



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
input: array
  - all elements are strings
  - strings contains alpha and numeric characters
    - no spaces or non alphanumeric characters
    - all contain at least one numeric character

output: integer
  - sum of all "calibration values"
    - calibration value for each string is first and last numeric characters combined into a two digit number
      -e.g. '1abc2' => 12
      - if only one numeric character in string, treat as both first and last digit
        - e.g. 'treb7uchet' => 77
      - ignore any digits that are not the first and last digits

DATA STRUCTURES
- input: array of strings
  - string # '1ab3c2'
    - array of individual characters # ['1', 'a', 'b', '3', 'c', '2']
    - array of only numeric characters # ['1', '3', '2']
    - array of only first and last numeric characters # ['1', '2']
    - string # '12'
    - two digit number (calibration value) # 12
- output: integer: sum of all calibration values

ALGORITHM
- get calibration value for each string in input array
  - iterate over input array
    - transform each string into its calibration value
      - separate string into an array of individual characters
      - select only the numeric characters
      - concatenate the first and last numeric character
      - convert to an integer = calibration value

- get sum of all calibration values
=end

def calibration_value1(values)
  calibration_values = get_calibration_values(values)
  calibration_values.sum
end

def get_calibration_values(values)
  digits = get_digits(values)
  digits.map { |array| [array.first, array.last].join.to_i } 
end

def get_digits(array)
  array.map do |string|
    numbers = '0123456789'
    string.chars.select { |char| numbers.include?(char) }
  end
end

values = File.read('day01.txt').split(/\n/)
p calibration_value1(values)

