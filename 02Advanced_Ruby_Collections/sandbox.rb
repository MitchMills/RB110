array = [
  {a: 1},
  {b: 2, c: 3},
  {d: 4, e: 5, f: 6}
]

# incremented = array.map do |hash|
#   hash.map { |key, value| [key, value + 1] }.to_h
# end

incremented = array.map do |hash|
  new_hash = {}
  hash.each do |key, value|
    new_hash[key] = value + 1
  end
  new_hash
end

p array
p incremented
