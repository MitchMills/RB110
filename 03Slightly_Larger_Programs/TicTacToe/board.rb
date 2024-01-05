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
  empty:    {fill: '12', mark: 'X', limit: '|'},
  marked:   ['fill', 'mark', 'fill', 'limit'],
  numbered: ['fill', 'fill', 'mark', 'limit'],
  line:     ['fill', 'mark', 'fill', 'limit']
}

def empty_square
  pattern = [:fill, :mark, :fill, :limit]
  square = pattern.each_with_object('') do |type, square|
    square << BOARD_ELEMENTS[:empty][type]
  end
  puts square
end

# game setup methods
def new_board
  ALL_SQUARES.map { |square| [square, EMPTY_MARK] }.to_h
end

empty_square


