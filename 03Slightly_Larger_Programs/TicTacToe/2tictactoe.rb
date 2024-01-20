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

BOARD_SQUARE_SIZE = 7
FILL_SIZE = BOARD_SQUARE_SIZE / 2
BOARD_PARTS = {
  rows: {
    pattern: [:empty, :marked, :numbered, :horizontal],
    positions: {top: [1, 2, 3], middle: [4, 5, 6], bottom: [7, 8, 9]}
  },
  sub_lines: {
    pattern:     [:fill, :mark, :fill, :limit],
    inner:       {fill: (' ' * FILL_SIZE), mark: ' ', limit: '|'},
    horizontal:  {fill: ('-' * FILL_SIZE), mark: '-', limit: '+'}
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
def display_board(game_data)
  system('clear')
  blank_line
  row_positions = BOARD_PARTS[:rows][:positions].keys
  row_positions.each { |row_position| puts row(row_position, game_data) }
  blank_line
end

def row(row_position, game_data)
  pattern  = BOARD_PARTS[:rows][:pattern]
  pattern.map do |line_type|
    next if row_position == :bottom && line_type == :horizontal
    full_line(line_type, row_position, game_data)
  end
end

def full_line(line_type, row_position, game_data)
  row_squares = BOARD_PARTS[:rows][:positions][row_position]
  row_squares.map do |square_number|
    sub_line(line_type, square_number, game_data)
  end.join
end

def sub_line(line_type, square_number, game_data)
  data = BOARD_PARTS[:sub_lines]
  parts = (line_type == :horizontal) ? data[:horizontal] : data[:inner]

  sub_line = data[:pattern].map do |part_type|
    next if (part_type == :limit) && (square_number % 3 == 0)
    parts[part_type]
  end.join

  add_info(sub_line, square_number, line_type, game_data)
end

def add_info(sub_line, square_number, line_type, game_data)
  center_point = BOARD_SQUARE_SIZE / 2
  case line_type
  when :marked
    sub_line[center_point] = game_data[:board][square_number]
  when :numbered
    sub_line[center_point] = square_number.to_s if
      empty_squares(game_data).include?(square_number)
  end
  sub_line
end

def empty_squares(game_data)
  board = game_data[:board]
  board.keys.select { |square_number| board[square_number] ==  EMPTY_MARK }
end






# game setup methods ###
def new_board
  ALL_SQUARES.map { |square_number| [square_number, EMPTY_MARK] }.to_h
end

def determine_first_player(game_data)
  choice = nil
  loop do
    choice = get_first_player_choice
    break if ['1', '2', '3'].include?(choice)
    prompt("I'm sorry, that's not a valid choice")
    blank_line
  end
  set_player_order(game_data, choice)
  display_player_order(game_data)
end

def get_first_player_choice
  prompt("Choose who will go first:")
  prompt("  Enter 1 to go first")
  prompt("  Enter 2 to have the computer go first")
  prompt("  Enter 3 to have the first player chosen randomly")
  prompt(:print, "Enter your choice: ")
  gets.chomp
end

def set_player_order(game_data, choice)
  choice = ['1', '2'].sample if choice == '3'
  players = game_data[:players]
  players[:player1] = (choice == '1') ? :user : :computer
  players[:player2] = (choice == '1') ? :computer : :user
end

def display_player_order(game_data)
  players = ["You", "The computer"]
  players = players.reverse if game_data[:players][:player1] == :computer
  order, marks = %w(first second), [PLAYER1_MARK, PLAYER2_MARK]

  players.each_with_index do |player, index|
   prompt("#{player} will go #{order[index]} and " +
    "mark squares with '#{marks[index]}'")
  end
end

# TODO: have player and computer keep same marks throughout match?




# single game methods
def play_one_game(game_data)
  game_data[:board] = new_board
  current_player = :player1 # TODO: need to switch between games in match
  loop do
    display_board(game_data)
    player_places_mark!(current_player, game_data)
    break if game_winner?(game_data) || board_full?(game_data)
    current_player = switch_player(current_player)
  end
  display_game_result(game_data)
end

def player_places_mark!(current_player, game_data) # player = :player1 or :player2
  choice =  get_choice(current_player, game_data)
  update_board(current_player, choice, game_data)
end

def get_choice(current_player, game_data)
  player = game_data[:players][current_player]
  player == :user ? user_choice(game_data) : computer_choice(game_data)
end

def user_choice(game_data) # TODO: loop for entry validation
  prompt(:print, "Choose an empty square: #{empty_squares(game_data)}: ")
  choice = gets.chomp.to_i
end





# computer choice methods
def computer_choice(game_data)
  targets = get_all_targets(game_data)
  targets.each_value do |target_squares|
    return target_squares.sample if target_squares.size > 0
  end
end

def get_all_targets(game_data)
  target_types = [:opportunities, :threats, :center, :corners, :other]
  target_types.each_with_object(Hash.new([])) do |type, targets|
    targets[type] = get_target_list(type, game_data)
  end
end

def get_target_list(type, game_data)
  marks = [PLAYER1_MARK, PLAYER2_MARK]
  marks = marks.reverse if game_data[:players][:player1] == :computer
  user_mark, computer_mark = marks

  target =  case type
            when :opportunities then computer_mark
            when :threats then user_mark
            when :center then CENTER_SQUARE
            when :corners then CORNER_SQUARES
            when :other then OTHER_SQUARES
            end
  target_list(target, game_data)
end

def target_list(target, game_data)
  if target == PLAYER1_MARK || target == PLAYER2_MARK
    get_list(target, game_data)
  else
    target.intersection(empty_squares(game_data))
  end
end

def get_list(mark, game_data)
  WINNING_LINES.each_with_object([]) do |line, list|
    list << target_square(line, mark, game_data) if
      target_square?(line, mark, game_data)
  end
end

def target_square(line, mark, game_data)
  board = game_data[:board]
  if (board.values_at(*line).count(mark) == 2) &&
     (board.values_at(*line).count(EMPTY_MARK) == 1)
     return line.intersection(empty_squares(game_data)).first
  end
  nil
end

def target_square?(line, mark, game_data)
  !!target_square(line, mark, game_data)
end







def update_board(player, choice, game_data)
  mark = (player == :player1) ? PLAYER1_MARK : PLAYER2_MARK
  game_data[:board][choice] = mark
end

def game_winner?(game_data)
  !!detect_game_winner(game_data)
end

def detect_game_winner(game_data)
  board, players = game_data[:board], game_data[:players]
  WINNING_LINES.each do |line|
    players.keys.each do |player|
      return players[player] if detect_win(board, line, player)
    end
  end
  nil
end

def detect_win(board, line, player)
  player_mark = (player == :player1) ? PLAYER1_MARK : PLAYER2_MARK
  board.values_at(*line).count(player_mark) == 3
end



def board_full?(game_data)
  empty_squares(game_data).empty?
end

def switch_player(current_player)
  current_player == :player1 ? :player2 : :player1
end

def display_game_result(game_data)
  display_board(game_data)
  result =  detect_game_winner(game_data)
  case result
  when :user then prompt("You have won!")
  when :computer then prompt("The computer has won!")
  else prompt("It's a tie.")
  end
end


game_data = {
  board: {
    1=>"O", 2=>" ", 3=>"O",
    4=>" ", 5=>"X", 6=>" ",
    7=>"O", 8=>" ", 9=>" "},
  players: {player1: :computer, player2: :user}
}

# display_board(game_data)
p get_all_targets(game_data)
p computer_choice(game_data)
