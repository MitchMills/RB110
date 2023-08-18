INITIAL_MARK = ' '
PLAYER_MARK = 'X'
COMPUTER_MARK = 'O'

ALL_SQUARES = [1, 2, 3, 4, 5, 6, 7, 8, 9]
MIDDLE_SQUARE = 5
CORNER_SQUARES = [1, 3, 7, 9]

MAX_GAMES = 5
WINNING_LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9],  # rows
  [1, 4, 7], [2, 5, 8], [3, 6, 9],  # columns
  [1, 5, 9], [3, 5, 7]              # diagonals
]

def prompt(msg)
  puts "=> #{msg}"
end

def welcome(first_time)
  if first_time == true
    prompt("Welcome to Tic Tac Toe! You will play against the computer.")
    prompt("Whoever wins the most games out of #{MAX_GAMES} wins the Match.")
  else
    prompt("Welcome back! Ready for another Match?")
    prompt("As before, whoever wins the most games out of #{MAX_GAMES}\
wins the Match.")
  end
  puts
end

def choose_first_player
  choice = nil
  loop do
    prompt("Choose who will go first:")
    prompt("  Enter 1 to go first")
    prompt("  Enter 2 to have the computer go first")
    prompt("  Enter 3 to have a first player chosen randomly")
    choice = gets.chomp
    break if [1, 2, 3].include?(choice.to_f)
    prompt("Sorry, that's not a valid choice")
  end
  first_player(choice.to_i)
end

def first_player(choice)
  case choice
  when 1 then :player
  when 2 then :computer
  when 3 then [:player, :computer].sample
  end
end

def intro(first_player)
  prompt("#{first_player.capitalize} will go first on Game 1.")
  prompt("After that the first player will alternate.")
  prompt("Enter any key to continue.")
  gets
end

def play_match(score, first_player, current_player)
  loop do
    board = initialize_board
    play_one_game(board, score, current_player)

    announce_game_results(board, score)
    display_updated_score(board, score)

    break if match_winner?(score, current_player)

    prompt("Enter any key to continue to Game #{game_number(score)}.")
    gets
    current_player = determine_current_player(score, first_player)
  end
end

def initialize_board
  new_board = {}
  ALL_SQUARES.each { |num| new_board[num] = INITIAL_MARK }
  new_board
end

def play_one_game(brd, score, current_player)
  loop do
    display_board(brd, score) if current_player == :player
    pick_square!(brd, current_player)
    current_player = alternate_player(current_player)
    break if game_winner?(brd) || board_full?(brd)
  end
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd, score)
  brd_nums = board_numbers(brd)
  system('clear')
  prompt("Game #{game_number(score)}")
  show_score(score)
  prompt("You are #{PLAYER_MARK}. Computer is #{COMPUTER_MARK}.")
  prompt("Your move!")
  puts
  puts "       |       |"
  puts "   #{brd[1]}   |   #{brd[2]}   |   #{brd[3]}"
  puts "      #{brd_nums[1]}|      #{brd_nums[2]}|      #{brd_nums[3]}"
  puts "-------+-------+-------"
  puts "       |       |"
  puts "   #{brd[4]}   |   #{brd[5]}   |   #{brd[6]}"
  puts "      #{brd_nums[4]}|      #{brd_nums[5]}|      #{brd_nums[6]}"
  puts "-------+-------+-------"
  puts "       |       |"
  puts "   #{brd[7]}   |   #{brd[8]}   |   #{brd[9]}"
  puts "      #{brd_nums[7]}|      #{brd_nums[8]}|      #{brd_nums[9]}"
  puts
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def board_numbers(brd)
  brd_nums = {}
  ALL_SQUARES.each do |num|
    brd_nums[num] =
      if empty_squares(brd).include?(num)
        num
      else
        ' '
      end
  end
  brd_nums
end

def game_number(score)
  if (score.values.sum + 1) <= MAX_GAMES
    score.values.sum + 1
  else
    MAX_GAMES
  end
end

def pick_square!(brd, current_player)
  if current_player == :player
    player_picks_square!(brd)
  else
    computer_picks_square!(brd)
  end
end

def player_picks_square!(brd)
  square = ''
  loop do
    prompt("Choose an empty square: #{joinor(empty_squares(brd))}")
    square = gets.chomp
    break if empty_squares(brd).include?(square.to_f)
    prompt("That's not a valid choice. Try again.")
  end
  brd[square.to_i] = PLAYER_MARK
end

def joinor(array, delimiter = ', ', word = 'or')
  case array.size
  when 0 then ''
  when 1 then array[0].to_s
  when 2 then array.join(" #{word} ")
  else
    array[-1] = "#{word} #{array.last}"
    array.join(delimiter)
  end
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARK }
end

def computer_picks_square!(brd)
  target_square =
    if opportunities?(brd)
      get_opportunities(brd).sample
    elsif threats?(brd)
      get_threats(brd).sample
    elsif middle_square_empty?(brd)
      MIDDLE_SQUARE
    elsif corners_empty?(brd)
      get_empty_corners(brd).sample
    else
      empty_squares(brd).sample
    end
  brd[target_square] = COMPUTER_MARK
end

def opportunities?(brd)
  get_opportunities(brd).size > 0
end

def get_opportunities(brd)
  opportunities = []
  WINNING_LINES.each do |line|
    opportunities << get_target_square(line, brd, COMPUTER_MARK) if
      target_square?(line, brd, COMPUTER_MARK)
  end
  opportunities
end

def threats?(brd)
  get_threats(brd).size > 0
end

def get_threats(brd)
  threats = []
  WINNING_LINES.each do |line|
    threats << get_target_square(line, brd, PLAYER_MARK) if
      target_square?(line, brd, PLAYER_MARK)
  end
  threats
end

def middle_square_empty?(brd)
  empty_squares(brd).include?(MIDDLE_SQUARE)
end

def corners_empty?(brd)
  CORNER_SQUARES.intersection(empty_squares(brd)).size > 0
end

def get_empty_corners(brd)
  CORNER_SQUARES.intersection(empty_squares(brd))
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

def alternate_player(current_player)
  current_player == :computer ? :player : :computer
end

def game_winner?(brd)
  !!detect_game_winner(brd)
end

def detect_game_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARK) == 3
      return :player
    elsif brd.values_at(*line).count(COMPUTER_MARK) == 3
      return :computer
    end
  end
  nil
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def announce_game_results(brd, score)
  display_board(brd, score)
  if game_winner?(brd)
    prompt("#{detect_game_winner(brd).capitalize} won this game!")
  else
    prompt("It's a tie!")
  end
  puts
end

def display_updated_score(brd, score)
  update_score(brd, score)
  show_score(score)
end

def update_score(brd, score)
  if game_winner?(brd)
    score[detect_game_winner(brd)] += 1
  else
    score[:ties] += 1
  end
  score
end

def show_score(score)
  prompt("SCORES: Player: #{score[:player]}, \
Computer: #{score[:computer]}, Ties: #{score[:ties]}")
end

def match_winner?(score, current_player)
  !!detect_match_winner(score, current_player)
end

def detect_match_winner(score, current_player)
  if won_match?(score, current_player)
    return current_player
  elsif won_match?(score, alternate_player(current_player))
    return alternate_player(current_player)
  elsif game_number(score) > MAX_GAMES
    return :tie
  end
  nil
end

def won_match?(score, player)
  won_most_games?(score, player) ||
    insurmountable_lead?(score, player)
end

def won_most_games?(score, player)
  ((score.values.sum >= MAX_GAMES) &&
    (score[player] > score[alternate_player(player)]))
end

def insurmountable_lead?(score, player)
  (score[player] - score[alternate_player(player)]) >
    (MAX_GAMES - score.values.sum)
end

def determine_current_player(score, first_player)
  if game_number(score).even?
    alternate_player(first_player)
  else
    first_player
  end
end

def display_match_winner(score, current_player)
  case detect_match_winner(score, current_player)
  when :player
    display_win_reason(score, :player)
    prompt("YOU WON THE MATCH!")
  when :computer
    display_win_reason(score, :computer)
    prompt("COMPUTER WON THE MATCH!")
  when :tie
    display_win_reason(score, :tie)
    prompt("THIS MATCH HAS ENDED IN A TIE.")
  end
  puts
end

def display_win_reason(score, match_winner)
  if won_most_games?(score, match_winner)
    prompt("#{match_winner.capitalize} has won the most games.")
  elsif insurmountable_lead?(score, match_winner)
    prompt("#{match_winner.capitalize} has an insurmountable lead.")
  else
    prompt("Player and Computer have won the same number of games.")
  end
end

def stay_or_go
  prompt("If you would you like to play another Match, enter 'y'.")
  prompt("Enter any other key to exit.")
  gets.chomp.downcase
end

# main game loop
first_time = true

loop do
  system('clear')
  score = { player: 0, computer: 0, ties: 0 }

  welcome(first_time)
  first_time = false

  first_player = choose_first_player
  intro(first_player)

  current_player = first_player
  play_match(score, first_player, current_player)

  display_match_winner(score, current_player)

  break unless stay_or_go == 'y'
end

prompt("Thank you for playing Tic Tac Toe! Goodbye.")
