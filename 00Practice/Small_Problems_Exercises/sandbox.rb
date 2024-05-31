def max_rotation_with_zeros(integer)
  digits = integer.digits.reverse
  digits.each_index { |index| digits << digits.delete_at(index) }
  digits.first == 0 ? digits.join : digits.join.to_i
end

p max_rotation_with_zeros(735291) == 321579
p max_rotation_with_zeros(3) == 3
p max_rotation_with_zeros(35) == 53
p max_rotation_with_zeros(105) == '015'
p max_rotation_with_zeros(8_703_529_146) == 7_321_609_845
p max_rotation_with_zeros(10023) == '02130'
p max_rotation_with_zeros(10003) == '00130'
