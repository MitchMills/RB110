EMPTY_MARK = ' '
PLAYER_1_MARK = 'X'
PLAYER_2_MARK = 'O'

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
  mark = (player == 'player1') ? PLAYER_1_MARK : PLAYER_2_MARK
  board[choice] = mark
end

def empty_squares(board)
  board.keys.select { |square| board[square] == EMPTY_MARK }
end

def player_turn(board)
  choice = get_player_choice(board)
  update_board!('player1', board, choice)
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
  update_board!('player2', board, choice)
end

def game_over?(board)
  winner?(board) || board_full?(board)
end

def board_full?(board)
  empty_squares(board).empty?
end

def winner?(board)
  !!detect_winner(board)
end

def detect_winner(board)
  winning_lines = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9],  # across
    [1, 4, 7], [2, 5, 8], [3, 6, 9],  # down
    [1, 5, 9], [3, 5, 7]              # diagonal
  ]

  winning_lines.each do |line|        # [1, 2, 3]
    line.each do |square|             # 1
      board[square] == PLAYER_1_MARK
    end
  end
end



# board = {1=>" ", 2=>" ", 3=>"X", 4=>" ", 5=>" ", 6=>"O", 7=>" ", 8=>" ", 9=>" "}

board = initialize_board
display_board(board)

loop do
  player_turn(board)
  computer_turn(board)
  display_board(board)
  break if game_over?(board)
end
