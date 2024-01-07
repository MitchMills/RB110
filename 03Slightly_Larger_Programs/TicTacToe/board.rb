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

LINES_DATA = {
  empty:    {pattern: [:fill, :mark, :fill], fill: (' ' * 2), mark: ' ', limit: '|'},
  marked:   {pattern: [:fill, :mark, :fill], fill: (' ' * 2), mark: '?', limit: '|'},
  numbered: {pattern: [:fill, :fill, :mark], fill: (' ' * 2), mark: ' ', limit: '|'},
  lined:    {pattern: [:fill, :mark, :fill], fill: ('-' * 2), mark: '-', limit: '+'}
}

# board display methods
def display_board(board)
  puts
  (0..2).each { |row_number| puts row(row_number, board) }
  puts
end

def row(row_number, board)
  pattern  = [:empty, :marked, :numbered]
  row = pattern.map { |line_type| full_line(line_type, row_number, board) }
  row_number < 2 ? row << full_line(:lined, row_number, board) : row
end

def full_line(line_type, row_number, board)
  all_squares = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  row_squares = all_squares[row_number]
  row_squares.map { |square_num| sub_line(line_type, square_num, board) }.join
end

def sub_line(line_type, square_num, board)
  elements = LINES_DATA[line_type]
  sub_line = elements[:pattern].map { |type| elements[type] }.join

  sub_line[2] = board[square_num] if line_type == :marked

  sub_line[4] = square_num.to_s if (line_type == :numbered) && 
    (empty_squares(board).include?(square_num))

  square_num % 3 == 0 ? sub_line : sub_line << elements[:limit]
end

# game setup methods
def new_board
  ALL_SQUARES.map { |square| [square, EMPTY_MARK] }.to_h
end


# gameplay methods
def empty_squares(board)
  board.select { |square, mark| mark == EMPTY_MARK }.keys
end



board = {1=>"X", 2=>"O", 3=>" ", 4=>" ", 5=>"O", 6=>"O", 7=>"X", 8=>" ", 9=>" "}
display_board(board)
# p row(1, board)
# p full_line(:numbered, 1, board)
# p sub_line(:numbered, 5, board)
# puts
# p sub_line(:numbered, 6, board)
p empty_squares(board)
