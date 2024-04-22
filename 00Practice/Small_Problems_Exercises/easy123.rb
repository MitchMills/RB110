### EASY 3.6 EXCLUSIVE OR
=begin
The || operator returns a truthy value if either or both of its operands are truthy. If both operands are falsey, it returns a falsey value. The && operator returns a truthy value if both of its operands are truthy, and a falsey value if either operand is falsey. This works great until you need only one of two conditions to be truthy, the so-called exclusive or.

In this exercise, you will write a method named xor that takes two arguments, and returns true if exactly one of its arguments is truthy, false otherwise. Note that we are looking for a boolean result instead of a truthy/falsy value as returned by || and &&.

PROBLEM
input: 2 arguments
  - can be any kind

output: boolean
  - true if one argument is truthy and one is falsey
  - false otherwise (both truthy or both falsey)

EXAMPLES

DATA STRUCTURES
- needs:
  - store whether each argument is truthy or falsey
  - determine if one truthy and one falsy

- input: 2 statements
  - array of evaluated statements: # [true, false] etc
- output: boolean

ALGORITHM
- convert each argument into a boolean value
  - apply !! to each argument
- compare the two values
  - if they are equal, return false
  - else return true
=end

def xor?(arg1, arg2)
  !!arg1 != !!arg2
end


p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false





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
