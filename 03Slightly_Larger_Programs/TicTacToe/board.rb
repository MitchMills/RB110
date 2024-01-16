PLAYER1_MARK = 'X'
PLAYER2_MARK = 'O'
EMPTY_MARK = ' '

ALL_SQUARES = (1..9).to_a
CENTER_SQUARE = 5
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
  row: {
    pattern: [:empty, :marked, :numbered, :horizontal],
    positions: {top: [1, 2, 3], middle: [4, 5, 6], bottom: [7, 8, 9]}
  },
  sub_line: {
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
def display_board(game_status)
  system('clear')
  blank_line
  positions = BOARD_PARTS[:row][:positions].keys # [:top, :middle, :bottom]
  positions.each { |row_position| puts row(row_position, game_status) }
  blank_line
end

def row(row_position, game_status)
  pattern  = BOARD_PARTS[:row][:pattern] # [:empty, :marked, :numbered, :horizontal]
  pattern.map do |line_type|
    next if row_position == :bottom && line_type == :horizontal
    full_line(line_type, row_position, game_status)
  end
end

def full_line(line_type, row_position, game_status)
  row_squares = BOARD_PARTS[:row][:positions][row_position] # [1, 2, 3] . . .
  row_squares.map do |square_number|
    sub_line(line_type, square_number, game_status)
  end.join
end

def sub_line(line_type, square_number, game_status)
  data = BOARD_PARTS[:sub_line]
  parts = line_type == :horizontal ? data[:horizontal] : data[:inner]
  pattern = data[:pattern] #

  sub_line = pattern.map do |type| # [:fill, :mark, :fill, :limit]
    next if type == :limit && (square_number % 3 == 0)
    parts[type]
  end.join

  add_info(sub_line, square_number, line_type, game_status)
end

def add_info(sub_line, square_number, line_type, game_status)
  center_point = FILL_SIZE
  case line_type
  when :marked then add_mark(sub_line, square_number, game_status)
  when :numbered then add_square_number(sub_line, square_number, game_status)
  end
  sub_line
end




### TODO: make this one method?
def add_mark(sub_line, square_number, game_status)
  center_point = FILL_SIZE
  sub_line[center_point] = game_status[:board][square_number]
end

def add_square_number(sub_line, square_number, game_status)
  center_point = FILL_SIZE
  sub_line[center_point] = square_number.to_s if
    empty_squares(game_status).include?(square_number)
end
#####




def empty_squares(game_status)
  board = game_status[:board]
  board.keys.select { |square_number| board[square_number] ==  EMPTY_MARK }
end






# game setup methods ###
def new_board
  ALL_SQUARES.map { |square_number| [square_number, EMPTY_MARK] }.to_h
end

def determine_first_player(game_status)
  choice = nil
  loop do
    choice = get_first_player_choice
    break if ['1', '2', '3'].include?(choice)
    prompt("I'm sorry, that's not a valid choice")
    blank_line
  end
  set_player_order(game_status, choice)
  display_player_order(game_status)
end

def get_first_player_choice
  prompt("Choose who will go first:")
  prompt("  Enter 1 to go first")
  prompt("  Enter 2 to have the computer go first")
  prompt("  Enter 3 to have the first player chosen randomly")
  prompt(:print, "Enter your choice: ")
  gets.chomp
end

def set_player_order(game_status, choice)
  choice = ['1', '2'].sample if choice == '3'
  players = game_status[:players]
  players[:player1] = (choice == '1') ? :user : :computer
  players[:player2] = (choice == '1') ? :computer : :user
end

def display_player_order(game_status)
  players = ["You", "The computer"]
  players = players.reverse if game_status[:players][:player1] == :computer
  order, marks = %w(first second), [PLAYER1_MARK, PLAYER2_MARK]

  players.each_with_index do |player, index|
   prompt("#{player} will go #{order[index]} and " +
    "mark squares with '#{marks[index]}'")
  end
end

# TODO: have player and computer keep same marks throughout match?




# single game methods
def play_one_game(game_status)
  game_status[:board] = new_board
  current_player = :player1 # TODO: need to switch between games in match
  loop do
    display_board(game_status)
    player_places_mark!(current_player, game_status)
    break if game_winner?(game_status) || board_full?(game_status)
    current_player = switch_player(current_player)
  end
  display_game_result(game_status)
end

def player_places_mark!(current_player, game_status) # player = :player1 or :player2
  choice =  get_choice(current_player, game_status)
  update_board(current_player, choice, game_status)
end

def get_choice(current_player, game_status)
  player = game_status[:players][current_player]
  player == :user ? user_choice(game_status) : computer_choice(game_status)
end

def user_choice(game_status) # TODO: loop for entry validation
  prompt(:print, "Choose an empty square: #{empty_squares(game_status)}: ")
  choice = gets.chomp.to_i
end

def computer_choice(game_status)
  empty_squares(game_status).sample
end


# computer choice methods
def real_computer_choice(game_status)
  targets = get_targets(game_status)
  targets.each_value do |target_squares|
    return target_squares.sample if target_squares.size > 0
  end
end

def get_targets(game_status)
  target_types = [:opportunities, :threats, :center, :corners, :other]
  target_types.each_with_object(Hash.new([])) do |type, targets|
    targets[type] = get_target_squares(type, game_status)
  end
end

def get_target_squares(type, game_status)
  players = game_status[:players]
  computer_mark = (players[:player1] == :user) ? PLAYER2_MARK : PLAYER1_MARK
  player_mark =   (players[:player1] == :user) ? PLAYER1_MARK : PLAYER2_MARK

  case type
  when :opportunities
  when :threats
  when :center
  when :corners
  when :other
  end
end

#############
def get_opportunities(brd)
  opportunities = []
  WINNING_LINES.each do |line|
    opportunities << get_target_square(line, brd, COMPUTER_MARK) if
      target_square?(line, brd, COMPUTER_MARK)
  end
  opportunities
end

def get_target_square(line, brd, mark)
  if (brd.values_at(*line).count(mark) == 2) &&
     (brd.values_at(*line).count(INITIAL_MARK) == 1)
    return line.intersection(empty_squares(brd)).first
  end
  nil
end

def target_square?(line, brd, mark)
  !!get_target_square(line, brd, mark)
end
#############





def update_board(player, choice, game_status)
  mark = (player == :player1) ? PLAYER1_MARK : PLAYER2_MARK
  game_status[:board][choice] = mark
end

def game_winner?(game_status)
  !!detect_game_winner(game_status)
end

def detect_game_winner(game_status)
  board, players = game_status[:board], game_status[:players]
  WINNING_LINES.each do |line|
    if board.values_at(*line).count(PLAYER1_MARK) == 3 # TODO: helper method here?
      return players[:player1]
    elsif board.values_at(*line).count(PLAYER2_MARK) == 3
      return players[:player2]
    end
  end
  nil
end

def board_full?(game_status)
  empty_squares(game_status).empty?
end

def switch_player(current_player)
  current_player == :player1 ? :player2 : :player1
end

def display_game_result(game_status)
  display_board(game_status)
  result =  detect_game_winner(game_status)
  case result
  when :user then prompt("You have won!")
  when :computer then prompt("The computer has won!")
  else prompt("It's a tie.")
  end
end


game_status = {
  board: {1=>" ", 2=>" ", 3=>"X", 4=>" ", 5=>"O", 6=>" ", 7=>"X", 8=>" ", 9=>" "},
  players: {player1: :computer, player2: :user}
}

display_board(game_status)
