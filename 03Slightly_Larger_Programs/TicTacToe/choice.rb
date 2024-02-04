PLAYER1_MARK = 'X'
PLAYER2_MARK = 'O'
EMPTY_MARK = ' '

ALL_SQUARES = (1..9).to_a
CENTER_SQUARE = [5]
CORNER_SQUARES = [1, 3, 7, 9]
OTHER_SQUARES = [2, 4, 6, 8]

WINNING_LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9],  # horizontal
  [1, 4, 7], [2, 5, 8], [3, 6, 9],  # vertical
  [1, 5, 9], [3, 5, 7]              # diagonal
]

# general methods
def prompt(type = :puts, message)
  type == :print ? print("=> #{message}") : puts("=> #{message}")
end

def blank_line
  puts
end

# choice methods
def empty_squares(game_data)
  board = game_data[:board]
  board.keys.select { |square_number| board[square_number] ==  EMPTY_MARK }
end

def open_lines(game_data)
  WINNING_LINES.select do |line|
    line.any? { |square| empty_squares(game_data).include?(square) }
  end
end

def marked_lines(game_data)
  players = game_data[:players]
  computer_mark = players[:player1] == :computer ? PLAYER1_MARK : PLAYER2_MARK
  open_lines(game_data).select do |line|
    game_data[:board].values_at(*line).count(computer_mark) > 0
  end
end

def select_lines(game_data, mark, quantity)
  open_lines(game_data).select do |line|
    game_data[:board].values_at(*line).count(mark) == quantity
  end
end

def empties(game_data, quantity)
  open_lines(game_data).select do |line|
    game_data[:board].values_at(*line).count(EMPTY_MARK) == quantity
  end
end

# game data
game_data = {
  board: {
    1=>" X", 2=>" ", 3=>"O",
    4=>" ", 5=>"O", 6=>" ",
    7=>" ", 8=>" ", 9=>"X"},
  players: {player1: :user, player2: :computer},
  match_scores: {user: 0, computer: 0, ties: 0},
  game_number: 1
}

p empty_squares(game_data)

p open_lines(game_data)

p marked_lines(game_data)
