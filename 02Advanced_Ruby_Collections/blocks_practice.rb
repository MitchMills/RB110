array = [
  [[1, 2], [3, 4]],
  [5, 6]
]

result = array.map do |subarray|
  subarray.map do |element|
    element.to_s.to_i == element ? element + 1 : element.map { |num| num + 1 }
  end
end

p result
