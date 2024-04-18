def retirement_calculator
  ages = input_ages
  display_retirement_info(ages)
end

def input_ages
  questions = ["What is your age? ", "At what age would you like to retire? "]
  questions.map do |question|
    print question
    gets.chomp.to_i
  end
end

def display_retirement_info(ages)
  current_year, retirement_year, years_to_work = retirement_info(ages)
  puts
  puts "It's #{current_year}. You will retire in #{retirement_year}."
  puts "You have only #{years_to_work} years of work to go!"
end

def retirement_info(ages)
  years_to_work = ages.reverse.inject(:-)
  current_year = Time.now.year
  retirement_year = current_year + years_to_work
  [current_year, retirement_year, years_to_work]
end

retirement_calculator
