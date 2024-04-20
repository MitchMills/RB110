def integer_arithmetic
  integers = request_integers
  results = calculate_results(integers)
  display_results(integers, results)
end

def request_integers
  %w(first second).map { |place| enter_number(place) }
end

def enter_number(place)
  loop do
    print "==> Enter the #{place} positive integer: "
    entry = gets.chomp
    return entry.to_i if valid_entry?(entry)

    invalid_entry(entry)
  end
end

def valid_entry?(entry)
  entry.to_i.to_s == entry && entry.to_i.positive?
end

def invalid_entry(entry)
  puts
  puts "==> I'm sorry, '#{entry}' is not a positive integer. Please try again."
  puts
end

def calculate_results(integers)
  operators = %i(+ - * / % **)
  results = operators.map { |operator| integers.inject(operator) }
  operators.zip(results).to_h
end

def display_results(integers, results)
  puts
  number1, number2 = integers
  results.each do |operation, result|
    puts "==> #{number1} #{operation} #{number2} = #{result}"
  end
end

integer_arithmetic
