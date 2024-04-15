### BANNERIZER
=begin
PROBLEM
input: string
  - can be empty

output: printed to terminal (text surrounded by box)
  top / bottom of box: '+----+'
  sides of box: '| (text) |'

DATA STRUCTURES
- input: string
  - pattern array: horizontal, blank, text, blank, horizontal
  - array to hold all strings
- output: multiple string printed on separate lines

ALGORITHM
- get the length of the input string
- create a pattern array: %w(horizontal, blank, text, blank, horizontal)
- transform pattern array:
  - if horizontal:
    - '+' + '-' * (length + 2) + '-'
  - if blank:
    - '|' + ' ' * (length + 2) + '|'
  - if text:
    - '|' + " #{text} " + '|'
- puts transformed array to terminal

=end

def print_in_box(text)
  width = text.size + 2
  box_pattern = %w(horizontal blank text blank horizontal)
  box = box_pattern.map do |line|
    case line
    when 'horizontal' then "+#{'-' * width}+"
    when 'blank' then "|#{' ' * width}|"
    when 'text' then "| #{text} |"
    end
  end
  puts box
end

print_in_box('')
