require 'pry'

INITIAL_MARK = ' '
PLAYER_MARK = 'X'
COMPUTER_MARK = 'O'
WINNING_LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
  [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
  [1, 5, 9], [3, 5, 7] # diagonals
]

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  system('clear')
  puts ""
  puts "You're #{PLAYER_MARK}. Computer is #{COMPUTER_MARK}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "    1|    2|    3"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "    4|    5|    6"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "    7|    8|    9"
  puts ""
end
# rubocop:enable Metrics/MethodLength,  Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARK }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARK }
end

def player_picks_square!(brd)
  square = ''
  loop do
    prompt("Choose an empty square: #{empty_squares(brd).join(', ')}")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("Sorry, that's not a valid choice.")
  end

  brd[square] = PLAYER_MARK
end

def computer_picks_square!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARK
end

def winner?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARK) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARK) == 3
      return 'Computer'
    end
  end
  nil
end

def board_full?(brd)
  empty_squares(brd).empty?
end

# main game loop
loop do
  board = initialize_board()

  loop do
    display_board(board)

    player_picks_square!(board)
    break if winner?(board) || board_full?(board)

    computer_picks_square!(board)
    break if winner?(board) || board_full?(board)
  end

  display_board(board)

  if winner?(board)
    prompt("#{detect_winner(board)} won!")
  else
    prompt("It's a tie!")
  end

  prompt("Play again? (y or n)")
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt("Thanks for playing Tic Tac Toe! Goodbye.")
