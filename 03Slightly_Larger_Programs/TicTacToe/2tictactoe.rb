PLAYER1_MARK = 'X'
PLAYER2_MARK = 'O'
EMPTY_MARK = ' '

ALL_SQUARES = (1..9).to_a
CORNER_SQUARES = [1, 3, 7, 9]
CENTER_SQUARE = [5]

WINNING_LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9],  # horizontal
  [1, 4, 7], [2, 5, 8], [3, 6, 9],  # vertical
  [1, 5, 9], [3, 5, 7]              # diagonal
]

BOARD_PARTS = {
  row:              {pattern: [:empty_line, :marked_line, :numbered_line, :horizontal_line]},
  empty_line:       {pattern: [:fill, :mark, :fill, :limit], fill: (' ' * 2), mark: ' ', limit: '|'},
  marked_line:      {pattern: [:fill, :mark, :fill, :limit], fill: (' ' * 2), mark: '?', limit: '|'},
  numbered_line:    {pattern: [:fill, :fill, :mark, :limit], fill: (' ' * 2), mark: ' ', limit: '|'},
  horizontal_line:  {pattern: [:fill, :mark, :fill, :limit], fill: ('-' * 2), mark: '-', limit: '+'}
}

# general methods ###
def prompt(type = :puts, message)
  type == :print ? print("=> #{message}") : puts("=> #{message}")
end

def blank_line
  puts
end


# board display methods ###
def display_board(board)
  blank_line
  (1..3).each { |row_number| puts row(row_number, board) }
  blank_line
end

def row(row_number, board)
  pattern  = BOARD_PARTS[:row][:pattern]
  pattern = row_number > 2 ? pattern.take(3) : pattern
  pattern.map { |line_type| full_line(line_type, row_number, board) }
end

def full_line(line_type, row_number, board)
  all_squares = {1=>[1, 2, 3], 2=>[4, 5, 6], 3=>[7, 8, 9]}
  row_squares = all_squares[row_number]
  row_squares.map { |square_num| sub_line(line_type, square_num, board) }.join
end

def sub_line(line_type, square_num, board)
  parts = BOARD_PARTS[line_type]
  pattern = square_num % 3 == 0 ? parts[:pattern].take(3) : parts[:pattern]
  sub_line = pattern.map { |type| parts[type] }.join

  sub_line[2] = board[square_num] if line_type == :marked_line
  sub_line[3] = square_num.to_s if (line_type == :numbered_line) &&
    (empty_squares(board).include?(square_num))
  sub_line
end



# game setup methods ###
def new_board
  ALL_SQUARES.map { |square| [square, EMPTY_MARK] }.to_h
end

def determine_first_player(game_stats)
  choice = nil
  loop do
    prompt("Choose who will go first:")
    prompt("  Enter 1 to go first")
    prompt("  Enter 2 to have the computer go first")
    prompt("  Enter 3 to have the first player chosen randomly")
    prompt(:print, "Enter your choice: ")
    choice = gets.chomp
    break if ['1', '2', '3'].include?(choice)
    prompt("I'm sorry, that's not a valid choice")
    blank_line
  end
  set_player_order(game_stats, choice.to_i)
end

def set_player_order(game_stats, choice)
  choice = [1, 2].sample if choice == 3
  game_stats[:player1] = choice == 1 ? :user : :computer
  game_stats[:player2] = choice == 1 ? :computer : :user
end





# gameplay methods





board = {1=>"O", 2=>" ", 3=>" ", 4=>" ", 5=>"X", 6=>" ", 7=>" ", 8=>" ", 9=>"X"}
game_stats = {player1: nil, player2: nil}


# display_board(board)
# place_mark(:user, game_stats, board)
# display_board(board)
