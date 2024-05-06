

### 10.2 MUTATION
# array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
# array2 = []

# array1.each { |value| array2 << value }

# array1.each { |value| value.upcase! if value.start_with?('C', 'S') }

# puts array2

### 9.2 DOES MY LIST INCLUDE THIS?
# def include?(array, search_value)
#   array.each { |element| return true if element == search_value }
#   false
# end

# def include?(array, search_value)
#   array.count(search_value) > 0
# end

# p include?([1,2,3,4,5], 3) == true
# p include?([1,2,3,4,5], 6) == false
# p include?([], 3) == false
# p include?([nil], nil) == true
# p include?([], nil) == false

### 8.2 FIND THE DUPLICATE
# def find_dup(array)
#   array.tally.key(2) || "No duplicate found."
# end

# def find_dup(array)
#   seen = []
#   index = 0

#   loop do
#     current_element = array[index]
#     return current_element if seen.include?(current_element)
#     seen << current_element
#     index += 1
#     break if index >= array.size
#   end
#   "No duplicate found."
# end

# def find_dup(array)
#   array.each do |element|
#     return element if array.count(element) > 1
#   end
#   "No duplicate found."
# end

# p find_dup([1, 5, 1, 3])# == 1
# p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
#           38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
#           14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
#           78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
#           89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
#           41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
#           55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
#           85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
#           40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
#           7,  34, 57, 74, 45, 11, 88, 67,  5, 58])# == 73
# p find_dup([1, 2, 3, 4, 5])

### 7.2 HALVSIES
# def halvsies(array)
#   midpoint = array.size / 2
#   front_slice_size = array.size - midpoint

#   front_slice = array[0, front_slice_size]
#   back_slice = array - front_slice
#   [front_slice, back_slice]
# end

# array = [1, 2, 3, 4, 5]
# p halvsies(array)
# p array

# p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
# p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
# p halvsies([5]) == [[5], []]
# p halvsies([]) == [[], []]

### 6.2 COMBINING ARRAYS
# def merge(array_1, array_2) # non-mutating
#   array_1 | array_2
# end

# def merge(array1, array2) # non-mutating
#   (array1 + array2).uniq
# end

# def merge(array1, array2) # non-mutating
#   array1 + array2.reject { |element| array1.include?(element) }
# end

# def merge(array1, array2) # MUTATING
#   array2.each_with_object(array1) do |element, array1|
#     array1 << element unless array1.include?(element)
#   end
# end

# def merge(array1, array2) # MUTATING
#   array2.inject(array1, :<<).uniq
# end

# def merge(array1, array2) # MUTATING
#   array2.inject(array1) do |array1, element|
#     array1.include?(element) ? array1 : array1 << element
#   end
# end


# def merge(array1, array2) # non-mutating
#   result = [] + array1
#   array2.each_with_object(result) do |element, result|
#     result << element unless array1.include?(element)
#   end
# end

# def merge(array1, array2) # non-mutating
#   result = [] + array1
#   array2.inject(result, :<<).uniq
# end

# def merge(array1, array2) # non-mutating
#   result = [] + array1
#   array2.inject(result) do |result, element|
#     array1.include?(element) ? result : result << element
#   end
# end

# array1 = [1, 3, 5]
# array2 = [3, 6, 9]
# puts "array1: #{array1}, #{array1.object_id}"
# puts "array2: #{array2}, #{array2.object_id}"
# merged = merge(array1, array2)
# puts
# puts "merged: #{merged}, #{merged.object_id}"
# puts
# puts "array1: #{array1}, #{array1.object_id}"
# puts "array2: #{array2}, #{array2.object_id}"

### 5.2 REVERSED ARRAYS II
# def reverse(list)
#   list.each_index.map { |index| list[-(index + 1)] }
# end

# def reverse(list)
#   list.each_index.map { |index| list[-index - 1] }
# end

# def reverse(list)
#   list.each_index.map { |index| list[(list.size - 1) - index] }
# end

# def reverse(list)
#   1.upto(list.size).map { |index| list[-index] }
# end

# def reverse(list)
#   -1.downto(-list.size).map { |index| list[index] }
# end

# p reverse([1,2,3,4]) == [4,3,2,1]          # => true
# p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
# p reverse(['abc']) == ['abc']              # => true
# p reverse([]) == []                        # => true

# list = [1, 3, 2]                      # => [1, 3, 2]
# new_list = reverse(list)              # => [2, 3, 1]
# p list.object_id != new_list.object_id  # => true
# p list == [1, 3, 2]                     # => true
# p new_list == [2, 3, 1]                 # => true

### 4.2 REVERSED ARRAYS I
# def reverse!(array)
#   (array.size / 2).times do |index|
#     array[index], array[-(index + 1)] = array[-(index + 1)], array[index]
#   end
#   array
# end

# def reverse!(list)
#   list.each_index do |index|
#     front, back = index, -(index + 1)
#     list[front], list[back] = list[back], list[front] if index < list.size / 2
#   end
# end

### DANIEL CHAE
# def reverse!(a)
#   a[0..].each_with_index.each_with_object(a) { |(v, i), a| a[-i - 1] = v }
# end

# def reverse!(list)
#   list.clone.each_with_index.with_object(list) do |(element, index), list|
#     list[-(index + 1)] = element
#   end
# end

# More memory efficient, but potentially slower one-liner (amortized O(n))
# def reverse!(a)
#   a.each_with_index { |v, i| a.unshift(a.delete_at(i)) }
# end

# def preverse!(list)
#   list.each_index { |index| list.prepend(list.delete_at(index)) }
# end

###
# list = [1,2,3,4]
# result = reverse!(list)
# p result == [4, 3, 2, 1] # true
# p list == [4, 3, 2, 1] # true
# p list.object_id == result.object_id # true

# list = %w(a b e d c)
# p reverse!(list) == ["c", "d", "e", "b", "a"] # true
# p list == ["c", "d", "e", "b", "a"] # true

# list = ['abc']
# p reverse!(list) == ["abc"] # true
# p list == ["abc"] # true

# list = []
# p reverse!(list) == [] # true
# p list == [] # true

### 3.2 FIBONACCI NUMBER LOCATION BY LENGTH
# def find_fibonacci_index_by_length(length)
#   limit = 10**(length - 1)
#   fibonaccis = [1, 1]
#   until fibonaccis.last >= limit
#     fibonaccis << (fibonaccis[-2] + fibonaccis[-1])
#   end
#   fibonaccis.size
# end

# def find_fibonacci_index_by_length(length)
#   limit = 10**(length - 1)
#   current_pair = [1, 1]
#   index = 2
#   until current_pair.last >= limit
#     next_number = current_pair.sum
#     current_pair = [current_pair.last, next_number]
#     index += 1
#   end
#   index
# end

# def find_fibonacci_index_by_length(length)
#   limit = 10**(length - 1)
#   current_pair = [1, 1]
#   index = 2
#   loop do
#     return index if current_pair.last >= limit
#     next_number = current_pair.sum
#     current_pair = [current_pair.last, next_number]
#     index += 1
#   end
# end

# def find_fibonacci_index_by_length(length)
#   current_pair = [1, 1]
#   index = 3
#   loop do
#     next_number = current_pair.sum
#     return index if next_number.to_s.size >= length
#     index += 1
#     current_pair = [current_pair.last, next_number]
#   end
# end

# p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
# p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
# p find_fibonacci_index_by_length(10) == 45
# p find_fibonacci_index_by_length(100) == 476
# p find_fibonacci_index_by_length(1000) == 4782
# p find_fibonacci_index_by_length(10000) == 47847

### 2.2 DELETE VOWELS
# VOWELS = 'AEIOUaeiou'
# def remove_vowels(strings_array)
#   strings_array.map {|string| string.delete(VOWELS) }
# end

# p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

### 1.2 CUTE ANGLES
# DEGREE = "\xC2\xB0"
# MINUTES_PER_DEGREE = 60
# SECONDS_PER_MINUTE = 60

# def dms(angle)
#   dms = get_dms(angle)
#   format_dms(dms)
# end

# def get_dms(degrees)
#   minutes = (degrees - degrees.truncate) * MINUTES_PER_DEGREE
#   seconds = (minutes - minutes.truncate) * SECONDS_PER_MINUTE
#   [degrees, minutes, seconds].map(&:truncate)
# end

# def format_dms(dms)
#   degrees, minutes, seconds = dms
#   minutes, seconds = [minutes, seconds].map { |value| sprintf('%02d', value) }
#   "#{degrees}#{DEGREE}#{minutes}'#{seconds}\""
# end

# p dms(30) == %(30°00'00")
# p dms(76.73) == %(76°43'48")
# p dms(254.6) == %(254°35'59")
# p dms(93.034773) == %(93°02'05")
# p dms(0) == %(0°00'00")
# p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

### 10 MUTATION
# array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
# p array1.object_id
# array2 = []
# p array2.object_id
# puts
# array1.each { |value| array2 << value }
# p array1.object_id
# p array2.object_id
# puts
# array2.each { |value| value.upcase! if value.start_with?('C', 'S') }
# p array1
# p array1.object_id
# puts
# p array2
# p array2.object_id

### 9 DOES MY LIST INCLUDE THIS?
# def include?(array, target)
#   array.each { |ele| return true if ele == target }
#   false
# end

# def include?(array, target)
#   !!array.index(target)
# end

# def include?(array, target)
#   !(array.select { |ele| ele == target }.empty?)
# end

# def include?(array, target)
#   array.any?(target)
# end

# def include?(array, target)
#   !(array.all? { |ele| ele != target })
# end

# def include?(array, target)
#   !array.none?(target)
# end

# def include?(array, target)
#   array.count(target) > 0
# end

# def include?(array, target)
#   (array.reject { |ele| ele == target }).size != array.size
# end

# def include?(array, target)
#   !(array.delete_if { |ele| ele != target }.empty?)
# end

# def include?(array, target)
#   array.delete_if { |ele| ele != target }.size > 0
# end

# def include?(array, target)
#   original_size = array.size
#   (array.delete_if { |ele| ele == target }.size) != original_size
# end

# def include?(array, target)
#   array.intersection([target]).size > 0
# end

# def include?(array, target)
#   (array << target).uniq! != nil
# end

# def include?(array, target)
#   (array << target).uniq.size != array.size
# end

# p include?([1,2,3,4,5], 3) == true
# p include?([1,2,3,4,5], 6) == false
# p include?([], 3) == false
# p include?([nil], nil) == true
# p include?([], nil) == false

### 8 FIND THE DUPLICATE
# def find_dup(array)
#   array.sort.each_cons(2) do |pair|
#     return pair[0] if pair[0] == pair[1]
#   end
# end

# def find_dup(array)
#   array.sort!.each_with_index do |num, idx|
#     return num if num == array[idx + 1]
#   end
# end

# def find_dup(array)
#   array.find { |num| array.count(num) == 2 }
# end

# def find_dup(array)
#   array.each_with_object([]) do |num, seen|
#     return num if seen.include?(num)
#     seen << num
#   end
# end

# def find_dup(array)
#   array.uniq.each do |num|
#     array.delete_at(array.index(num))
#   end
#   array.first
# end

# def find_dup(array)
#   array.sum - array.uniq.sum
# end

# p find_dup([1, 5, 3, 1]) #== 1
# p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
#           38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
#           14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
#           78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
#           89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
#           41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
#           55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
#           85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
#           40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
#           7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) #== 73

### 7 HALVSIES
# def halvsies(array)
#   sub_array1 = array.select.with_index do |_, idx|
#     idx <= (array.size - 1)/2
#   end
#   sub_array2 = array.select.with_index do |_, idx|
#     idx > (array.size - 1)/2
#   end
#   [sub_array1, sub_array2]
# end

# def halvsies(array)
#   left = array[0..((array.size - 1)/2)]
#   right = array[(left.size)..]
#   [left, right]
# end

# def halvsies(array)
#   half = array.size.divmod(2).sum
#   left, right = array.slice(0, half), array.slice(half, array.size - half)
# end

# p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
# p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
# p halvsies([5]) == [[5], []]
# p halvsies([]) == [[], []]

### 6 COMBINING ARRAYS
# def merge(arr1, arr2)
#   arr2.each do |ele|
#     arr1 << ele unless arr1.include?(ele)
#   end
#   arr1
# end

# def merge(arr1, arr2)
#   arr2.inject(arr1, :<<).uniq
# end

# p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

### 5 REVERSED ARRAYS II
# def reverse(array)
#   new_array = []
#   index = array.length - 1
#   until index < 0
#     new_array << array[index]
#     index -= 1
#   end
#   new_array
# end

# def reverse(array)
#   index = array.length - 1
#   array.each_with_object([]) do |_, arr|
#     arr << array[index]
#     index -= 1
#   end
# end

# def reverse(array)
#   array.each_index.with_object([]) do |idx, new_array|
#     new_array << array[(array.length - 1) - idx]
#   end
# end

# def reverse(array)
#   array.reverse_each.with_object([]) do |ele, new_array|
#     new_array << ele
#   end
# end

# def reverse(array)
#   array.inject([]) do |new_array, element|
#     new_array.prepend(element)
#   end
# end

# def reverse(array)
#   array.each_with_object([]) do |element, new_array|
#     new_array.prepend(element)
#   end
# end

# def reverse(arr)
#   arr.inject([], :prepend)
# end

# p reverse([1,2,3,4]) == [4,3,2,1]          # => true
# p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
# p reverse(['abc']) == ['abc']              # => true
# p reverse([]) == []                        # => true

# list = [1, 3, 2]                      # => [1, 3, 2]
# new_list = reverse(list)              # => [2, 3, 1]
# p list.object_id != new_list.object_id  # => true
# p list == [1, 3, 2]                     # => true
# p new_list == [2, 3, 1]                 # => true

### 4 REVERSED ARRAYS I
# def reverse!(array)
#   new_array = []
#   (array.size).times do
#     new_array << array.pop
#   end

#   (new_array.size).times do
#     array << new_array.shift
#   end
#   array
# end

# def reverse!(array)
#   front = 0
#   back = -1
#   until front >= array.size / 2
#     array[front], array[back] = array[back], array[front]
#     front += 1
#     back -= 1
#   end
#   array
# end

# def reverse!(array)
#   left = 0
#   right = array.size - 1
#   until left > right
#     array[left], array[right] = array[right], array[left]
#     left += 1
#     right -= 1
#   end
#   array
# end

# def reverse!(arr)
#   iterations = arr.size / 2 - 1
#   for i in (0..iterations)
#     arr[i], arr[(-i)-1] = arr[(-i)-1], arr[i]
#   end
#   arr
# end

# list = [1,2,3,4,5]
# result = reverse!(list)
# p result == [5, 4, 3, 2, 1] # true
# p list == [5, 4, 3, 2, 1] # true
# p list.object_id == result.object_id # true

# list = %w(a b e d c)
# p reverse!(list) == ["c", "d", "e", "b", "a"] # true
# p list == ["c", "d", "e", "b", "a"] # true

# list = ['abc']
# p reverse!(list) == ["abc"] # true
# p list == ["abc"] # true

# list = []
# p reverse!(list) == [] # true
# p list == [] # true

### 3 FIBONACCI NUMBER LOCATION BY LENGTH
# def find_fibonacci_index_by_length(length)
#   num1, num2 = 1, 1
#   index = 3
#   loop do
#     next_num = num1 + num2
#     return index if next_num.to_s.size >= length
#     index += 1
#     num1, num2 = num2, next_num
#   end
# end

# def find_fibonacci_index_by_length(length)
#   current_pair = [1, 1]
#   index = 3
#   loop do
#     next_num = current_pair.sum
#     return index if next_num.to_s.size >= length
#     index += 1
#     current_pair[0], current_pair[1] = current_pair[1], next_num
#   end
# end

# p find_fibonacci_index_by_length(2) == 7   # 1 1 2 3 5 8 13
# p find_fibonacci_index_by_length(3) == 12  # 1 1 2 3 5 8 13 21 34 55 89 144
# p find_fibonacci_index_by_length(10) == 45
# p find_fibonacci_index_by_length(100) == 476
# p find_fibonacci_index_by_length(1000) == 4782
# p find_fibonacci_index_by_length(10000) == 47847

### 2 DELETE VOWELS
# VOWELS = "aeiouAEIOU"

# def remove_vowels(string_array)
#   string_array.map { |string| string.delete(VOWELS) }
# end

# def remove_vowels(string_array)
#   string_array.map { |string| string.gsub(/[aeiou]/i, "") }
# end

# def remove_vowels(string_array)
#   string_array.map do |string|
#     string.chars.each do |char|
#       char = VOWELS.include?(char) ? "" : char
#     end.join
#   end
# end

# def remove_vowels(string_array)
#   string_array.map do |string|
#     string.chars.map do |char|
#       char = VOWELS.include?(char) ? "" : char
#     end.join
#   end
# end

# def remove_vowels(string_array)
#   string_array.map do |string|
#     new_string = ""
#     string.each_char do |char|
#       new_string << char unless VOWELS.include?(char)
#     end
#     new_string
#   end
# end

# def remove_vowels(string_array)
#   string_array.map do |string|
#     string.each_char.with_object("") do |char, new_string|
#       new_string << char unless VOWELS.include?(char)
#     end
#   end
# end

# p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

### 1 CUTE ANGLES
# DEGREE = "\xC2\xB0"
# MINUTES_PER_DEGREE = 60
# SECONDS_PER_MINUTE = 60
# SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

# def dms(degrees_float)
#   total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
#   degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
#   minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
#   format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
# end

# # def dms(angle)
# #   degrees = angle
# #   minutes = (degrees % 1) * 60
# #   seconds = (minutes % 1) * 60
# #   %Q(%(#{sprintf("%d", degrees)}°#{sprintf("%02d", minutes)}'#{sprintf("%02d", seconds)}\"))
# # end

# puts dms(30) #== %(30°00'00")
# puts dms(76.73) #== %(76°43'48")
# puts dms(254.6) #== %(254°36'00")
# puts dms(93.034773) #== %(93°02'05")
# puts dms(0) #== %(0°00'00")
# puts dms(360) #== %(360°00'00") || dms(360) == %(0°00'00")
