### EASY 3.10 UPPERCASE CHECK
=begin
Write a method that takes a string argument, and returns true if all of the alphabetic characters inside the string are uppercase, false otherwise. Characters that are not alphabetic should be ignored.

PROBLEM
input: string

output: boolean
  - true if all alphabetic characters in string are uppercase
  - false otherwise
  - ignore non-alpha characters
  - return true if input string is empty

EXAMPLES

DATA STRUCTURES
- needs
  - way to evaluate if all alpha characters are uppercase

- input: string

- output: boolean

ALGORITHM
- create an upcased version of input string
- compare it to input string
- return true if they are equal, false otherwise
=end

def uppercase?(string)
  string.upcase == string
end


p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true






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
