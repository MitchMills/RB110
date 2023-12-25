EMPTY_MARK = ' '
PLAYER_MARK = 'X'
COMPUTER_MARK = 'O'

ALL_SQUARES = (1..9).to_a
CORNER_SQUARES = [1, 3, 7, 9]
CENTER_SQUARE = [5]

MAX_GAMES = 5
WINNING_LINES = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9],  # across
    [1, 4, 7], [2, 5, 8], [3, 6, 9],  # down
    [1, 5, 9], [3, 5, 7]              # diagonal
  ]

  

def prompt(message)
  puts "=> #{message}"
end

def initialize_board
  (1..9).each_with_object({}) { |square, board| board[square] = EMPTY_MARK }
end

def display_board(board)
  system 'clear'
  puts
  puts "     |     |"
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}  "
  puts "     |     |"
  puts
end

def update_board!(player, board, choice)
  mark = (player == :player1) ? PLAYER_MARK : COMPUTER_MARK
  board[choice] = mark
end

def empty_squares(board)
  board.keys.select { |square| board[square] == EMPTY_MARK }
end



def player_turn(board)
  choice = get_player_choice(board)
  update_board!(:player1, board, choice)
end

def get_player_choice(board)
  loop do
    prompt("Choose a square: #{empty_squares(board).join(', ')}")
    choice = gets.chomp.to_i
    return choice if empty_squares(board).include?(choice)
    prompt("I'm sorry, that's not a valid choice.")
  end
end

def computer_turn(board)
  choice = empty_squares(board).sample
  update_board!(:player2, board, choice)
end



def game_over?(player, board)
  winner?(player, board) || board_full?(board)
end

def board_full?(board)
  empty_squares(board).empty?
end

def winner?(player, board)
  !!detect_winner(player, board)
end

def detect_winner(player, board)
  WINNING_LINES.each do |line|
    return player if winning_line?(player, board, line)
  end
  nil
end

def winning_line?(player, board, line)
  mark = player == :player1 ? PLAYER_MARK : COMPUTER_MARK
  line.all? { |square| board[square] == mark }
end



# board = {1=>" ", 2=>" ", 3=>" ", 4=>" ", 5=>" ", 6=>"O", 7=>" ", 8=>" ", 9=>" "}


board = initialize_board
display_board(board)

loop do
  player_turn(board)
  display_board(board)
  break if game_over?(:player1, board)

  computer_turn(board)
  display_board(board)
  break if game_over?(:player2, board)
  
end

puts "bye"




def tic_tac_toe
  intro
  loop do
    play_match
    break unless another_match?
  end
  outro
end

def play_match
  loop do
    play_one_game
    update_scores
    break if match_over?
  end
end

def play_one_game
  loop do
    add_mark
    display_board
    break if game_over?
  end
end
