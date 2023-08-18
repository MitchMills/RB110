INITIAL_MARK = ' '
PLAYER_MARK = 'X'
COMPUTER_MARK = 'O'
ALL_SQUARES = [1, 2, 3, 4, 5, 6, 7, 8, 9]
MIDDLE_SQUARE = 5
CORNER_SQUARES = [1, 3, 7, 9]

MAX_GAMES = 5
EARLY_MATCH_WIN = (MAX_GAMES / 2) + 1

WINNING_LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9],  # rows
  [1, 4, 7], [2, 5, 8], [3, 6, 9],  # columns
  [1, 5, 9], [3, 5, 7]              # diagonals
]

def prompt(msg)
  puts "=> #{msg}"
end

def game_number(score)
  if (score.values.sum + 1) <= MAX_GAMES
    score.values.sum + 1
  else
    MAX_GAMES
  end
end

def alternate_player(current_player)
  current_player == :computer ? :player : :computer
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
  insurmountable_lead?(score, player) ||
  won_most_games?(score, player)
end

def insurmountable_lead?(score, player)
  (score[player] - score[alternate_player(player)]) >
    (MAX_GAMES - score.values.sum)
end

def won_most_games?(score, player)
  ((game_number(score) >= MAX_GAMES) &&
    (score[player] > score[alternate_player(player)]))
end

def win_reason(score, match_winner)
  if insurmountable_lead?(score, match_winner)
    :insurmountable_lead
  elsif won_most_games?(score, match_winner)
    :won_most_games
  else
    :tie
  end
end

def display_win_reason(score, match_winner)
  case win_reason(score, match_winner)
  when :insurmountable_lead
    prompt("#{match_winner.capitalize} has an insurmountable lead.")
  when :won_most_games
    prompt("#{match_winner.capitalize} has won the most games.")
  when :tie
    prompt("Player and Computer have won the same number of games.")
  end
end

def display_match_winner(score, current_player)
  case detect_match_winner(score, current_player)
  when :player
    display_win_reason(score, :player)
    prompt("PLAYER HAS WON THE MATCH!")
  when :computer
    display_win_reason(score, :computer)
    prompt("COMPUTER HAS WON THE MATCH!")
  when :tie
    display_win_reason(score, :tie)
    prompt("THIS MATCH HAS ENDED IN A TIE.")
  end
  puts
end


score = { player: 3, computer: 0, ties: 1 }

display_match_winner(score, :player)
