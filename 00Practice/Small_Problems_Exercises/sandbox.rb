def pairs(array)
  last_index = (array.size - 1) / 2
  (0..last_index).map do |index|
    [array[index], array[-(index + 1)]]
  end
end
