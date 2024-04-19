def inclusion_checker
  numbers = prompt_numbers
  display_result(numbers)
end

def prompt_numbers
  places = %w(1st 2nd 3rd 4th 5th last)
  places.map { |place| enter_number(place) }
end

def enter_number(place)
  loop do
    print "==> Enter the #{place} integer: "
    entry = gets.chomp
    puts
    return entry.to_i if valid_integer?(entry)

    invalid_entry
  end
end

def valid_integer?(entry)
  entry.to_i.to_s == entry
end

def invalid_entry
  puts "Sorry, that's not an integer. Try again."
  puts
end

def display_result(numbers)
  last = numbers.pop
  verb_phrase = verb_phrase(numbers, last)
  puts "The number #{last} #{verb_phrase} in #{numbers}."
end

def verb_phrase(numbers, last)
  included?(numbers, last) ? "appears" : "does not appear"
end

def included?(numbers, last)
  numbers.include?(last)
end

inclusion_checker
