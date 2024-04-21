### EASY 3.4 MULTIPLY
=begin
Create a method that takes two arguments, multiplies them together, and returns the result.

PROBLEM
input: two numbers

output: number
  - product of two input integers

EXAMPLES

DATA STRUCTURES
- needs:
  - way to get product

- input: two numbers
- output: number

ALGORITHM
- multiply two input numbers together
- return the result
=end

def multiply(num1, num2)
  num1 * num2
end

p multiply([5], [3]) #== 15


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
