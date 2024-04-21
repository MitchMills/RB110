### EASY 3.3 COUNTING CHARACTERS
=begin
Write a program that will ask a user for an input of a word or multiple words and give back the number of characters. Spaces should not be counted as a character.
***
=> Please write word or multiple words: walk, don't run
There are 13 characters in "walk, don't run".
***

PROBLEM
input: string
  - user prompted for input
    - "Please write word or multiple words: "
output: string
  - "There are #{number} characters in #{input string}"
  - includes number of characters (integer)
    - spaces should not count
    - all other characters should

EXAMPLES

DATA STRUCTURES
- needs:
  - way to exclude space from count

- input: string
  - length of string
  - number of spaces in string
  - difference
- output: integer, string

ALGORITHM
- get total number of characters in input string
  - string length
- get number of spaces in input string
  - count number of spaces in input string
- get difference and return it in string
=end

def character_count
  string = prompt_string
  display_count(string)
end

def prompt_string
  print "=> Please write word or multiple words: "
  gets.chomp
end

def display_count(string)
  count = count_characters(string)
  puts "=> There are #{count} characters in \"#{string}\"."
end

def count_characters(string)
  string.size - string.count(' ')
end

character_count

### EASY 3.2 ARITHMETIC
# def arithmetic
#   numbers = request_numbers
#   results = calculate_results(numbers)
#   display_results(numbers, results)
# end

# def request_numbers
#   %w(first second).map { |place| enter_number(place) }
# end

# def enter_number(place)
#   loop do
#     print "==> Enter the #{place} number: "
#     entry = gets.chomp
#     return entry.to_f if valid_entry?(entry)

#     invalid_entry(entry)
#   end
# end

# def valid_entry?(entry)
#   entry.to_f.to_s == entry || entry.to_i.to_s == entry
# end

# def invalid_entry(entry)
#   puts "==> Sorry, '#{entry}' is not a number. Please try again."
#   puts
# end

# def calculate_results(numbers)
#   operators = %i(+ - * / % **)
#   results = operators.map do |operator|
#     next "error: can't divide by zero" if zero_error(numbers, operator)
#     numbers.inject(operator)
#   end
#   operators.zip(results).to_h
# end

# def zero_error(numbers, operator)
#   numbers.last == 0 && %i(/ %).include?(operator)
# end

# def display_results(numbers, results)
#   puts
#   number1, number2 = numbers.map { |number| format_number(number) }
#   results.each do |operation, result|
#     result = format_number(result) unless result.instance_of?(String)
#     puts "==> #{number1} #{operation} #{number2} = #{result}"
#   end
# end

# def format_number(number)
#   basic = format('%.2f', number)
#   with_commas = basic.reverse.scan(/(\d*\.\d{1,3}|\d{1,3})/).join(',').reverse
#   final = with_commas.gsub('.00', '')
#   number < 0 ? final.prepend('-') : final
# end

# arithmetic
