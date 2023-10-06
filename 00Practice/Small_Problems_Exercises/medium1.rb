### 6 STACK MACHINE INTERPRETATION
OPERATORS = {
  'ADD', => :+
  'SUB', => :-
  'MULT', => :*
  'DIV', => :/
  'MOD' => :%
}

def minilang(instructions)
  register = 0
  stack = []
  instructions.split.each do |instruction|
    case instruction
    when 'PUSH'   then stack << register

    when 'ADD'    then register += stack.pop
    when 'SUB'    then register -= stack.pop
    when 'MULT'   then register *= stack.pop
    when 'DIV'    then register /= stack.pop
    when 'MOD'    then register %= stack.pop

    when 'POP'    then register = stack.pop
      
    when 'PRINT'  then puts register
    else register = instruction.to_i
    end
  end
  p register
  p stack
end

(3 + (4 * 5) - 7) / (5 % 3)
(3 + (20) - 7) / 2
16 / 4

[3, 4, 5, 7, 5, 3]
3 PUSH #  3 : [3]
5 MOD #   2 : []
PUSH #    2 : [2]

3 PUSH #  3 : [2, 3]
4 PUSH #  4 : [2, 3, 4]
5 MULT # 20 : [2, 3]
ADD #    23 : [2]
PUSH #   23 : [2, 23]
7 SUB #  16 : 

7 SUB #   [], 16

PUSH #    [16], 16
3 PUSH #  [16, 3], 3
5 MOD #   [16], 2

 
# minilang('PRINT') # 0
# minilang('5 PUSH 3 MULT PRINT') # 15
# minilang('5 PRINT PUSH 3 PRINT ADD PRINT') # 5 # 3 # 8
# minilang('5 PUSH POP PRINT') # 5
# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # 5 # 10 # 4 # 7
# minilang('3 PUSH PUSH 7 DIV MULT PRINT ') # 6
# minilang('4 PUSH PUSH 7 MOD MULT PRINT ') # 12
# minilang('-3 PUSH 5 SUB PRINT') # 8
minilang('6 PUSH')

### 5 DIAMONDS!
### initial solution
def diamond(max_width)
  rows = get_rows(max_width)
  display_diamond(rows)
end

def get_rows(max_width)
  row_widths = get_row_widths(max_width)
  row_widths.map { |row_width| ('*' * row_width).center(max_width) }
end

def get_row_widths(max_width)
  top_row_widths = (1..max_width).step(2).to_a
  bottom_row_widths = (top_row_widths - [max_width]).reverse
  top_row_widths + bottom_row_widths
end

def display_diamond(rows)
  rows.each { |row| puts row }
end

# diamond(1)
# diamond(3)
# diamond(9)
# ###

# ### hollow diamond solution
# def hollow_diamond(max_width)
#   rows = get_rows(max_width)
#   display_diamond(rows)
# end

# def get_rows(max_width)
#   row_widths = get_row_widths(max_width)
#   rows = row_widths.map { |width| width == 1 ? '*' : "*#{' ' * (width - 2)}*" }
#   rows.map { |row| row.center(max_width) }
# end

# def get_row_widths(max_width)
#   top_row_widths = (1..max_width).step(2).to_a
#   bottom_row_widths = (top_row_widths - [max_width]).reverse
#   top_row_widths + bottom_row_widths
# end

# def display_diamond(rows)
#   rows.each { |row| puts row }
# end

# hollow_diamond(1)
# hollow_diamond(3)
# hollow_diamond(9)
###

### choice solution
# def diamond(max_width, hollow: false)
#   rows = get_rows(max_width, hollow)
#   display_diamond(rows)
# end

# def get_rows(max_width, hollow)
#   row_widths = get_row_widths(max_width)
#   rows = hollow ? get_hollow_rows(row_widths) : get_filled_rows(row_widths)
#   rows.map { |row| row.center(max_width) }
# end

# def get_row_widths(max_width)
#   ((1...max_width).to_a + max_width.downto(1).to_a).select(&:odd?)
# end

# def get_hollow_rows(row_widths)
#   row_widths.map { |width| width == 1 ? '*' : "*#{' ' * (width - 2)}*" }
# end

# def get_filled_rows(row_widths)
#   row_widths.map { |row_width| '*' * row_width }
# end

# def display_diamond(rows)
#   rows.each { |row| puts row }
# end

# diamond(1)
# diamond(3)
# diamond(9)
# diamond(1, hollow: true)
# diamond(3, hollow: true)
# diamond(9, hollow: true)

### 4 1000 LIGHTS
### initial solution
# def toggle_lights(number_of_lights)
#   switches = (1..number_of_lights).map { |switch| [switch, false]}.to_h
#   1.upto(number_of_lights) do |round_number|
#     (round_number..number_of_lights).step(round_number) do |switch|
#       switches[switch] = !switches[switch]
#     end
#   end
#   switches.keys.select { |switch| switches[switch] }
# end

# p toggle_lights(100)
###


# ## refactored, with (a lot of) helper methods
# def toggle_lights(number_of_lights)
#   switches = initialize_switches(number_of_lights)
#   toggle_switches!(switches)
#   get_on_lights(switches)
# end

# def initialize_switches(number_of_lights)
#   (1..number_of_lights).map { |switch| [switch, false]}.to_h
# end

# def toggle_switches!(switches)
#   1.upto(switches.size) do |round_number|
#     step_through_switches(round_number, switches)
#   end
# end

# def step_through_switches(factor, switches)
#   (factor..switches.size).step(factor) do |switch|
#     toggle_one_switch!(switches, switch)
#   end
# end

# def toggle_one_switch!(switches, switch)
#   switches[switch] = !switches[switch]
# end

# def get_on_lights(switches)
#   switches.keys.select { |switch| switches[switch] }
# end

# p toggle_lights(100)
###


### pattern solutions
# def toggle_lights(number_of_lights)
#   lights_on = []
#   current_light = 1
#   until (current_light ** 2) > number_of_lights
#     lights_on << (current_light ** 2)
#     current_light += 1
#   end
#   lights_on
# end

# def toggle_lights(number_of_lights)
#   (1..number_of_lights).filter_map do |current_light| 
#     current_light ** 2 if (current_light ** 2 <= number_of_lights)
#   end
# end

# def toggle_lights(number_of_lights)
#   (1..Integer.sqrt(number_of_lights)).map { |current_light| current_light ** 2 }
# end

# def toggle_lights(number_of_lights)
#   (1..Integer.sqrt(number_of_lights)).map(&:abs2)
# end


# selects the light numbers with an odd number of unique factors
# def toggle_lights(number_of_lights)
#   (1..number_of_lights).select do |light_number|
#     factors = (1..light_number).select { |factor| light_number % factor == 0 }
#     factors.size.odd?
#   end
# end

# def toggle_lights(number_of_lights)
#   (1..number_of_lights).select do |light_number|
#     light_on = false
#     1.upto(light_number) do |factor|
#       light_on = !light_on if light_number % factor == 0
#     end
#     light_on
#   end
# end

# p toggle_lights(100)
###


### using array instead of hash
# def toggle_lights(number_of_lights)
#   switches = Array.new(number_of_lights, false)
#   1.upto(switches.size) do |round|
#     (round..switches.size).step(round) do |switch|
#       index = switch - 1
#       switches[index] = !switches[index]
#     end
#   end
#   switches.map.with_index { |status, idx| (idx + 1) if status }.compact
# end


# def toggle_lights(number_of_lights)
#   switches = Array.new(number_of_lights, false)
#   1.upto(switches.size) do |round|
#     (round..switches.size).step(round) do |switch|
#       index = switch - 1
#       switches[index] = !switches[index]
#     end
#   end
#   switches.filter_map.with_index(1) { |status, idx| idx if status }
#   # switches.filter_map.with_index { |status, idx| (idx + 1) if status }
# end

# p toggle_lights(100)
###


### with text display and rounds ######################### vvvvv
# def toggle_lights(number_of_lights, rounds = number_of_lights)
#   switches = initialize_switches(number_of_lights)
#   display_rounds(switches, rounds)
#   display_final_result(switches, rounds)
# end

# def initialize_switches(number_of_lights)
#   (1..number_of_lights).map { |switch| [switch, false]}.to_h
# end

# def display_rounds(switches, rounds)
#   puts "Begin: All lights start in the off position."
#   1.upto(rounds) do |round|
#     toggle_switches!(switches, round)
#     display_current_status(switches, round)
#   end
# end

# def toggle_switches!(switches, round)
#   (round..switches.size).step(round) do |switch|
#     switches[switch] = !switches[switch]
#   end
# end

# def display_current_status(switches, round)
#   toggled_message = toggled_message(switches, round)
#   off_message = compose_lights_message(switches, 'off')
#   on_message = compose_lights_message(switches, 'on')
#   puts "Round #{round}: #{toggled_message}"
#   puts "  #{off_message}" unless off_message.empty?
#   puts "  #{on_message}" unless on_message.empty?
# end

# def toggled_message(switches, round)
#   toggled_switches = get_toggled_switches(switches, round)
#   toggled_message = compose_toggled_message(toggled_switches)
#   (toggled_switches.empty? ? "No switches are" : "Switch#{toggled_message}") +
#     " toggled."
# end

# def get_toggled_switches(switches, round)
#   (round..switches.size).step(round).map(&:itself)
# end

# def compose_toggled_message(toggled_switches)
#   case toggled_switches.size
#   when 0 then ""
#   when 1 then " #{toggled_switches.first} is"
#   when 2 then "es #{toggled_switches.join(" and ")} are"
#   else "es #{toggled_switches[0..-2].join(", ")}, " +
#     "and #{toggled_switches.last} are"
#   end
# end

# def compose_lights_message(switches, status)
#   group = get_group(switches, status)
#   case group.size
#   when 0 then ""
#   when switches.size then "Every light is now #{status}. "
#   when 1 then "1 light is now #{status}: #{group.last}. "
#   when 2 then "2 lights are now #{status}: #{group.join(" and ")}. "
#   else "#{group.size} lights are now #{status}: " + 
#     "#{group[0..-2].join(", ")}, and #{group.last}. "
#   end
# end

# def get_group(switches, status)
#   switches.keys.select do |switch|
#     status == 'off' ? !switches[switch] : switches[switch]
#   end
# end

# def display_final_result(switches, rounds)
#   on_group = get_group(switches, 'on')
#   lights = "#{switches.size} light" + (switches.size == 1 ? "" : "s")
#   rounds = "#{rounds} round" + (rounds == 1 ? "" : "s")
#   result = result(switches, on_group, 'on')
#   puts
#   puts "With #{lights} and #{rounds}, the result is that #{result}."
#   puts "The return value is: #{on_group}."
# end

# def result(switches, group, status)
#   case group.size
#   when 0 then "no lights are left #{status}"
#   when switches.size then "every light is left #{status}"
#   when 1 then "1 light is left #{status}: #{group.first}"
#   when 2 then "2 lights are left #{status}: #{group.join(" and ")}"
#   else "#{group.size} lights are left #{status}: " + 
#     "#{group[0..-2].join", "}, and #{group.last}"
#   end
# end

# toggle_lights(10, 6)
### with text display and rounds ######################### ^^^^^

# switches = {  1=>false, 2=>false, 3=>false, 4=>true,  5=>true,
#               6=>true, 7=>true, 8=>true, 9=>true, 10=>true  }

####

### 3 ROTATION III
# # initial solution, with a helper method
# def rotate_rightmost_digits(num, n)
#   digits = num.digits.reverse
#   (digits << digits.delete_at(-n)).join.to_i
# end

# def max_rotation(integer)
#   digits = integer.digits.reverse
#   digits.each_index do |idx|
#     integer = rotate_rightmost_digits(integer, digits.size - idx)
#   end
#   integer
# end

# def max_rotation(integer) # LS Solution
#   number_of_digits = integer.digits.size
#   number_of_digits.downto(2) do |num|
#     integer = rotate_rightmost_digits(integer, num)
#   end
#   integer
# end

############ vvv Without a helper method vvv
# def max_rotation(integer)
#   digits = integer.digits.reverse
#   digits.each_index do |idx|
#     digits << digits.delete_at(idx)
#   end.join.to_i
# end

# def max_rotation(integer) # basically LS solution
#   digits = integer.digits.reverse
#   digits.size.downto(2) do |num|
#     digits << digits.delete_at(-num)
#   end
#   digits.join.to_i
# end
############### ^^^ Without a helper method ^^^

# p max_rotation(735291) == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105) == 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146) == 7_321_609_845

################### vvv preserve zeros vvv
### With a helper method
# def rotate_rightmost_elements(array, n)
#   array << array.delete_at(n)
# end

# def max_rotation_with_zeros(integer)
#   digits = integer.digits.reverse
#   digits.each_index do |idx|
#     digits = rotate_rightmost_elements(digits, idx)
#   end.join.to_i
# end

#### Without a helper method
# def max_rotation_with_zeros(integer)
#   digits = integer.digits.reverse
#   digits.each_index do |idx|
#     digits << digits.delete_at(idx)
#   end
#   digits[0] == 0 ? digits.join : digits.join.to_i
# end

######### Daniel Chae vvv
# FE one-liner; works for consecutive zeros in input arg
# def max_rotation_with_zeros(x)
#   (d = x.to_s).size.times.reduce(d) { |d, i| d + (d.slice!(i) || "") }.to_i
# end

# def max_rotation_with_zeros(integer) # above expanded
#   string = integer.to_s
#   string.size.times.reduce(string) do |string, idx|
#     # string + (string.slice!(idx) || "") # is || needed?
#     string << string.slice!(idx)
#   end.to_i
# end

# without using strings
# def max_rotation_with_zeros(x)
#   (d = x.digits.reverse).each_index { |i| d << d.delete_at(i) }.reduce(0) { |y, z| y * 10 + z }
# end

# def max_rotation_with_zeros(integer) # above expanded
#   digits = integer.digits.reverse
#   digits.each_index do |idx|
#     digits << digits.delete_at(idx)
#   end
#   digits.reduce(0) { |sum, digit| sum * 10 + digit }
# end
######## Daniel Chae ^^^

# p max_rotation_with_zeros(735291) == 321579
# p max_rotation_with_zeros(3) == 3
# p max_rotation_with_zeros(35) == 53
# p max_rotation_with_zeros(105) == '015'
# p max_rotation_with_zeros(8_703_529_146) == 7_321_609_845
# p max_rotation_with_zeros(10023) == '02130'
# p max_rotation_with_zeros(10003) == '00130'
######################## ^^^ preserve zeros ^^^


### 2 ROTATION II
######################## vvv using helper method vvv

# def rotate_array(array)
#   array.empty? ? array : array[1..] + array[0, 1]
# end

# def rotate_rightmost_digits(number, n)
#   digits = number.to_s.chars
#   head, tail = digits.partition.with_index { |_, idx| idx < digits.size - n }
#   (head + rotate_array(tail)).join.to_i
# end

# def rotate_rightmost_digits(number, n)
#   digits = number.to_s.chars
#   tail = digits[-n..]
#   (digits - tail + rotate_array(tail)).join.to_i
# end

# def rotate_rightmost_digits(number, n)
#   digits = number.to_s.chars
#   tail = digits.drop(digits.size - n)
#   (digits - tail + rotate_array(tail)).join.to_i
# end

# def rotate_rightmost_digits(number, n)
#   digits = number.digits.reverse
#   digits.size.times.map do |idx|
#     if idx < digits.size - n
#       digits[idx]
#     else
#       idx == digits.size - 1 ? digits[digits.size - n] : digits[idx + 1]
#     end
#   end.join.to_i
# end

# def rotate_rightmost_digits(number, n)
#   digits = number.digits.reverse
#   head = digits.size - n
#   digits.each_index.map do |idx|
#     idx < head ? digits[idx] : digits[(((idx - head) + 1) % n) + head]
#   end.join.to_i
# end

#############

# def rotate_integer(int)
#   (int.to_s[1..] + int.to_s[0, 1]).to_i
# end

# def rotate_rightmost_digits(num, n)
#   tail = num % 10**n
#   num - tail + rotate_integer(tail)
# end

######################## ^^^ using helper method ^^^

######################## vvv no helper method vvv

# def rotate_rightmost_digits(num, n)
#   digits = num.digits.reverse
#   (digits << digits.delete_at(-n)).join.to_i
# end

# def rotate_rightmost_digits(num, n)
#   tail = num % 10**n
#   divisor = 10**(n-1)
#   rotated_tail = ((tail % divisor) * 10) + (tail / divisor)
#   num - tail + rotated_tail
# end

######################## ^^^ no helper method ^^^

########### Daniel Chae
# one-liner; no strings
# def rotate_rightmost_digits(num, n)
#   digits = num.digits.reverse # [7, 3, 5, 2, 9, 1]
#   (digits << digits.delete_at(-n)).reduce(0) do |sum, digit|
#     sum * 10 + digit
#   end
# end
###########

# p rotate_rightmost_digits(735291, 0) == 735291
# p rotate_rightmost_digits(735291, 1) == 735291
# p rotate_rightmost_digits(735291, 2) == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917
# p rotate_rightmost_digits(735291, 7) == 352917


### 1 ROTATION I
# initial solution
# def rotate_array(array)
#   array.each_index.map { |idx| array[(idx == array.size - 1) ? 0 : idx + 1] }
# end

# # basically the LS solution modified to handle empty arrays
# def rotate_array(array)
#   array.empty? ? array : array[1..] << array[0]
# end

# # similar approach as initial solution
# def rotate_array(array)
#   array.each_index.with_object(Array.new(array.size)) do |idx, result|
#     result[idx - 1] = array[idx]
#   end
# end

# # also similar, but with negative indexing instead
# def rotate_array(array)
#   array.each_index.map { |idx| array[idx - (array.size - 1)] }
# end

# # using modulo to get target indexes
# def rotate_array(array)
#   new_indexes = (1..array.size).map { |num| num % array.size }
#   new_indexes.map { |idx| array[idx] }
# end

# # same concept as above but more concise
# def rotate_array(array)
#   array.each_index.map { |idx| array[(idx+1) % array.size] }
# end

# # a couple of non-iterative solutions
# def rotate_array(array)
#   array.drop(1) + array.take(1)
# end

# def rotate_array(array)
#   first, *rest = array # if array is empty, first will equal nil
#   first ? rest << first : array
# end

# p rotate_array([1, 2, 3, 4, 5, 6]) == [2, 3, 4, 5, 6, 1]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']
# p rotate_array([]) == []

# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true

###################################
# def rotate_object(object)
#   case object
#   when Array, String
#     object.empty? ? object : object[1..] + object[0, 1]
#   when Hash
#     rotate_object(object.to_a).to_h
#   when Integer
#     rotate_object(object.to_s).to_i
#   else
#     "Unable to rotate this type of object."
#   end
# end

# array = [1, 2, 3]
# p rotate_object([]) == []
# p rotate_object(array) == [2, 3, 1]
# p array == [1, 2, 3]
# puts
# string = '123'
# p rotate_object('') == ''
# p rotate_object(string) == '231'
# p string == '123'
# puts
# hash = {a: 1, b: 2, c: 3}
# p rotate_object({}) == {}
# p rotate_object(hash) == {b: 2, c: 3, a: 1}
# p hash == {a: 1, b: 2, c: 3}
# puts
# integer = 123
# p rotate_object(0) == 0
# p rotate_object(integer) == 231
# p integer == 123
# puts
# p rotate_object(102) # => 21
# p rotate_object(1.2) # => "Unable to rotate this type of object."
