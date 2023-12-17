def initialize_board
  (1..9).each_with_object({}) { |square, board| board[square] = ' ' }
end

def display_board(board)
  puts
  puts "     |     |     "
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}  "
  puts "     |     |     "
end

board = initialize_board
display_board(board)


     |     |
     |     |
     |     |
-----+-----+-----
     |     |
     |     |
     |     |
-----+-----+-----
     |     |
     |     |
     |     |



pattern = [space, line, space, line, space]

empty_row_multiples = [5, 1]
space, line = [' ', '|']
empty_row =   "     |     |     "

space = [space, mark, space]
marked_row_multiples = [2, 1]
space, line = [' ', '|']
marked_row =  "  X  |  X  |  X  "

line_multiples = [5, 1]
space, line = ['-', '+']
line =        "-----+-----+-----"

column_pattern = [empty_row, marked_row, empty_row]

big_row = [column, line, column, line, column]

board_pattern = [big_row, line, big_row, line, big_row]



  



p board_dimensions
