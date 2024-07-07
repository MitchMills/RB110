def bouncy_count(numbers)
  numbers.count { |number| bouncy?(number) }
end

def bouncy?(number)
  digits = number.digits.reverse
  pairs = digits.each_cons(2).to_a
  [:<, :>].all? do |comparator|
    pairs.any? { |pair| pair.inject(comparator) }
  end
end

# def ascending?(pairs)
#   pairs.any? { |pair| pair.first < pair.last }
# end

# def descending?(pairs)
#   pairs.any? { |pair| pair.first > pair.last }
# end

p bouncy_count([]) == 0
p bouncy_count([11, 0, 345, 21]) == 0
p bouncy_count([121, 4114]) == 2
p bouncy_count([176, 442, 80701644]) == 2
