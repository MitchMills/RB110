# def letter_percentages(string)
#   types = %i(lowercase uppercase neither)
#   selectors = %w(a-z A-Z ^A-Za-z)
#   percentages = types.zip(selectors).to_h

#   # percentages.map do |type, selector|
#   #   [type, (string.count(selector).fdiv(string.size) * 100).round(1)]
#   # end.to_h

#   percentages.transform_values do |selector|
#     (string.count(selector).fdiv(string.size) * 100).round(1)
#   end
# end

def letter_percentages(string)
  percentages = { lowercase: 'a-z', uppercase: 'A-Z', neither: '^A-Za-z' }
  percentages.transform_values { |selector| percentage(string, selector) }
end

def percentage(string, selector)
  (string.count(selector).fdiv(string.size) * 100).round(1)
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI') == {:lowercase=>66.7, :uppercase=>33.3, :neither=>0.0}
