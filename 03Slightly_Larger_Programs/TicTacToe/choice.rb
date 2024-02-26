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
# def empty_squares(game_data)
#   board = game_data[:board]
#   board.keys.select { |square| board[square] == EMPTY_MARK }
# end

def select_lines(game_data, lines, mark, count)
  lines.select do |line|
    game_data[:board].values_at(*line).count(mark) > count
  end
end

def select_squares(game_data, lines)
  lines.flatten.select { |square| game_data[:board][square] == EMPTY_MARK }.uniq
end


# game data
game_data = {
  board: {
    1=>"O", 2=>" ", 3=>" ",
    4=>" ", 5=>"O", 6=>"O",
    7=>"O", 8=>" ", 9=>" "},
  players: {player1: :user, player2: :computer},
  match_scores: {user: 0, computer: 0, ties: 0},
  game_number: 1
}

open_lines = select_lines(game_data, WINNING_LINES, EMPTY_MARK, 0)
p open_lines

# threat_lines = select_lines(game_data, open_lines, PLAYER2_MARK, 1)
# p threat_lines

open_squares = select_squares(game_data, open_lines)
p open_squares
