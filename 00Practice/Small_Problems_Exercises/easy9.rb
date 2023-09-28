### 6.2 SEQUENCE COUNT
### Daniel Chae
# def sequence(n, x)
#   x.step((n * x == 0 ? (return [x] * n) : n * x), x).to_a
# end
###

# def sequence(count, multiple)
#   return [multiple] * count if multiple == 0
#   limit = multiple * count
#   multiple.step(limit, multiple).to_a
# end

def sequence(count, multiple)
  ([multiple] * count).map.with_index do |element, index|
    element + (index * element)
  end

  # return [multiple] * count if multiple == 0
  # limit = multiple * count
  # multiple.step(limit, multiple).to_a
end

p sequence(5, 1) #== [1, 2, 3, 4, 5]
p sequence(4, -7) #== [-7, -14, -21, -28]
p sequence(3, 0) #== [0, 0, 0]
p sequence(0, 1000000) #== []


# def sequence(count, multiple)
#   multiple.step(by: multiple, to: multiple * count).to_a
# end

# def sequence(count, multiple)
#   (1..count).map { |count| count * multiple }
# end

# def sequence(count, multiple)
#   1.upto(count).map { |count| count * multiple }
# end

# def sequence(count, multiple)
#   count.times.map { |index| multiple + (index * multiple) }
# end

# def sequence(count, multiple)
#   Array.new(count) { |index| (index + 1) * multiple }
# end

# def sequence(count, multiple)
#   Array.new(count) { |index| multiple + (index * multiple) }
# end

# p sequence(5, 1) #== [1, 2, 3, 4, 5]
# p sequence(4, -7) #== [-7, -14, -21, -28]
# p sequence(3, 0) #== [0, 0, 0]
# p sequence(0, 1000000) #== []

### 5.2 NAME SWAPPING
# def swap_name(names)
#   names.split.reverse.join(', ')
# end

# p swap_name('Joe Roberts') == 'Roberts, Joe'

### 4.2 HOW LONG ARE YOU?
# def word_lengths(words)
#   words.split.map { |word| "#{word} #{word.size}" }
# end

# ###
# def word_lengths(words)
#   # stripped = words.strip.squeeze(' ')
#   words_array = split_string(words)
#   words_array.map { |word| "#{word} #{word.size}" }
# end

# def split_string(string)
#   return [] if string.empty?
#   spaces = get_spaces(string)
#   get_words(string, spaces)
# end

# def get_spaces(string)
#   string.chars.each_index.select { |index| string[index] == ' ' }
# end

# def get_words(string, spaces)
#   starts, stops = get_starts_and_stops(string, spaces)
#   starts.map.with_index { |start, index| string[start...stops[index]] }
# end

# def get_starts_and_stops(string, spaces)
#   starts = spaces.map { |index| index + 1 }.prepend(0)
#   stops = spaces << string.length
#   [starts, stops]
# end
# ###
# p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]
# p word_lengths("baseball hot dogs and apple pie") == ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]
# p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]
# p word_lengths("Supercalifragilisticexpialidocious") == ["Supercalifragilisticexpialidocious 34"]
# p word_lengths("") == []

### 3.2 COUNTING UP
# def sequence(number)
#   (1..number).to_a
# end

# def sequence(number)
#   1.upto(number).to_a
# end

# def sequence(number)
#   current_num = 1
#   result = []
#   loop do
#     result << current_num
#     current_num += 1
#     break if current_num > number
#   end
#   result
# end

# p sequence(5) == [1, 2, 3, 4, 5]
# p sequence(3) == [1, 2, 3]
# p sequence(1) == [1]

### 2.2 DOUBLE DOUBLES
# def twice(number)
#   double_number?(number) ? number : number * 2
# end

# def double_number?(number)
#   digits = number.digits
#   half = digits.size / 2
#   digits[0...half] == digits[half..-1]
# end

# def double_number?(number)
#   string = number.to_s
#   half = string.size / 2
#   string[0...half] == string[half..-1]
# end

# def double_number?(number)
#   digits = number.digits
#   half = digits.size / 2
#   digits.take(half) == digits.drop(half)
# end

# p twice(37) == 74
# p twice(44) == 44
# p twice(334433) == 668866
# p twice(444) == 888
# p twice(107) == 214
# p twice(103103) == 103103
# p twice(3333) == 3333
# p twice(7676) == 7676
# p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
# p twice(5) == 10

### 1.2 WELCOME STRANGER
# def greetings(names_array, job_hash)
#   name, job = [names_array, job_hash.values].map { |array| array.join(' ') }
#   "Hello, #{name}! Nice to have a #{job} around."
# end

# p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => "Hello, John Q Doe! Nice to have a Master Plumber around."

### 11 ODD LISTS
# def oddities(array)
#   array.select.with_index { |_, idx| idx.even? }
# end

# def oddities(array)
#   array.each_with_index.with_object([]) do |(ele, idx), result|
#     result << ele if idx.even?
#   end
# end

# def oddities(array)
#   array.each_index.with_object([]) do |idx, result|
#     result << array[idx] if idx.even?
#   end
# end

# def oddities(array)
#   array.map.with_index { |ele, idx| ele if idx.even? }.compact
# end

# def oddities(array)
#   (0...array.size).map { |idx| array[idx] if idx.even? }.compact
# end

# def oddities(array)
#   (0...array.size).step(2).map { |idx| array[idx] }
# end

# def oddities(array) 
#   0.step(array.size - 1, 2).map { |idx| array[idx] }
# end

# p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# p oddities(['abc', 'def']) == ['abc']
# p oddities([123]) == [123]
# p oddities([]) == []
# p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]
# p oddities([1, 1, 1, 1, 1]) == [1, 1, 1]
# p oddities([0, 1, 1, 1, 1]) == [0, 1, 1]

### 10 SUM OF DIGITS
# def sum(num)
#   num.to_s.chars.map(&:to_i).sum
# end

# def sum(num)
#   num.to_s.each_char.map(&:to_i).sum
# end

# def sum(num)
#   num.digits.sum
# end

# def sum(num)
#   string = num.to_s
#   sum = 0
#   (0...string.size).each { |idx| sum += string[idx].to_i }
#   sum
# end

# def sum(num)
#   string = num.to_s
#   sum = 0
#   string.size.times { |idx| sum += string[idx].to_i }
#   sum
# end

# def sum(num)
#   string = num.to_s
#   (0...string.size).each.inject(0) { |sum, idx| sum += string[idx].to_i }
# end

# def sum(num)
#   string = num.to_s
#   string.size.times.inject(0) { |sum, idx| sum += string[idx].to_i }
# end

# def sum(num)
#   string = num.to_s
#   string.size.times.with_object([]) do |_, result|
#     num, remainder = num.divmod(10)
#     result << remainder
#   end.sum
# end

# def sum(num)
#   num.to_s.size.times.map do |_|
#     num, remainder = num.divmod(10)
#     remainder
#   end.sum
# end

# p sum(23) #== 5
# p sum(496) #== 19
# p sum(123_456_789) #== 45

### 9 GROUP ANAGRAMS
# words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
#   'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
#   'flow', 'neon']

#########################
# initial solution #1
# def find_all_anagrams(list)
#   list.each_with_object([]) do |word, all_anagrams|
#     next if all_anagrams.flatten.include?(word)
#     sub_anagrams = find_sub_anagrams(list, word)
#     all_anagrams << sub_anagrams unless sub_anagrams.empty?
#   end
# end

# def find_sub_anagrams(list, word1)
#   sublist = list - [word1]
#   sub_anagrams = sublist.each_with_object([]) do |word2, sub_anagrams|
#     sub_anagrams << word2 if is_anagram?(word1, word2)
#   end
#   sub_anagrams.prepend(word1) unless sub_anagrams.empty?
# end

# def is_anagram?(word1, word2)
#   word1.chars.sort == word2.chars.sort
# end

# def display_anagrams(anagrams)
#   anagrams.each { |subarray| p subarray }
# end

# anagrams = find_all_anagrams(words)
# display_anagrams(anagrams)

#########################
# initial solution #2
# def find_all_anagrams(list)
#   list.each_with_index.with_object([]) do |(word1, idx), all_anagrams|
#     next if all_anagrams.flatten.include?(word1)
#     sub_anagrams = find_sub_anagrams(word1, idx, list)
#     all_anagrams << sub_anagrams unless sub_anagrams.empty? 
#   end
# end

# def find_sub_anagrams(word1, idx, list)
#   sub_anagrams = ((idx + 1)...list.size).each_with_object([]) do |idx2, sub_anagrams|
#     sub_anagrams << list[idx2] if is_anagram?(word1, list[idx2])
#   end
#   sub_anagrams.prepend(word1) unless sub_anagrams.empty?
# end

# def is_anagram?(word1, word2)
#   word1.chars.sort == word2.chars.sort
# end

# def display_anagrams(anagrams)
#   anagrams.each { |subarray| p subarray }
# end

# anagrams = find_all_anagrams(words)
# display_anagrams(anagrams)

#########################
# using Enumerable#chunk
# def find_anagrams(list)
#   sorted_list = list.sort_by { |word| word.chars.sort.join }
#   sorted_list.chunk do |word|
#     word.chars.sort.join
#   end.map { |element| element[1] }
# end

# using Enumerable#chunk_while
# def find_anagrams(list)
#   sorted_list = list.sort_by { |word| word.chars.sort.join }
#   sorted_list.chunk_while do |word1, word2|
#     word1.chars.sort.join == word2.chars.sort.join
#   end
# end

# def display_anagrams(anagrams)
#   anagrams.each { |group| p group }
# end

# anagrams = find_anagrams(words)
# display_anagrams(anagrams)

#########################
# LS Solution refactored
# def find_anagrams(list)
#   list.each_with_object({}) do |word, result|
#     group = word.chars.sort.join
#     result.has_key?(group) ? result[group] << word : result[group] = [word]
#   end
# end

# def display_anagrams(anagrams)
#   anagrams.each_value { |value| p value }
# end

# anagrams = find_anagrams(words)
# display_anagrams(anagrams)

#########################
# using Enumerable#group_by
# def find_anagrams(list)
#   list.group_by { |word| word.chars.sort.join }
# end

# def display_anagrams(anagrams)
#   anagrams.each_value { |group| p group }
# end

# anagrams = find_anagrams(words)
# display_anagrams(anagrams)

#########################
# using Array#select #1
# def find_anagrams(list)
#   list.map do |word1|
#     list.select { |word2| word2.chars.sort == word1.chars.sort }.sort
#   end.uniq
# end

# using Array#select #2
# def find_anagrams(list)
#   groups = list.map { |word| word.chars.sort.join }.uniq
#   groups.map do |group|
#     list.select { |word| word.chars.sort.join == group }
#   end
# end

# def display_anagrams(anagrams)
#   anagrams.each { |group| p group }
# end

# anagrams = find_anagrams(words)
# display_anagrams(anagrams)

#########################

### 8 GROCERY LIST
# def buy_fruit(list)
#   list.each_with_object([]) do |(item, quantity), results|
#     quantity.times { results << item }
#   end
# end

# def buy_fruit(list)
#   list.map { |item, quantity| [item] * quantity }.flatten
# end

# def buy_fruit(list)
#   list.flat_map { |item, quantity| [item] * quantity }
# end

# p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) #== 
# ["apples", "apples", "apples", "orange", "bananas","bananas"]

### 7 GRADE BOOK
# def get_grade(score1, score2, score3)
#   average = (score1 + score2 + score3) / 3
#   case average
#   when   (90..) then 'A'
#   when (80..89) then 'B'
#   when (70..79) then 'C'
#   when (60..69) then 'D'
#   else               'F' 
#   end
# end

#########
# GRADES = {  A: (90..),
#             B: (80..89),
#             C: (70..79),
#             D: (60..69),
#             F: (0..59) }

# def get_grade(num1, num2, num3)
#   average = (num1 + num2 + num3) / 3
#   GRADES.keys.each { |grade| return grade.to_s if GRADES[grade].include?(average) }
# end
#############
# def get_grade(*grades)
#   grade_scale = { 
#     A:   (90..), 
#     B: (80..89), 
#     C: (70..79), 
#     D: (60..69), 
#     F:  (0..59) 
#   }
#   average = grades.sum / grades.size
#   grade_scale.keys.each do |letter|
#     return letter.to_s if (grade_scale[letter]).include?(average)
#   end
# end
###########
# GRADE_SCALE = { A: (90..),
#                 B: (80..89),
#                 C: (70..79),
#                 D: (60..69),
#                 F: (0..59) }
# # def get_grade(*scores)
# #   GRADE_SCALE.find do |grade, range|
# #     range.include?(scores.sum / scores.size)
# #   end.first.to_s
# # end

# def get_grade(*scores)
#   average = (scores.sum / scores.size.to_f).round
#   GRADE_SCALE.each do |grade, range|
#     return grade.to_s if range.include?(average)
#   end
# end
# # ############/
# p get_grade(60, 60, 59)
# p get_grade(95, 90, 93) == "A"
# p get_grade(50, 50, 95) == "D"

### 6 SEQUENCE COUNT
# def sequence(count, num)
#   (1..count).map { |multiplier| num * multiplier }
# end

# def sequence(count, first)
#   count.times.each_with_object([]) do |idx, result|
#     result[idx] = first + (idx * first)
#   end
# end

# def sequence(count, num)
#   count.times.map { |idx| num + (idx * num) }
# end

# def sequence(count, first)
#   first.step(by: first).take(count)
# end

# one-liner with step for fun (Daniel Chae) VVVVV
# def sequence(n, x)
#   x.step((n * x == 0 ? (return [x] * n) : n * x), x).to_a
# end

# def sequence(count, first)
#   limit = count * first == 0 ? (return [first] * count) : count * first
#   first.step(limit, first).to_a
# end
# one-liner with step for fun (Daniel Chae) ^^^^

# p sequence(5, 1) #== [1, 2, 3, 4, 5]
# p sequence(4, -7) #== [-7, -14, -21, -28]
# p sequence(3, 0) #== [0, 0, 0]
# p sequence(0, 1000000) #== []

### 5 NAME SWAPPING
# def swap_name(name)
#   name.split.reverse.join(", ")
# end

# def swap_name(name)
#   "#{name.split[1]}, #{name.split[0]}"
# end

# def swap_name(full_name)
#   name_array = full_name.split.reverse
#   name_array.each_index.with_object("") do |idx, swapped_name|
#     swapped_name << name_array[idx]
#     swapped_name << ", " if idx == 0
#   end
# end

# p swap_name('Joe Roberts') == 'Roberts, Joe'

### 4 HOW LONG ARE YOU?
# def word_lengths(string)
#   string.split.map { |word| "#{word} #{word.size}" }
# end

###############
# def word_lengths(string)
#   words = get_words(string)
#   words.map { |word| "#{word} #{word.size}" }
# end

# def get_words(string)
#   spaces = find_spaces(string)
#   spaces += [string.size] unless string.empty?
#   start = 0
#   spaces.each_index.with_object([]) do |idx, result|
#     stop = spaces[idx]
#     result << string[start...stop]
#     start = stop + 1
#   end
# end

# def find_spaces(string)
#   string.chars.each_with_index.with_object([]) do |(char, idx), spaces|
#     spaces << idx if char == ' '
#   end
# end
####################

# p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]
# p word_lengths("baseball hot dogs and apple pie") == ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]
# p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]
# p word_lengths("Supercalifragilisticexpialidocious") == ["Supercalifragilisticexpialidocious 34"]
# p word_lengths("") == []

### 3 COUNTING UP
# def sequence(num)
#   (1..num).to_a
# end

# def sequence(num)
#   1.upto(num).to_a
# end

# def sequence(num)
#   num > 0 ? (1..num).to_a : (num..-1).to_a
# end

# def sequence(num)
#   return [0] if num == 0
#   num.positive? ? 1.upto(num).to_a : -1.downto(num).to_a
# end

# p sequence(5) == [1, 2, 3, 4, 5]
# p sequence(3) == [1, 2, 3]
# p sequence(1) == [1]
# p sequence(0) == []
# p sequence(-1) == [-1]
# p sequence(-5) == [-5, -4, -3, -2, -1]

### 2 DOUBLE DOUBLES
# def twice(num)
#   str = num.to_s
#   half = str.size / 2
#   str[...half] == str[half..] ? num : num * 2
# end

# def twice(num)
#   array = num.to_s.chars
#   half = array.size / 2
#   array.take(half) == array.drop(half) ? num : num * 2
# end

# def twice(num) # by Shawn Grycki
#   array = num.to_s.chars
#   half = array.size / 2
#   array1, array2 = array.partition.with_index { |_, idx| idx < array.length / 2 }
#   array1 == array2 ? num : num * 2
# end

# def twice(num)
#   array = num.to_s.chars
#   half = (array.size / 2.0).ceil
#   half.times.all? { |idx| array[idx] == array[idx + half] } ? num : num * 2
# end

# p twice(37) == 74
# p twice(44) == 44
# p twice(334433) == 668866
# p twice(444) == 888
# p twice(107) == 214
# p twice(103103) == 103103
# p twice(3333) == 3333
# p twice(7676) == 7676
# p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
# p twice(5) == 10

### 1 WELCOME STRANGER
# def greetings(name, info)
#   "Hello, #{name.join(' ')}! " +
#   "Nice to have a #{info.values.join(' ')} around."
# end

# p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
#=> "Hello, John Q Doe! Nice to have a Master Plumber around."
