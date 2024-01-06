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
  subline = pattern.each_with_object('') do |type, string|
    string << BOARD_ELEMENTS[line_type][type]
  end
  square_num % 3 == 0 ? subline : subline << BOARD_ELEMENTS[line_type][:limit]
end

# game setup methods
def new_board
  ALL_SQUARES.map { |square| [square, EMPTY_MARK] }.to_h
end

p subline(:empty, 2)
p subline(:marked, 2)
p subline(:numbered, 2)
p subline(:lined, 2)


