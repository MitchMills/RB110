# --- PART 1 --- #
MAX_RED = 12
MAX_GREEN = 13
MAX_BLUE = 14

# Helpers
def find_game_number(game)
  game.split[1].to_i
end

def find_game_sets(game)
  game.split(":").last.split(/[,;]/)
end

def find_largest_game_set(game)
  sets = find_game_sets(game)

  sets.each_with_object({}) do |draw, result|
    number, colour = draw.split
    number = number.to_i

    if !result.key?(colour) || number > result[colour]
      result[colour] = number
    end
  end
end

# Main
path = "data02.txt"
# path = "example_games.txt"

games = {}
File.readlines(path, chomp: true).each do |game|
  games[find_game_number(game)] = find_largest_game_set(game)
end

possible_games = games.select do |_, draws|
  draws["red"] <= MAX_RED && draws["green"] <= MAX_GREEN && draws["blue"] <= MAX_BLUE
end.keys

p possible_games.sum

