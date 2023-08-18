### 11 HOW MANY
# def count_occurrences(array)
#   array.tally.each { |type, count| puts "#{type} => #{count}" }
# end

# def count_occurrences(array)
#   counts = {}
#   array.uniq.each { |type| counts[type] = array.count(type) }
#   counts.each { |type, count| puts "#{type} => #{count}" }
# end

# def count_occurrences(arr)
#   occs = arr.uniq.each_with_object({}) {|ele, occs| occs[ele] = arr.count(ele)}
#   occs.each { |type, count| puts "#{type} => #{count}" }
# end

# def count_occurrences(arr)
#   occs = arr.each_with_object(Hash.new(0)) { |type, occs| occs[type] += 1 }
#   occs.each { |type, count| puts "#{type} => #{count}" }
# end

# def count_occurrences(array)
#   array.map(&:downcase).tally.each { |type, count| puts "#{type} => #{count}" }
# end

# def count_occurrences(array)
#   occurrences = {}
#   types = array.map(&:downcase)
#   types.uniq.each { |type| occurrences[type] = types.count(type) }
#   occurrences.each { |type, count| puts "#{type} => #{count}" }
# end

# def count_occurrences(array)
#   types = array.map(&:downcase)
#   occurrences = types.each_with_object(Hash.new(0)) do |type, occurrences| 
#     occurrences[type] += 1
#   end
#   occurrences.each { |type, count| puts "#{type} => #{count}" }
# end

# def count_occurrences(array)
#   types = array.map(&:downcase)
#   types.uniq.each { |type| puts "#{type} => #{types.count(type)}" }
# end

# vehicles = [
#   'Car', 'car', 'TRUCK', 'CAR', 'SUV', 'truck',
#   'motorcycle', 'Motorcycle', 'car', 'truck', 'suv'
# ]

# count_occurrences(vehicles)

### 10 THE END IS NEAR BUT NOT HERE
# def middle_word(sentence)
#   words = sentence.split
#   middle_index = (words.size / 2.0).ceil - 1
#   words.empty? ? '' : words[middle_index]
# end

# p middle_word('Launch School is great!') == 'School'
# p middle_word('Launch School is really great!') == 'is'
# p middle_word('middle') == 'middle'
# p middle_word(' ') == ''
# p middle_word('') == ''

# def middle_word(sentence) # if even return first word in second half
#   words = sentence.split
#   middle_index = words.size / 2
#   words.empty? ? '' : words[middle_index]
# end

# p middle_word('Launch School is really great!') == 'is'
# p middle_word('Launch School is great!') == 'is'
# p middle_word('middle') == 'middle'
# p middle_word(' ') == ''
# p middle_word('') == ''
# puts

# def middle_word(sentence)
#   words = sentence.split
#   middle_index = (words.size / 2.0).ceil - 1
#   number = words.size.even? ? 2 : 1 
#   words.empty? ? '' : words[middle_index, number].join(' ')
# end

# p middle_word('Launch School is great!') == 'School is'
# p middle_word('Launch School is really great!') == 'is'
# p middle_word('middle') == 'middle'
# p middle_word(' ') == ''
# p middle_word('') == ''

# def penultimate(sentence)
#   sentence.split[-2]
# end

# def penultimate(string)
#   clean_string = string.strip.squeeze(' ')
#   spaces = []
#   clean_string.chars.each_with_index do |char, idx|
#     spaces << idx if char == ' '
#   end
#   start = spaces.size < 2 ? 0 : spaces[-2] + 1
#   clean_string[start...spaces[-1]]
# end

# p penultimate('last word') == 'last'
# p penultimate('Launch School is great!') == 'is'
# p penultimate(' last word') == 'last'
# p penultimate('Launch School is great! ') == 'is'
# p penultimate('last   word') == 'last'
# p penultimate('last') == 'last'
# p penultimate(' ') == ''
# p penultimate('') == ''

### 9 MULTIPLY ALL PAIRS
# def multiply_all_pairs(arr1, arr2)
#   arr1.product(arr2).map { |pair| pair.inject(:*) }.sort
# end

# def multiply_all_pairs(arr1, arr2)
#   arr1.each_with_object([]) do |arr1_num, result|
#     arr2.each do |arr2_num|
#       result << arr2_num * arr1_num
#     end
#   end.sort
# end

# def multiply_all_pairs(arr1, arr2)
#   arr1.each_with_object([]) { |n1, res| arr2.each { |n2| res << n2 * n1 } }.sort
# end

# def multiply_all_pairs(arr1, arr2)
#   arr1.map { |num1| arr2.map { |num2| num1 * num2 } }.flatten.sort
# end

# p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

### 8 MULTIPLY LISTS
# def multiply_list(arr1, arr2)
#   arr1.map.with_index { |num, idx| num * arr2[idx] }
# end

# def multiply_list(arr1, arr2)
#   arr1.each_index.map { |idx| arr1[idx] * arr2[idx] }
# end

# def multiply_list(arr1, arr2)
#   arr1.zip(arr2).map { |pair| pair.reduce(:*) }
# end

# def multiply_list(arr1, arr2)
#   arr1.each_with_index.with_object([]) do |(num, idx), result|
#     result << (num * arr2[idx])
#   end
# end

# def multiply_list(arr1, arr2)
#   arr1.each_index.with_object([]) do |idx, result|
#     result << (arr1[idx] * arr2[idx])
#   end
# end

# p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

### 7 MULTIPLICATIVE AVERAGE
# def show_multiplicative_average(array)
#   result = array.reduce(:*) / array.size.to_f
#   puts "The result is #{format("%.3f", result)}"
# end

# def show_multiplicative_average(array)
#   result = array.reduce(:*).fdiv(array.size)
#   puts "The result is #{format("%.3f", result)}"
# end

# show_multiplicative_average([3, 5])                # => result: 7.500
# show_multiplicative_average([6])                   # => result: 6.000
# show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => result: 28361.667

### 6 STAGGERED CAPS II
# UPPER = ('A'..'Z').to_a
# LOWER = ('a'..'z').to_a

# def staggered_case(string, upper: true)
#   string.chars.each_with_object('') do |char, result|
#     next result << char unless (UPPER + LOWER).include?(char)
#     result << (upper ? char.upcase : char.downcase)
#     upper = !upper
#   end
# end

# def staggered_case(string, upper = true)
#   string.chars.each_with_object('') do |char, result|
#     next result << char unless (char.count('^A-Za-z') == 0)
#     result << (upper ? char.upcase : char.downcase)
#     upper = !upper
#   end
# end

# def staggered_case(string, upper = true)
#   string.chars.each_with_object('') do |char, result|
#     next result << char unless char =~ /[a-z]/i
#     result << (upper ? char.upcase : char.downcase)
#     upper = !upper
#   end
# end

# def staggered_case(string, start_upper: true, count_non_alpha: true)
#   string.chars.each_with_object('') do |char, result|
#     if count_non_alpha
#       result << (start_upper ? char.upcase : char.downcase)
#     else
#       next result << char unless char =~ /[a-z]/i
#       result << (start_upper ? char.upcase : char.downcase)
#     end
#     start_upper = !start_upper
#   end
# end

# p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# p staggered_case('ALL_CAPS') == 'AlL_CaPs'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# p staggered_case('I Love Launch School!', count_non_alpha: false) == 'I lOvE lAuNcH sChOoL!'
# p staggered_case('ALL CAPS', count_non_alpha: false) == 'AlL cApS'
# p staggered_case('ignore 77 the 444 numbers', count_non_alpha: false) == 'IgNoRe 77 ThE 444 nUmBeRs'

# p staggered_case('I Love Launch School!', start_upper: false) == "i lOvE LaUnCh sChOoL!"
# p staggered_case('ALL_CAPS', start_upper: false) == "aLl_cApS"
# p staggered_case('ignore 77 the 444 numbers', start_upper: false) == "iGnOrE 77 tHe 444 nUmBeRs"

### 5 STAGGERED CAPS I
# def staggered_case(str)
#   str.each_char.with_index.map do |char, idx|
#     idx.even? ? char.upcase : char.downcase
#   end.join
# end

# UPPERCASE = ('A'..'Z').to_a
# LOWERCASE = ('a'..'z').to_a
# UPPER_TO_LOWER = UPPERCASE.zip(LOWERCASE).to_h

# def staggered_case(string)
#   string.each_char.with_index.map do |char, idx|
#     next char unless (UPPERCASE + LOWERCASE).include?(char)
#     if idx.even?
#       LOWERCASE.include?(char) ? UPPER_TO_LOWER.key(char) : char
#     else
#       UPPERCASE.include?(char) ? UPPER_TO_LOWER[char] : char
#     end
#   end.join
# end

# def staggered_case(string, start_upper: true)
#   string.chars.each_with_object('') do |char, result|
    # result << (start_upper ? char.upcase : char.downcase)
    # start_upper = !start_upper
#   end
# end

# p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# p staggered_case('ALL_CAPS') == 'AlL_CaPs'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# p staggered_case('I Love Launch School!', start_upper: false) == "i lOvE LaUnCh sChOoL!"
# p staggered_case('ALL_CAPS', start_upper: false) == "aLl_cApS"
# p staggered_case('ignore 77 the 444 numbers', start_upper: false) == "iGnOrE 77 tHe 444 nUmBeRs"

###4 SWAP CASE
# UPPERCASE = ('A'..'Z').to_a
# LOWERCASE = ('a'..'z').to_a
# UPPER_TO_LOWER = UPPERCASE.zip(LOWERCASE).to_h
# p UPPER_TO_LOWER

# {
#   "A"=>"a", "B"=>"b", "C"=>"c", "D"=>"d", "E"=>"e", "F"=>"f", "G"=>"g", 
#   "H"=>"h", "I"=>"i", "J"=>"j", "K"=>"k", "L"=>"l", "M"=>"m", "N"=>"n", 
#   "O"=>"o", "P"=>"p", "Q"=>"q", "R"=>"r", "S"=>"s", "T"=>"t", "U"=>"u", 
#   "V"=>"v", "W"=>"w", "X"=>"x", "Y"=>"y", "Z"=>"z"
# }

# def swapcase(str)
#   str.chars.map do |char|
#     if char.upcase == char.downcase
#       char
#     elsif char == char.upcase
#       UPPER_TO_LOWER[char]
#     else
#       UPPER_TO_LOWER.key(char)
#     end
#   end.join
# end

# def swapcase(str)
#   str.chars.map do |char|
#     if UPPERCASE.include?(char)
#       UPPER_TO_LOWER[char]
#     elsif LOWERCASE.include?(char)
#       UPPER_TO_LOWER.key(char)
#     else
#       char
#     end
#   end.join
# end

# def swapcase(str)
#   str.chars.map do |char|
#     next char unless (UPPERCASE + LOWERCASE).include?(char)
#     UPPERCASE.include?(char) ? UPPER_TO_LOWER[char] : UPPER_TO_LOWER.key(char)
#   end.join
# end

# def swapcase(str)
#   str.chars.map {|chr| chr == chr.upcase ? chr.downcase : chr.upcase}.join
# end

# def swapcase(str)
#   str.each_char.map {|chr| chr == chr.upcase ? chr.downcase : chr.upcase}.join
# end

# def swapcase(str)
#   str.split('').map {|chr| chr == chr.upcase ? chr.downcase : chr.upcase}.join
# end

# p swapcase('CamelCase') == 'cAMELcASE'
# p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

###3 CAPITALIZE WORDS
# def word_cap(words)
#   words.split.map(&:capitalize).join(" ")
# end

# def word_cap(words)
#   words.downcase.split.map do |word|
#     word[0] = word[0].upcase
#     word
#   end.join(' ')
# end

# def word_cap(words)
#   words.split.map { |word| word[0].upcase + word[1..].downcase }.join(' ')
# end

# def word_cap(words)
#   words.split.map do |word|
#     word.each_char.with_index.map do |char, idx|
#       idx == 0 ? char.upcase : char.downcase
#     end.join
#   end.join(' ')
# end

# p word_cap('four score and seven') == 'Four Score And Seven'
# p word_cap('the javaScript language') == 'The Javascript Language'
# puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

### 2 LETTERCASE COUNTER
# LOWERCASE = ('a'..'z')
# UPPERCASE = ('A'..'Z')

# def letter_case_count(string)
#   result = { lowercase: 0, uppercase: 0, neither: 0 }
#   string.each_char do |char|
#     if LOWERCASE.include?(char)
#       result[:lowercase] += 1
#     elsif UPPERCASE.include?(char)
#       result[:uppercase] += 1
#     else
#       result[:neither] +=1
#     end
#   end
#   result
# end

# def letter_case_count(string)
#   result = { lowercase: 0, uppercase: 0, neither: 0 }
#   string.each_char.with_object(result) do |char, result|
#     if LOWERCASE.include?(char)
#       result[:lowercase] += 1
#     elsif UPPERCASE.include?(char)
#       result[:uppercase] += 1
#     else
#       result[:neither] +=1
#     end
#   end
# end

# def letter_case_count(string)
#   result = string.each_char.with_object(Hash.new(0)) do |char, result|
#     if LOWERCASE.include?(char)
#       result[:lowercase] += 1
#     elsif UPPERCASE.include?(char)
#       result[:uppercase] += 1
#     else
#       result[:neither] +=1
#     end
#   end
#   [:lowercase, :uppercase, :neither].each do |category| 
#     result[category] = 0 unless result.has_key?(category)
#   end
#   result
# end

# def letter_case_count(string)
#   result = { lowercase: 0, uppercase: 0, neither: 0 }
#   string.each_char.with_object(result) do |char, result|
#     if char.downcase == char.upcase
#       result[:neither] += 1
#     elsif char.downcase == char
#       result[:lowercase] += 1
#     elsif char.upcase == char
#       result[:uppercase] += 1
#     end
#   end
# end

# def letter_case_count(string)
#   result = Hash.new(0)
#   result[:lowercase]  = string.count('a-z')
#   result[:uppercase]  = string.count('A-Z')
#   result[:neither]    = string.count('^A-Za-z')
#   result
# end

# def letter_case_count(string)
#   { lowercase: string.count('a-z'),
#     uppercase: string.count('A-Z'),
#     neither: string.count('^A-Za-z') }
# end

# CASES = {
#   lowercase: ('a-z'),
#   uppercase: ('A-Z'),
#   neither: ('^A-Za-z')
# }
# def letter_case_count(string)
#   CASES.each_with_object({}) do |(key, value), result|
#     result[key] = string.count(value)
#   end
# end

# def letter_case_count(string)
#   categories = [:lowercase, :uppercase, :neither]
#   categories.each_with_object({}) do |cat, result|
#     result[cat] = 
#   end
# end

# p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

### 1 COMBINE TWO LISTS
# def interleave(arr1, arr2)
#   arr1.each_index.with_object([]) do |idx, result|
#     result << arr1[idx] << arr2[idx]
#   end
# end

# def interleave(arr1, arr2)
#   arr1.zip(arr2).flatten
# end

# p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
