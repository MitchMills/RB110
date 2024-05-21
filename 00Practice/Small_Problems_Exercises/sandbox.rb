def fizzbuzz(start_number, end_number)
  values = determine_values(start_number..end_number)
  puts values.join(', ')
end

def determine_values(range)
  modulos = range.map do |number|
    [3, 5].map { |divisor| number % divisor }
  end
  fizzbuzz_values(range, modulos)
end

def fizzbuzz_values(range, array)
  fizzbuzz = ['Fizz', 'Buzz']
  array.map.with_index do |subarray, index|
    case subarray.count(0)
    when 0 then range.to_a[index]
    when 1 then fizzbuzz[subarray.index(0)]
    else fizzbuzz.join
    end
  end
end
