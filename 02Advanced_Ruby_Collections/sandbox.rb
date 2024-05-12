array = [
  {a: 1},
  {b: 2, c: 3},
  {d: 4, e: 5, f: 6}
]

=begin
PROBLEM: 11:24
input: array
  - each element is a hash
output: new array
  - same number of elements as input array
  - each hash element has all values incremented by 1

DATA STRUCURES
- needs:
  - access each individual hash
  - access each key and value in each hash
  - increment all values by 1
  - avoid modifying input array

- input: array
  - new array
    - new hashes
- output: array

ALGORITHM
- transform input array
  - for each hash element:
    - create a new hash where keys are the same and each value is incremented by 1
- return the transformed array
=end

p array
puts

# incremented = array.map do |hash|
#   hash.map { |key, value| [key, value + 1] }.to_h
# end

incremented = array.map do |hash|
  hash.keys.zip(hash.values.map(&:next)).to_h
end

p array
p incremented
