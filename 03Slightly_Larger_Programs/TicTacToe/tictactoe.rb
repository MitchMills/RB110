def initialize_board
  (1..9).each_with_object({}) do |square, board|
    board[square] = 'X'
  end
end

def display_board(board)
  empty = (" " * 5)
  mark = "X"
  marked = (" " * 2) + mark + (" " * 2)
  line = ("-" * 5)
  long_line = "#{line}+#{line}+#{line}"

  empty_row = "#{empty}|#{empty}|#{empty}"
  marked_row = "#{marked}|#{marked}|#{marked}"
  row_of_squares = [empty_row, marked_row, empty_row ]
  pattern = [row_of_squares, long_line, row_of_squares, long_line, row_of_squares]

  pattern.each do |element|
    puts element
  end

end

board = initialize_board
display_board(board)
