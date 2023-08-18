array = ['a', 'b', 'c', 'd', 'e']
counter = 0

loop do
  break if counter >= array.size
  puts array[counter]
  counter += 1
end
