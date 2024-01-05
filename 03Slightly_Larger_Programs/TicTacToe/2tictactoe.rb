PLAYER_MARK = 'X'
COMPUTER_MARK = 'O'
EMPTY_MARK = ' '

ALL_SQUARES = ('1'..'9').to_a

# game setup methods
def new_board
  ALL_SQUARES.map { |square| [square, EMPTY_MARK] }.to_h
end


# board display methods
def display_board(board)
  row(%w(1 2 3), board)
  row(%w(4 5 6), board)
  row(%w(7 8 9), board)
end

def row(spaces, board)
  empty_line
  marked_line(spaces, board)
  empty_line
  horizontal_line unless spaces.first.to_i > 6
end

def empty_line
  puts "     |     |"
end

def marked_line(spaces, board)
  marks = spaces.map { |space| board[space] }
  puts "  #{marks[0]}  |  #{marks[1]}  |  #{marks[2]}"
end

def horizontal_line
  puts "-----+-----+-----"
end

# gameplay methods
def empty_squares(board)
  board.select { |square, mark| mark == EMPTY_MARK }.keys
end


# main game loop
# intro
# round
# win?
# outro

# board = new_board
# p new_board

board = {"1"=>"X", "2"=>"O", "3"=>" ", "4"=>" ", "5"=>" ", "6"=>" ", "7"=>" ", "8"=>"X", "9"=>" "}
display_board(board)
p empty_squares(board)


# display_board(board)
