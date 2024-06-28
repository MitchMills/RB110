def is_prime?(integer)
  integer > 1 && no_factors?(integer)
end

def no_factors?(integer)
  largest_possible_factor = Integer.sqrt(integer)
  (2..largest_possible_factor).none? { |candidate| integer % candidate == 0 }
end

p is_prime?(1) == false
p is_prime?(2) == true
p is_prime?(3) == true
p is_prime?(4) == false
p is_prime?(5) == true
p is_prime?(6) == false
p is_prime?(7) == true
p is_prime?(8) == false
p is_prime?(9) == false
p is_prime?(10) == false
p is_prime?(23) == true
p is_prime?(24) == false
p is_prime?(997) == true
p is_prime?(998) == false
p is_prime?(3_297_061) == true
p is_prime?(23_297_061) == false
