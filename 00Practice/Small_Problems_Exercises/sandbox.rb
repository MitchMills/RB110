def seven_eleven(number)
  candidates = (7...number)
  candidates.sum do |candidate|
    candidate % 7 == 0 || candidate % 11 == 0 ? candidate : 0
  end
end

p seven_eleven(10) #== 7
p seven_eleven(11) == 7
p seven_eleven(12) == 18
p seven_eleven(25) == 75
p seven_eleven(100) == 1153
p seven_eleven(0) == 0
p seven_eleven(-100) == 0
