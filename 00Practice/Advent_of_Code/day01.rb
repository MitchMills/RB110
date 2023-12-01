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

def calibration_value(values)
  calibration_values = get_calibration_values(values)
  calibration_values.sum
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

values = File.read('day01.txt').split(/\n/)
p calibration_value(values)

