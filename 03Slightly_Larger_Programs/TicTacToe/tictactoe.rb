def initialize_board
  (1..9).each_with_object({}) { |square, board| board[square] = ' ' }
end

def display_board(board)
  puts
  puts "     |     |     "
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}  "
  puts "     |     |     "
end

def board_dimensions
  # pattern = [5, 1, 5, 1, 5]
  filler = [' ', '-']
  vertex = ['|', '*']

  empty_row = get_row()

  pattern.map do |segment|

  end
end

def get_row(type)

end



  



p board_dimensions
