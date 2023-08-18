string = "abcdefg"
counter = 0

loop do
  break if counter >= string.size
  puts string[counter]
  counter += 1
end
