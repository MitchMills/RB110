array9 = [[['a'], ['b'], ['c']], [['a'], ['b'], ['c']]]

result = array9.map do |element1|
  element1.each do |element2|
    element2.each { |element3| element3.upcase! }
  end
end

p result
