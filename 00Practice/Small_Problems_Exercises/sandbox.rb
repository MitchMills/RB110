def show_multiplicative_average(array)
  average = array.inject(:*).fdiv(array.size)
  puts "The result is #{format('%.3f', average)}"
end
