# Part 2
def powers_sum(games_data)
  games_info = process_data(games_data)
  counts = get_counts(games_info)

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

def get_counts(games_info)
  color_counts = {:red => [], :green => [], :blue => []}

  games_info.values.each do |game| # [{:red=>6, :blue=>1, :green=>3}, {:blue=>2, :red=>1, :green=>2}]
    game.each do |draw| # {:red=>6, :blue=>1, :green=>3}
      draw.each do |color, count| # :red=>6
        color_counts.keys do |key|

        end
      end
    end
  end
  
  color_counts
end

# color_keys = [:red, :green, :blue]
# color_values = Array.new(3) { |element| [] }
# color_counts = color_keys.zip(color_values).to_h
# p color_counts

# color_counts[:red] << 7
# p color_counts

target = {
  :red => [[4, 1, 0], [0, 1, 0]],
  :green => [[0, 2, 2], [2, 3, 1]],
  :blue => [[3, 6, 0], [1, 4, 1]]
}


sample_data = {
  "1"=>[
    {:blue=>3, :red=>4}, 
    {:red=>1, :green=>2, :blue=>6}, 
    {:green=>2}
  ], 
  "2"=>[{:blue=>1, :green=>2}, {:green=>3, :blue=>4, :red=>1}, {:green=>1, :blue=>1}], 
  "3"=>[{:green=>8, :blue=>6, :red=>20}, {:blue=>5, :red=>4, :green=>13}, {:green=>5, :red=>1}], 
  "4"=>[{:green=>1, :red=>3, :blue=>6}, {:green=>3, :red=>6}, {:green=>3, :blue=>15, :red=>14}], 
  "5"=>[{:red=>6, :blue=>1, :green=>3}, {:blue=>2, :red=>1, :green=>2}]
}

sample_input = [
'Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green',
'Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue',
'Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red',
'Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red',
'Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green'
]

games_data = File.read('data02.txt').split(/\n/)
# p powers_sum(sample_input)
p get_counts(sample_data)

# Part 1
# MAX_CUBES = {:red=>12, :green=>13, :blue=>14}

# def possible_games(games_data)
#   games_info = process_data(games_data)
#   possible_games = get_possible_games(games_info)
#   possible_games.keys.map(&:to_i).sum
# end

# def process_data(array)
#   game_numbers = array.map { |string| string.split[1].delete(':') }
#   games = array.map { |string| string.split('; ') }
#   games_info = game_numbers.zip(games).to_h
#   scores = get_scores(games_info)
#   game_numbers.zip(scores).to_h
# end

# def get_scores(games_info)
#   games_info.values.map do |game_draws|
#     game_draws.map do |draw|
#       words = draw.split
#       assign_scores(words)
#     end
#    end
# end

# def assign_scores(words)
#   counts = {}
#   words.each_with_index do |word, index|
#     next_word = words[index + 1] || ''
#     counts[:red] = word.to_i if next_word.include?('red')
#     counts[:green] = word.to_i if next_word.include?('green')
#     counts[:blue] = word.to_i if next_word.include?('blue')
#   end
#   counts
# end

# def get_possible_games(games_info)
#   games_info.select do |_, game_draws|
#    game_draws.all? do |draw|
#       draw.all? do |color, count|
#         count <= MAX_CUBES[color]
#       end
#     end
#   end
# end

# games_data = File.read('data02.txt').split(/\n/)
# p possible_games(games_data) # 2913
