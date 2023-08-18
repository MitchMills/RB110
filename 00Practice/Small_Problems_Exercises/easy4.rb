### 10.2 SIGNED NUMBER TO STRING
# STRING_INTEGERS = ('0'..'9').to_a

# def signed_integer_to_string(integer)
#   string = integer_to_string(integer.abs)
#   return string if integer == 0
#   integer > 0 ? "+#{string}" : "-#{string}"
# end

# def integer_to_string(integer)
#   integer.digits.reduce('') do |result, digit|
#     result.prepend(STRING_INTEGERS[digit])
#   end
# end

# def integer_to_string(integer)
#   result = ''
#   loop do
#     integer, remainder = integer.divmod(10)
#     result.prepend(STRING_INTEGERS[remainder])
#     break if integer == 0
#   end
#   result
# end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'

### 9.2 NUMBER TO STRING
# STRING_INTEGERS = ('0'..'9').to_a

# def integer_to_string(integer)
#   result = ''
#   loop do
#     integer, remainder = integer.divmod(10)
#     result.prepend(STRING_INTEGERS[remainder])
#     break if integer == 0
#   end
#   result
# end

# def integer_to_string(integer)
#   integer.digits.reduce('') do |result, digit|
#     result.prepend(STRING_INTEGERS[digit])
#   end
# end

# def integer_to_string(integer)
#   integer.digits.reverse.map { |digit| STRING_INTEGERS[digit] }.join
# end

# def integer_to_string(integer)
#   integer.digits.reverse.join
# end

# def integer_to_string(integer)
#   [integer].join
# end

# p integer_to_string(4321) == '4321'
# p integer_to_string(0) == '0'
# p integer_to_string(5000) == '5000'

### 8.2 STRING TO SIGNED NUMBER
# STRINGS_TO_INTEGERS = ('0'..'9').zip(0..9).to_h

# def string_to_signed_integer(string)
#   integer = string_to_integer(remove_sign(string))
#   string[0] == '-' ? -integer : integer
# end

# def string_to_integer(string)
#   string.each_char.reduce(0) do |result, character|
#     result = 10 * result + STRINGS_TO_INTEGERS[character]
#   end
# end

# def remove_sign(string)
#   ['+', '-'].include?(string[0]) ? string[1..] : string
# end

# p string_to_signed_integer('4321') == 4321
# p string_to_signed_integer('-570') == -570
# p string_to_signed_integer('+100') == 100

### 7.2 STRING TO NUMBER
# NUMBERS = ('0'..'9').zip(0..9).to_h
# LETTERS = ('a'..'f').zip(10..15).to_h
# HEXADECIMALS = NUMBERS.merge(LETTERS)

# def hexadecimal_to_integer(string)
#   string.downcase.reverse.each_char.with_index.reduce(0) do |result, (char, idx)|
#     result += (HEXADECIMALS[char] * 16**idx)
#   end
# end

# def hexadecimal_to_integer(string)
#   string.downcase.each_char.reduce(0) do |result, character|
#     result = 16 * result + HEXADECIMALS[character]
#   end
# end

# p hexadecimal_to_integer('4D9f') == 19871

###

# STRINGS_TO_INTEGERS = ('0'..'9').zip(0..9).to_h

# def string_to_integer(string)
#   result = 0
#   string.reverse.each_char.with_index do |char, idx|
#     result += (STRINGS_TO_INTEGERS[char] * 10**idx)
#   end
#   result
# end

# def string_to_integer(string)
#   string.reverse.each_char.with_index.reduce(0) do |result, (char, idx)|
#     result += (STRINGS_TO_INTEGERS[char] * 10**idx)
#   end
# end

# def string_to_integer(string)
#   string.each_char.reduce(0) do |result, character|
#     result = 10 * result + STRINGS_TO_INTEGERS[character]
#   end
# end

# p string_to_integer('4321') == 4321
# p string_to_integer('570') == 570

### 6.2 
# def running_total(numbers)
#   total = 0
#   numbers.map { |number| total += number }
# end

# def running_total(numbers)
#   total = 0
#   numbers.each_with_object([]) { |number, result| result << total += number }
# end

# def running_total(numbers)
#   total = 0
#   numbers.reduce([]) { |result, number| result << total += number }
# end

# def running_total(numbers)
#   numbers.each_index.map { |index| numbers[0..index].sum }
# end

# p running_total([2, 5, 13]) == [2, 7, 20]
# p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# p running_total([3]) == [3]
# p running_total([]) == []
# p running_total([1, 1, 1, 1, 1]) == [1, 2, 3, 4, 5]

### 5.2 MULTIPLES OF 3 AND 5
# def multisum1(number)
#   (3..number).select { |number| number % 3 == 0 || number % 5 == 0 }.sum
# end

# def multisum1(number)
#   ((3..number).step(3) + (5..number).step(5)).uniq.sum
# end

# def multisum(number)
#   (3..number).reduce do |sum, num|
#     sum + (num % 3 == 0 || num % 5 == 0 ? num : 0)
#   end
# end

# def multisum(number)
#   (3..number).reduce do |sum, num|
#     num % 3 == 0 || num % 5 == 0 ? sum + num : sum
#   end
# end

# p multisum(3) == 3
# p multisum(5) == 8
# p multisum(10) == 33
# p multisum(1000) == 234168

### 4.2 LEAP YEARS II
# def leap_year?(year)
#   year < 1752 ? julian_leap_year?(year) : gregorian_leap_year?(year)
# end

# def julian_leap_year?(year)
#   year % 4 == 0
# end

# def gregorian_leap_year?(year)
#   year % 100 == 0 ? year % 400 == 0 : year % 4 == 0
# end

# p leap_year?(2016) == true
# p leap_year?(2015) == false
# p leap_year?(2100) == false
# p leap_year?(2400) == true
# p leap_year?(240000) == true
# p leap_year?(240001) == false
# p leap_year?(2000) == true
# p leap_year?(1900) == false
# p leap_year?(1752) == true
# p leap_year?(1700) == true
# p leap_year?(1) == false
# p leap_year?(100) == true
# p leap_year?(400) == true

### 3.2 LEAP YEARS I
# def leap_year?(year)
#   year % 100 == 0 ? year % 400 == 0 : year % 4 == 0
# end

# def leap_year?(year)
#   year % 4 == 0 && year % 100 != 0 || year % 400 == 0
# end

# p leap_year?(2016) == true
# p leap_year?(2015) == false
# p leap_year?(2100) == false
# p leap_year?(2400) == true
# p leap_year?(240000) == true
# p leap_year?(240001) == false
# p leap_year?(2000) == true
# p leap_year?(1900) == false
# p leap_year?(1752) == true
# p leap_year?(1700) == false
# p leap_year?(1) == false
# p leap_year?(100) == false
# p leap_year?(400) == true

### 2.2 WHAT CENTURY IS THAT?
# def century(year)
#   century = get_century(year)
#   format_century(century)
# end

# def get_century(year)
#   century, remainder = year.divmod(100)
#   remainder == 0 ? century : century + 1
# end

# def format_century(century)
#   quotient, remainder = century.divmod(10)
#   suffix = (quotient % 10 == 1) ? 'th' : get_suffix(remainder)
#   century.to_s + suffix
# end

# def get_suffix(remainder)
#   case remainder
#   when 1 then 'st'
#   when 2 then 'nd'
#   when 3 then 'rd'
#   else 'th'
#   end
# end

# p century(2000) == '20th'
# p century(2001) == '21st'
# p century(1965) == '20th'
# p century(256) == '3rd'
# p century(5) == '1st'
# p century(10103) == '102nd'
# p century(1052) == '11th'
# p century(1127) == '12th'
# p century(11201) == '113th'

### 1.2 SHORT LONG SHORT
# def short_long_short(string1, string2)
#   short, long = [string1, string2].sort_by(&:size)
#   short + long + short
# end

# p short_long_short('abc', 'defgh') == "abcdefghabc"
# p short_long_short('abcde', 'fgh') == "fghabcdefgh"
# p short_long_short('', 'xyz') == "xyz"

### 10 CONVERT A SIGNED NUMBER TO A STRING!
# INT_STRINGS = ('0'..'9').to_a
# # ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

# def integer_to_string(num)
#   num.digits.reverse.each_with_object("") { |num, str| str << INT_STRINGS[num] }
# end

# def signed_integer_to_string(num)
#   return '0' if num == 0
#   result = integer_to_string(num.abs)
#   num.positive? ? result.prepend('+') : result.prepend('-')
# end

# p signed_integer_to_string(4321) == '+4321'
# p signed_integer_to_string(-123) == '-123'
# p signed_integer_to_string(0) == '0'

### 9 CONVERT A NUMBER TO A STRING!
# INT_STRINGS = ('0'..'9').to_a
# # ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

# # def integer_to_string(num)
# #   num.digits.reverse.join
# # end

# def integer_to_string(num)
#   num.digits.reverse.each_with_object("") { |num, str| str << INT_STRINGS[num] }
# end

# # def integer_to_string(num)
# #   [num].join
# # end

# def integer_to_string(number)
#   result = ''
#   loop do
#     number, remainder = number.divmod(10)
#     result.prepend(INT_STRINGS[remainder])
#     break if number == 0
#   end
#   result
# end

# p integer_to_string(4321) == '4321'
# p integer_to_string(0) == '0'
# p integer_to_string(5000) == '5000'

### 8 CONVERT A STRING TO A SIGNED NUMBER!
# INTEGERS = Hash.new
# ('0'..'9').each_with_index { |char, idx| INTEGERS[char] = idx }

# def string_to_integer(str)
#   digits = str.chars.map { |char| INTEGERS[char] }.reverse
#   digits.map.each_with_index { |digit, idx| digit * 10**idx }.sum
# end

# def string_to_signed_integer(str)
#   result = string_to_integer(str.delete('+-'))
#   str.chr == '-' ? -result : result
# end

# p string_to_signed_integer('4321') == 4321
# p string_to_signed_integer('-570') == -570
# p string_to_signed_integer('+100') == 100

### 7 CONVERT A STRING TO A NUMBER!
# NUMBERS = Hash.new
# ('0'..'9').each_with_index { |char, idx| NUMBERS[char] = idx }

# LETTERS = Hash.new
# ('a'..'f').each_with_index { |char, idx| LETTERS[char] = idx + 10 }

# HEXADECIMALS = NUMBERS.merge(LETTERS)

# def hexadecimal_to_integer(str)
#   digits = str.downcase.chars.map { |char| HEXADECIMALS[char] }.reverse
#   digits.map.each_with_index { |digit, idx| digit * 16**idx }.sum
# end

# p hexadecimal_to_integer('4D9f') #== 19871
# p hexadecimal_to_integer('1E240')

# def string_to_integer(str)
#   digits = str.chars.map { |char| INTEGERS[char] }.reverse
#   digits.map.each_with_index { |digit, idx| digit * 10**idx }.sum
# end

# def string_to_integer(string)
#   digits = string.chars.map { |char| INTEGERS[char] }
#   p digits
#   value = 0
#   digits.each do |digit| 
#     value = 10 * value + digit
#     p value
#   end
#   value
# end

# p string_to_integer('4321') == 4321
# p string_to_integer('570') == 570

### 6 RUNNING TOTALS
# def running_total(array)
#   total = 0
#   array.map { |num| total += num }
# end

# def running_total(array)
#   total = 0
#   total_array = []
#   array.each do |num|
#     total_array << total += num
#   end
#   total_array
# end

# def running_total(array)
#   total = 0
#   array.each_with_object([]) { |num, result| result << total += num }
# end

# def running_total(array)
#   total_array = []
#   index = 0
#   array.inject(0) do |sum, num|
#     total_array[index] = sum += num
#     index += 1
#     sum
#   end
#   total_array
# end

# def running_total(array)
#   array.inject([]) { |result, element| result << result.last.to_i + element }
# end

# def running_total(array)
#   total = 0
#   array.inject([]) { |total_array, num| total_array << total += num }
# end

# def running_total(array)
#   total_array = []
#   array.each_with_index do |num, idx|
#     total_array << array[0..idx].inject(:+)
#   end
#   total_array
# end

# p running_total([1, 1, 1, 1, 1]) == [1, 2, 3, 4, 5]
# p running_total([2, 5, 13]) == [2, 7, 20]
# p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# p running_total([3]) == [3]
# p running_total([]) == []

### 5 MULTIPLES OF 3 AND 5
# def multisum(num)
#   total = 0
#   1.upto(num) do |i|
#     total += i if (i % 3 == 0 || i % 5 == 0)
#   end
#   total
# end

# def multisum(max)
#   (1..max).select { |num| num % 3 == 0 || num % 5 == 0}.sum
# end

# p multisum(3) == 3 # (1, 2, 3) => 3
# p multisum(5) == 8 # (1, 2, 3, 4, 5) => 3 + 5
# p multisum(10) == 33 #(1..10) => 3 + 5 + 6 + 9 + 10
# p multisum(1000) == 234168

### 4 LEAP YEARS II
# def leap_year?(year)
#   if (year % 100 == 0) && (year > 1752)
#     year % 400 == 0
#   else
#     year % 4 == 0
#   end
# end

# def leap_year?(year)
#   if year < 1752
#     year % 4 == 0
#   else
#     (year % 100 == 0) ? (year % 400 == 0) : (year % 4 == 0)
#   end
# end

# p leap_year?(2016) == true
# p leap_year?(2015) == false
# p leap_year?(2100) == false
# p leap_year?(2400) == true
# p leap_year?(240000) == true
# p leap_year?(240001) == false
# p leap_year?(2000) == true
# p leap_year?(1900) == false
# p leap_year?(1752) == true
# p leap_year?(1700) == true
# p leap_year?(1) == false
# p leap_year?(100) == true
# p leap_year?(400) == true

### 3 LEAP YEARS I
# def leap_year?(year)
  # (year % 100 == 0) ? (year % 400 == 0) : (year % 4 == 0)
# end

# def leap_year?(year)
  # if year % 100 == 0
  #   year % 400 == 0
  # else
  #   year % 4 == 0
  # end
# end

# def leap_year?(year)
#   if year % 4 == 0
#     if year % 100 == 0
#       return false unless year % 400 == 0
#     end
#     true
#   else
#     false
#   end
# end

# def leap_year?(year)
#   if year % 4 == 0
#     if year % 100 == 0
#       return year % 400 == 0
#     end
#     true
#   else
#     false
#   end
# end

# def leap_year?(year)
#   if year % 400 == 0
#     true
#   elsif year % 100 == 0
#     false
#   else
#     year % 4 == 0
#   end
# end

# p leap_year?(2016) == true
# p leap_year?(2015) == false
# p leap_year?(2100) == false
# p leap_year?(2400) == true
# p leap_year?(240000) == true
# p leap_year?(240001) == false
# p leap_year?(2000) == true
# p leap_year?(1900) == false
# p leap_year?(1752) == true
# p leap_year?(1700) == false
# p leap_year?(1) == false
# p leap_year?(100) == false
# p leap_year?(400) == true

### 2 WHAT CENTURY IS THAT?
# def century(year)
#   adjustment = (year % 100 == 0) ? 0 : 1
#   century = ((year / 100) + adjustment)
#   suffix =  case (century % 10)
#             when 1 then 'st'
#             when 2 then 'nd'
#             when 3 then 'rd'
#             else 'th'
#             end
#   suffix = 'th' if (11..13).include?(century % 100)
#   century.to_s + suffix
# end

# p century(2000) == '20th'
# p century(2001) == '21st'
# p century(1965) == '20th'
# p century(256) == '3rd'
# p century(4) == '1st'
# p century(10103) == '102nd'
# p century(1052) == '11th'
# p century(1127) == '12th'
# p century(11201) == '113th'

### 1 SHORT LONG SHORT
# def short_long_short(str1, str2)
#   short =  (str1.size < str2.size) ? str1 : str2
#   long =   (str1.size > str2.size) ? str1 : str2
#   short + long + short 
# end


# p short_long_short('abc', 'defgh') == "abcdefghabc"
# p short_long_short('abcde', 'fgh') == "fghabcdefgh"
# p short_long_short('', 'xyz') == "xyz"
