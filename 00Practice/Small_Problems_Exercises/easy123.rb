def retirement_calculator
  retirement_info = calculate_retirement_info
  display_retirement_info(retirement_info)
end

def calculate_retirement_info
  ages = input_ages
  years_to_work = ages.reverse.inject(:-)
  current_year = Time.now.year
  retirement_year = current_year + years_to_work
  [current_year, retirement_year, years_to_work]
end

def input_ages
  questions = ["What is your age? ", "At what age would you like to retire? "]
  questions.map do |question|
    print question
    gets.chomp.to_i
  end
end

def display_retirement_info(retirement_info)
  current_year, retirement_year, years_to_work = retirement_info
  puts
  puts "It's #{current_year}. You will retire in #{retirement_year}."
  puts "You have only #{years_to_work} years of work to go!"
end

retirement_calculator
