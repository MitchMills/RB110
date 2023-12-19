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

def player_turn!(board)
  choice = get_player_choice(board)
  board[choice] = PLAYER_1_MARK
end

def get_player_choice(board)
  loop do
    prompt("Choose an empty square: #{empty_squares(board).join(', ')}")
    choice = gets.chomp.to_i
    return choice if empty_squares(board).include?(choice)
    prompt("I'm sorry, that's not a valid choice.")
  end
end

def empty_squares(board)
  board.keys.select { |square| board[square] == ' ' }
end

board = initialize_board
display_board(board)

player_turn!(board)
display_board(board)
