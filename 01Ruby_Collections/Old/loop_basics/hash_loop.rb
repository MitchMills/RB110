hash = { one: 1, two: 2, three: 3, four: 4, five: 'five' }
hash_keys = hash.keys
counter = 0

loop do
  break if counter >= hash_keys.size
  current_key = hash_keys[counter]
  puts hash[current_key]
  counter += 1
end
