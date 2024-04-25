# using #select
def multisum(number)
  (3..number).select { |number| multiple?(number, [3, 5]) }.sum
end

def multiple?(number, divisors)
  divisors.any? { |divisor| number % divisor == 0 }
end

# using #reduce with a block
def multisum(number)
  (3..number).reduce { |sum, num| multiple?(num, [3, 5]) ? sum + num : sum }
end

# using #step
def multisum(number)
  ((3..number).step(3) + (5..number).step(5)).uniq.sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
