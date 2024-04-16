PERCENT_DIVISOR = 100.0

def tip_calculator
  amounts = input_amounts
  display_tip_and_total(amounts)
end

def input_amounts
  ['bill', 'tip percentage'].map do |type|
    print "What is the #{type}? "
    gets.chomp.to_f
  end
end

def display_tip_and_total(amounts)
  puts
  tip_and_total = calculate_tip_and_total(amounts)
  tip_and_total.each do |label, amount|
    puts "The #{label} is #{format_currency(amount)}"
  end
end

def calculate_tip_and_total(amounts)
  bill, tip_percentage = amounts
  tip = bill * (tip_percentage / PERCENT_DIVISOR)
  total = bill + tip
  %w[tip total].zip([tip, total]).to_h
end

def format_currency(amount)
  basic = format('%.2f', amount)
  with_commas = basic.reverse.scan(/(\d*\.\d{1,3}|\d{1,3})/).join(',').reverse
  with_commas.prepend('$')
end

tip_calculator
