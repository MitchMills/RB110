

# Part 1
MAX_CUBES = {:red=>12, :green=>13, :blue=>14}

def possible_games(games_data)
  games_info = process_data(games_data)
  possible_games = get_possible_games(games_info)
  possible_games.keys.map(&:to_i).sum
end

def process_data(array)
  game_numbers = array.map { |string| string.split[1].delete(':') }
  games = array.map { |string| string.split('; ') }
  games_info = game_numbers.zip(games).to_h
  scores = get_scores(games_info)
  game_numbers.zip(scores).to_h
end

def get_scores(games_info)
  games_info.values.map do |game_draws|
    game_draws.map do |draw|
      words = draw.split
      assign_scores(words)
    end
   end
end

def assign_scores(words)
  counts = {}
  words.each_with_index do |word, index|
    next_word = words[index + 1] || ''
    counts[:red] = word.to_i if next_word.include?('red')
    counts[:green] = word.to_i if next_word.include?('green')
    counts[:blue] = word.to_i if next_word.include?('blue')
  end
  counts
end

def get_possible_games(games_info)
  games_info.select do |_, game_draws|
   game_draws.all? do |draw|
      draw.all? do |color, count|
        count <= MAX_CUBES[color]
      end
    end
  end
end

games_data = File.read('data02.txt').split(/\n/)
p possible_games(games_data) # 2913
