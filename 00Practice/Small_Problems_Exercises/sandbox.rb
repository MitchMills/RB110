def transpose(array)
  number_of_subarrays = array.first.size
  result = Array.new(number_of_subarrays) { |_index| [] }

  array.each do |subarray|
    subarray.each_with_index do |element, index|
      result[index] << element
    end
  end

  result
end

def transpose2(array)
  number_of_subarrays = array.first.size
  result = Array.new(number_of_subarrays, [])

  array.each do |subarray|
    subarray.each_with_index do |element, index|
      result[index] += [element]
    end
  end

  result
end

def transpose3(array)
  number_of_subarrays = array.first.size
  result = []
  number_of_subarrays.times { |_| result << [] }

  array.each do |subarray|
    subarray.each_with_index do |element, index|
      result[index] << element
    end
  end

  result
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) == [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]
