def smaller_than(array)
  array.map { |number| less_thans(number, array) }
end

def less_thans(number, array)
  unique_values = array.uniq
  unique_values.select { |value| number > value }.size
end
