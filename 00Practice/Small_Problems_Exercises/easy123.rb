def sum_or_product
  inputs = request_user_inputs
  result = calculate_result(inputs)
  display(result)
end

def request_user_inputs
  integer = request_integer
  operation = request_operation
  [integer, operation]
end

def request_integer
  loop do
    print 'Please enter an integer greater than 0: '
    input = gets.chomp
    return input.to_i if valid_integer?(input)

    invalid_entry('integer')
    puts
  end
end

def valid_integer?(input)
  input.to_i.to_s == input && input.to_i.positive?
end

def invalid_entry(type)
  description = type == 'integer' ? 'positive integer' : 'valid choice'
  puts "I'm sorry, that's not a #{description}."
end

def request_operation
  loop do
    print "Enter 's' to compute the sum, 'p' to compute the product: "
    input = gets.chomp
    return input if valid_operation?(input)

    invalid_entry('choice')
    puts
  end
end

def valid_operation?(input)
  %w(s p).include?(input.downcase)
end

def calculate_result(input)
  integer, operation = input
  operator, outcome = operator(operation)
  result = (1..integer).inject(operator)
  [outcome, integer, result]
end

def operator(operation)
  operation == 's' ? [:+, 'sum'] : [:*, 'product']
end

def display(result)
  outcome, integer, result = result
  puts
  puts "The #{outcome} of the integers between 1 and #{integer} is #{result}."
end

sum_or_product
