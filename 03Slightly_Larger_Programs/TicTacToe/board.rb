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

LINE_TYPES = {
  empty:    {pattern: [:fill, :mark, :fill], fill: (' ' * 2), mark: ' ', limit: '|'},
  marked:   {pattern: [:fill, :mark, :fill], fill: (' ' * 2), mark: '?', limit: '|'},
  numbered: {pattern: [:fill, :fill, :mark], fill: (' ' * 2), mark: '#', limit: '|'},
  lined:    {pattern: [:fill, :mark, :fill], fill: ('-' * 2), mark: '-', limit: '+'}
}

def sub_line(line_type, square_num, board)
  elements = LINE_TYPES[line_type]
  elements[:mark] = board[square_num] if line_type == :marked
  elements[:mark] = square_num.to_s if line_type == :numbered
  sub_line = elements[:pattern].map { |type| elements[type] }.join
  square_num % 3 == 0 ? sub_line : sub_line << elements[:limit]
end

def full_line(line_type, squares, board)
  squares.map { |square_number| sub_line(line_type, square_number, board) }.join
end

def row(row_number, board)
  squares = case row_number
            when 1 then [1, 2, 3]
            when 2 then [4, 5, 6]
            when 3 then [7, 8, 9]
            end
  row = [:empty, :marked, :numbered].map { |line_type| full_line(line_type, squares, board) }
  row_number < 3 ? row << full_line(:lined, squares, board) : row
end

def display_board(board)
  (1..3).each { |row_number| puts row(row_number, board) } # could be (1..3)???
end

# game setup methods
def new_board
  ALL_SQUARES.map { |square| [square, EMPTY_MARK] }.to_h
end

# board = new_board
# p new_board

board = {1=>"X", 2=>" ", 3=>" ", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}
display_board(board)
#TODO: get board information into display methods (mark, square number)


