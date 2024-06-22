# def fibonacci(nth)
#   return 1 if nth <= 2
#   last_two = [1, 1]
#   (3..nth).each do |_|
#     last_two[0], last_two[1] = last_two[1], (last_two[0] + last_two[1])
#   end
#   last_two.last
# end

def fibonacci(nth)
  (3..nth).each_with_object([1, 1]) do |_, last_two|
    last_two[0], last_two[1] = last_two[1], (last_two[0] + last_two[1])
  end.last
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
# p fibonacci(100_001) # => 4202692702.....8285979669707537501
