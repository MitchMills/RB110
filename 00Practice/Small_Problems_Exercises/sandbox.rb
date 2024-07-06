def nearest_prime_sum(numbers)
  sum = numbers.sum
  next_prime = find_next_prime(sum)
  next_prime - sum
end

def find_next_prime(number)
  candidate = number + 1
  candidate += 1 until prime?(candidate)
  candidate
end

def prime?(number)
  max_possible_factor = Integer.sqrt(number)
  possible_factors = (2..max_possible_factor)

  possible_factors.none? do |possible_factor|
    number % possible_factor == 0
  end
end

p nearest_prime_sum([1, 2, 3]) == 1        # Nearest prime to 6 is 7
p nearest_prime_sum([5, 2]) == 4           # Nearest prime to 7 is 11
p nearest_prime_sum([1, 1, 1]) == 2        # Nearest prime to 3 is 5
p nearest_prime_sum([2, 12, 8, 4, 6]) == 5 # Nearest prime to 32 is 37

# Nearest prime to 163 is 167
p nearest_prime_sum([50, 39, 49, 6, 17, 2]) == 4
