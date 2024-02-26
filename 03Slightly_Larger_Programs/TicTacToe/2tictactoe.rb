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
BOARD_PARTS = {
  rows: {
    pattern: [:empty, :marked, :numbered, :horizontal],
    positions: {top: [1, 2, 3], middle: [4, 5, 6], bottom: [7, 8, 9]}
  },
  sub_lines: {
    inner:       {fill: (' ' * BOARD_SQUARE_SIZE), limit: '|'},
    horizontal:  {fill: ('-' * BOARD_SQUARE_SIZE), limit: '+'}
  }
}

GAMES_IN_MATCH = 5

# general methods ###
def prompt(type = :puts, message)
  type == :print ? print("=> #{message}") : puts("=> #{message}")
end

def blank_line
  puts
end

# main game loop methods
def main_game_loop
  system('clear')
  main_intro
  loop do
    play_match
    break unless again? == 'y'
  end
  outro
end

def main_intro
  prompt("Welcome to Tic Tac Toe!")
  prompt("You will play matches against the computer.")
  prompt("Enter any key to start your first match.")
  gets
end

def again?
  blank_line
  prompt("If you would like to play again, enter 'y'.")
  prompt("Enter any other key to exit the program.")
  again = gets.chomp
end

def outro
  prompt("Thank you for playing Tic Tac Toe. See you later!")
end

# match methods
def play_match
  system('clear')
  game_data = set_game_data
  match_intro
  determine_player_order(game_data)
  loop do
    play_one_game(game_data)
    update_game_data(game_data)
    break if match_over?(game_data)
  end
  display_match_result(game_data)
end

def set_game_data
  game_data = Hash.new({})
  game_data[:match_scores] = {user: 0, computer: 0, ties: 0}
  game_data[:game_number] = 1
  game_data
end

def match_intro
  prompt("The player who wins the most games out of #{GAMES_IN_MATCH} wins the match.")
  prompt("Enter any key when you are ready to start the match.")
  gets
end

def determine_player_order(game_data)
  choice = nil
  loop do
    choice = choose_first_player
    blank_line
    break if ['1', '2', '3'].include?(choice)
    prompt("I'm sorry, that's not a valid choice")
    blank_line
  end
  set_player_order(game_data, choice)
  display_player_order(game_data)
end

def choose_first_player
  system('clear')
  prompt("Choose who will go first for this match:")
  prompt("  Enter 1 to go first")
  prompt("  Enter 2 to have the computer go first")
  prompt("  Enter 3 to have the first player chosen randomly")
  prompt(:print, "Enter your choice: ")
  gets.chomp
end

def set_player_order(game_data, choice)
  choice = ['1', '2'].sample if choice == '3'
  game_data[:players][:player1] = (choice == '1') ? :user : :computer
  game_data[:players][:player2] = (choice == '1') ? :computer : :user
end

def display_player_order(game_data)
  players = ["You", "The computer"]
  players.reverse! if game_data[:players][:player1] == :computer
  order, marks = %w(first second), [PLAYER1_MARK, PLAYER2_MARK]

  players.each_with_index do |player, index|
   prompt("#{player} will go #{order[index]} and " +
    "mark squares with '#{marks[index]}'.")
  end
  blank_line
  prompt("The first player will alternate for each new game of this match.")
  prompt("The marks you use will stay the same throughout the match.")
  prompt("Enter any key when you are ready to start the first game.")
  gets
end

def update_game_data(game_data)
  update_match_scores(game_data)
  display_game_result(game_data)
  game_data[:game_number] += 1
  return if match_over?(game_data)
  prompt("Enter any key to continue to game #{game_number(game_data)}.")
  gets
end

def game_number(game_data)
  game_number = game_data[:game_number]
  game_number > GAMES_IN_MATCH ? GAMES_IN_MATCH : game_number
end

def update_match_scores(game_data)
  winner = detect_game_winner(game_data)
  scores = game_data[:match_scores]
  scores.keys.include?(winner) ? scores[winner] += 1 : scores[:ties] += 1
end

def match_over?(game_data)
  game_data[:match_scores].values.sum >= GAMES_IN_MATCH ||
  insurmountable_lead?(game_data)
end

def insurmountable_lead?(game_data)
  !!detect_insurmountable_lead(game_data)
end

def detect_insurmountable_lead(game_data)
  scores = game_data[:match_scores]
  games_left = GAMES_IN_MATCH - scores.values.sum
  [:user, :computer].each do |player|
    other_player = (player == :user) ? :computer : :user
    return player if scores[player] > (GAMES_IN_MATCH / 2) ||
    scores[player] > scores[other_player] + games_left
  end
  nil
end

def display_match_result(game_data)
  winner = get_match_winner(game_data)
  reason = get_match_win_reason(game_data)
  case winner
  when :user
    prompt("You are the winner of the match!")
    prompt("You #{reason}.")
  when :computer
    prompt("The computer is the winner of the match!")
    prompt("The computer #{reason}.")
  else
    prompt("This match has ended in a tie.")
  end
end

def get_match_winner(game_data)
  user_score = game_data[:match_scores][:user]
  computer_score = game_data[:match_scores][:computer]
  if user_score > computer_score
    :user
  elsif computer_score > user_score
    :computer
  else
    :tie
  end
end

def get_match_win_reason(game_data)
  if game_data[:match_scores].values.sum >= 5
    "won the most games"
  else
    "had an insurmountable lead"
  end
end

# single game methods
def play_one_game(game_data)
  game_data[:board] = new_board
  current_player = game_data[:game_number].odd? ? :player1 : :player2
  loop do
    display_board(game_data)
    player_places_mark!(current_player, game_data)
    sleep(0.4)
    break if game_over?(game_data)
    current_player = switch_player(current_player)
  end
end

def player_places_mark!(current_player, game_data)
  choice =  get_choice(current_player, game_data)
  update_board(current_player, choice, game_data)
end

def get_choice(current_player, game_data)
  player = game_data[:players][current_player]
  player == :user ? user_choice(game_data) : computer_choice(game_data)
end

def user_choice(game_data)
  choice = nil
  loop do
    options = format_options(empty_squares(game_data))
    prompt(:print, "Choose an empty square#{options}: ")
    choice = gets.chomp.to_i
    break if empty_squares(game_data).include?(choice)
    prompt("I'm sorry, that's not a valid choice.")
    blank_line
  end
  choice
end

def format_options(array, delimiter = ', ', word = 'or')
  case array.size
  when 0 then ''
  when 1 then " (#{array.first})"
  when 2 then " (#{array.join(" #{word} ")})"
  else
    array[-1] = "#{word} #{array.last}"
    " (#{array.join(delimiter)})"
  end
end

def update_board(player, choice, game_data)
  mark = (player == :player1) ? PLAYER1_MARK : PLAYER2_MARK
  game_data[:board][choice] = mark
end

def game_over?(game_data)
  game_winner?(game_data) || board_full?(game_data)
end

def game_winner?(game_data)
  !!detect_game_winner(game_data)
end

def detect_game_winner(game_data)
  board = game_data[:board]
  players = game_data[:players]
  WINNING_LINES.each do |line|
    players.keys.each do |player|
      return players[player] if detect_game_win(board, line, player)
    end
  end
  nil
end

def detect_game_win(board, line, player)
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
  game_winner =  detect_game_winner(game_data)
  case game_winner
  when :user then prompt("You won this game!")
  when :computer then prompt("The computer won this game!")
  else prompt("This game is a tie.")
  end
end

# computer choice methods
def computer_choice(game_data)
  targets = get_all_targets(game_data)
  targets.each_value do |target_squares|
    return target_squares.sample if target_squares.size > 0
  end
end

def get_all_targets(game_data)
  target_types = [:opportunities, :threats, :center, :chances, :corners, :other]
  all_targets = target_types.each_with_object(Hash.new([])) do |type, targets|
    targets[type] = get_target_list(type, game_data)
  end
  all_targets[:chances] = better_chances(all_targets[:chances], game_data)
  all_targets
end

def get_target_list(type, game_data)
  marks = [PLAYER1_MARK, PLAYER2_MARK]
  marks.reverse! if game_data[:players][:player1] == :computer
  user_mark, computer_mark = marks

  target =  case type
            when :opportunities then computer_mark
            when :threats then user_mark
            when :center then CENTER_SQUARE
            when :chances then computer_mark
            when :corners then CORNER_SQUARES
            when :other then OTHER_SQUARES
            end
  target_list(target, type, game_data)
end

def target_list(target, type, game_data)
  if [PLAYER1_MARK, PLAYER2_MARK].include?(target)
    get_list(target, type, game_data)
  else
    target.intersection(empty_squares(game_data))
  end
end

def get_list(mark, type, game_data)
  WINNING_LINES.each_with_object([]) do |line, list|
    if target_square?(line, mark, type, game_data)
      list << target_square(line, mark, game_data)
    elsif chances_squares?(line, mark, type, game_data)
      list << chances_squares(line, mark, game_data)
    end
  end.flatten
end

def target_square(line, mark, game_data)
  if (game_data[:board].values_at(*line).count(mark) == 2) &&
    (game_data[:board].values_at(*line).count(EMPTY_MARK) == 1)
    return line.intersection(empty_squares(game_data)).first
  end
  nil
end

def target_square?(line, mark, type, game_data)
  [:opportunities, :threats].include?(type) &&
  !!target_square(line, mark, game_data)
end

def chances_squares(line, mark, game_data)
  if (game_data[:board].values_at(*line).count(mark) == 1) &&
     (game_data[:board].values_at(*line).count(EMPTY_MARK) == 2)
      return line.intersection(empty_squares(game_data))
  end
  nil
end

def chances_squares?(line, mark, type, game_data)
  type == :chances && !!chances_squares(line, mark, game_data)
end

def better_chances(chances, game_data)
  better_chances = chances.select { |square| chances.count(square) > 1 }.uniq
  better_chances = better_chances.empty? ? chances : better_chances
end

# board display methods
def new_board
  ALL_SQUARES.map { |square_number| [square_number, EMPTY_MARK] }.to_h
end

def display_board(game_data)
  system('clear')
  display_match_info(game_data)
  draw_board(game_data)
  display_game_info(game_data)
end

def display_match_info(game_data)
  blank_line
  user_score, computer_score, ties = game_data[:match_scores].values
  puts("MATCH SCORES:")
  puts(" You: #{user_score},  Computer: #{computer_score},  Ties: #{ties}")
  blank_line
end

def draw_board(game_data)
  row_positions = BOARD_PARTS[:rows][:positions].keys
  row_positions.each { |row_position| puts row(row_position, game_data) }
end

def display_game_info(game_data)
  puts("Game #{game_number(game_data)}")
  marks = [PLAYER1_MARK, PLAYER2_MARK]
  marks.reverse! if game_data[:players][:player1] == :computer
  user_mark, computer_mark = marks
  puts("You are '#{user_mark}'. The computer is '#{computer_mark}'")
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

  sub_line = parts.keys.map do |part_type|
    next if (part_type == :limit) && (square_number % 3 == 0)
    parts[part_type]
  end.join

  add_marks(sub_line, square_number, line_type, game_data)
end

def add_marks(sub_line, square_number, line_type, game_data)
  center = BOARD_SQUARE_SIZE / 2
  case line_type
  when :marked
    sub_line[center] = game_data[:board][square_number]
  when :numbered
    sub_line[center] = square_number.to_s if
      empty_squares(game_data).include?(square_number)
  end
  sub_line
end

def empty_squares(game_data)
  board = game_data[:board]
  board.keys.select { |square_number| board[square_number] ==  EMPTY_MARK }
end

main_game_loop
