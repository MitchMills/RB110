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

BOARD_ELEMENTS = {
  empty:    {pattern: [:fill, :mark, :fill], fill: 'ee', mark: 'x', limit: '|'},
  marked:   {pattern: [:fill, :mark, :fill], fill: 'mm', mark: 'X', limit: '|'},
  numbered: {pattern: [:fill, :fill, :mark], fill: 'nn', mark: '#', limit: '|'},
  lined:     {pattern: [:fill, :mark, :fill], fill: '--', mark: '-', limit: '+'}
}

def subline(line_type, square_num)
  pattern = BOARD_ELEMENTS[line_type][:pattern]
  subline = pattern.map do |type|
    BOARD_ELEMENTS[line_type][type]
  end.join
  square_num % 3 == 0 ? subline : subline << BOARD_ELEMENTS[line_type][:limit]
end

def full_line(line_type)
  (1..3).map { |square_number| subline(line_type, square_number) }.join
end

def row(row_number)
  row = [:empty, :marked, :numbered].map do |line_type|
    full_line(line_type)
  end
  row_number == 2 ? row : row << full_line(:lined)
end

def display_row(row_number)
  row(row_number).each { |line| puts line }
end

def display_board
  (0..2).each { |row_number| display_row(row_number) }
end

# game setup methods
def new_board
  ALL_SQUARES.map { |square| [square, EMPTY_MARK] }.to_h
end

display_board
#TODO: get board information into display methods (mark, square number)


