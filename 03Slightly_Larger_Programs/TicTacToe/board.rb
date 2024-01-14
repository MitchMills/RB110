PLAYER1_MARK = 'X'
PLAYER2_MARK = 'O'
EMPTY_MARK = ' '

ALL_SQUARES = (1..9).to_a
CORNER_SQUARES = [1, 3, 7, 9]
CENTER_SQUARE = 5

WINNING_LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9],  # horizontal
  [1, 4, 7], [2, 5, 8], [3, 6, 9],  # vertical
  [1, 5, 9], [3, 5, 7]              # diagonal
]

BOARD_SQUARE_SIZE = 7
FILL_SIZE = BOARD_SQUARE_SIZE / 2
BOARD_PARTS = {
  row: {
    positions: {top: [1, 2, 3], middle: [4, 5, 6], bottom: [7, 8, 9]},
    pattern: [:empty_line, :marked_line, :numbered_line, :horizontal_line]
  },
  empty_line: {
    pattern: [:fill, :mark, :fill, :limit],
    fill: (' ' * FILL_SIZE), mark: ' ', limit: '|'
  },
  marked_line: {
    pattern: [:fill, :mark, :fill, :limit],
    fill: (' ' * FILL_SIZE), mark: '?', limit: '|'
  },
  numbered_line: {
    pattern: [:fill, :fill, :mark, :limit],
    fill: (' ' * FILL_SIZE), mark: ' ', limit: '|'
  },
  horizontal_line: {
    pattern: [:fill, :mark, :fill, :limit],
    fill: ('-' * FILL_SIZE), mark: '-', limit: '+'
  }
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
  system('clear')
  blank_line
  positions = BOARD_PARTS[:row][:positions].keys
  positions.each { |row_position| puts row(row_position, board) }
  blank_line
end

def row(row_position, board)
  pattern  = BOARD_PARTS[:row][:pattern]
  pattern.map do |line_type|
    next if row_position == :bottom && line_type == :horizontal_line
    full_line(line_type, row_position, board)
  end
end

def full_line(line_type, row_position, board)
  row_squares = BOARD_PARTS[:row][:positions][row_position]
  row_squares.map { |square_num| sub_line(line_type, square_num, board) }.join
end

def sub_line(line_type, square_num, board)
  parts = BOARD_PARTS[line_type]
  sub_line = parts[:pattern].map do |type|
    next if type == :limit && (square_num % 3 == 0)
    parts[type]
  end.join

  add_mark(sub_line, square_num, board) if line_type == :marked_line
  add_square_number(sub_line, square_num) if (line_type == :numbered_line) &&
    (empty_squares(board).include?(square_num))

  sub_line
end

def add_mark(sub_line, square_num, board)
  center = FILL_SIZE
  sub_line[center] = board[square_num]
end

def add_square_number(sub_line, square_num)
  right_corner = BOARD_SQUARE_SIZE - 2
  sub_line[right_corner] = square_num.to_s
end

def empty_squares(board)
  board.select { |square, mark| mark == EMPTY_MARK }.keys
end




# game setup methods ###
def new_board
  ALL_SQUARES.map { |square| [square, EMPTY_MARK] }.to_h
end

def determine_first_player(game_stats)
  choice = nil
  loop do
    choice = get_first_player_choice
    break if ['1', '2', '3'].include?(choice)
    prompt("I'm sorry, that's not a valid choice")
    blank_line
  end
  set_player_order(game_stats, choice)
  display_player_order(game_stats)
end

def get_first_player_choice
  prompt("Choose who will go first:")
  prompt("  Enter 1 to go first")
  prompt("  Enter 2 to have the computer go first")
  prompt("  Enter 3 to have the first player chosen randomly")
  prompt(:print, "Enter your choice: ")
  gets.chomp
end

def set_player_order(game_stats, choice)
  choice = ['1', '2'].sample if choice == '3'
  game_stats[:player1] = (choice == '1') ? :user : :computer
  game_stats[:player2] = (choice == '1') ? :computer : :user
end

def display_player_order(game_stats)
  players = ["You", "The computer"]
  players = players.reverse if game_stats[:player1] == :computer
  order, marks = %w(first second), [PLAYER1_MARK, PLAYER2_MARK]

  players.each_with_index do |player, index|
   prompt("#{player} will go #{order[index]} and " +
    "mark squares with '#{marks[index]}'")
  end
end

# TODO: have player and computer keep same marks throughout match?




# single game methods
def play_one_game(game_stats)
  board = new_board
  current_player = :player1 # TODO: need to switch between games in match
  loop do
    display_board(board)
    player_places_mark!(current_player, game_stats, board)
    break if game_winner?(board, game_stats) || board_full?(board)
    current_player = switch_player(current_player)
  end
  display_game_result(board, game_stats)
end

def player_places_mark!(player, game_stats, board) # player = :player1 or :player2
  choice =  get_choice(player, game_stats, board)
  update_board(player, choice, game_stats, board)
end

def get_choice(player, game_stats, board)
  game_stats[player] == :user ? user_choice(board) : computer_choice(board)
end

def user_choice(board) # TODO: loop for entry validation
  prompt(:print, "Choose an empty square: #{empty_squares(board)}: ")
  choice = gets.chomp.to_i
end

def computer_choice(board)
  empty_squares(board).sample
end

def real_computer_choice(board) # TODO: code up all these methods
  if opportunities?(board, game_stats)
    get_opportunities(board, game_stats).sample
  elsif threats?(board, game_stats)
    get_threats(board, game_stats).sample
  elsif center_square_empty?(board)
    CENTER_SQUARE
  elsif empty_corners?(board)
    get_empty_corners(board).sample
  else
    empty_squares(board).sample
  end
end

def update_board(player, choice, game_stats, board)
  mark = (player == :player1) ? PLAYER1_MARK : PLAYER2_MARK
  board[choice] = mark
end

def game_winner?(board, game_stats)
  !!detect_game_winner(board, game_stats)
end

def detect_game_winner(board, game_stats)
  WINNING_LINES.each do |line|
    if board.values_at(*line).count(PLAYER1_MARK) == 3
      return game_stats[:player1]
    elsif board.values_at(*line).count(PLAYER2_MARK) == 3
      return game_stats[:player2]
    end
  end
  nil
end

def board_full?(board)
  empty_squares(board).empty?
end

def switch_player(current_player)
  current_player == :player1 ? :player2 : :player1
end

def display_game_result(board, game_stats)
  display_board(board)
  result =  detect_game_winner(board, game_stats)
  case result
  when :user then prompt("You have won!")
  when :computer then prompt("The computer has won!")
  else prompt("It's a tie.")
  end
end




# board = {1=>" ", 2=>" ", 3=>"X", 4=>" ", 5=>"O", 6=>" ", 7=>"X", 8=>" ", 9=>" "}
# game_stats = {player1: nil, player2: nil}
# game_stats = {player1: :user, player2: :computer}
game_stats = {player1: :computer, player2: :user}

# play_one_game(game_stats)
