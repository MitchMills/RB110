PLAYER_MARK = 'X'
COMPUTER_MARK = 'O'
EMPTY_MARK = ' '

ALL_SQUARES = (1..9).to_a
CORNER_SQUARES = [1, 3, 7, 9]
CENTER_SQUARE = [5]

WINNING_LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9],  # horizontal
  [1, 4, 7], [2, 5, 8], [3, 6, 9],  # vertical
  [1, 5, 9], [3, 5, 7]              # diagonal
]

# game setup methods
def new_board
  ALL_SQUARES.map { |square| [square, EMPTY_MARK] }.to_h
end


# board display methods
def display_board(board)
  row(0, board)
  row(1, board)
  row(2, board)
end

def row(row_number, board)
  empty_line
  marked_line(row_number, board)
  numbered_line(row_number, board)
  horizontal_line unless row_number == 2
end

def empty_line
  puts "     |     |"
end

def marked_line(row_number, board)
  marks = (1..3).map do |num|
    square = num + (3 * row_number)
    board[square]
  end
  puts "  #{marks[0]}  |  #{marks[1]}  |  #{marks[2]}"
end

def numbered_line(row_number, board)
  numbers = (1..3).map do |num|
    square = num + (3 * row_number)
    empty_squares(board).include?(square) ? square : ' '
  end
  puts "    #{numbers[0]}|    #{numbers[1]}|    #{numbers[2]}"
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
board = {1=>"X", 2=>" ", 3=>" ", 4=>" ", 5=>" ", 6=>"O", 7=>" ", 8=>"X", 9=>" "}
display_board(board)

