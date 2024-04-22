### EASY 3.7 PALINDROMIC
=begin
Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation and spaces.

PROBLEM
input: string
  - can contain any characters, including spaces, punctuation, etc
  - upper and lower case

output: boolean
  - true if input string is a palindrome
    - reads the same forwards as backwards
      - case matters
      - punctuation and spaces matter
  - false otherwise

EXAMPLES

DATA STRUCTURES
- needs
  - ability to reverse input string
  - ability to compare input string to its reversed version

- input: string
  - reversed string
- output: boolean

ALGORITHM
- reverse the input string
- compare it to the input string
- return true if they are the same, false otherwise
=end

ALPHANUMERICS = ('a'..'z').to_a + ('0'..'9').to_a

def real_palindrome?(string)
  comp = string.downcase.chars.select { |char| ALPHANUMERICS.include?(char)}
  comp == comp.reverse
end

p real_palindrome?('madam') #== true
p real_palindrome?('Madam') #== true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") #== true # (only alphanumerics matter)
p real_palindrome?('356653') #== true
p real_palindrome?('356a653') #== true
p real_palindrome?('123ab321') #== false



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
