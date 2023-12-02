games_data = File.read('data02.txt').split(/\n/)

def possible_games(games_data)
  games_info = process_data(games_data)

end

def process_data(array)
  game_numbers = array.map { |string| string.split[1].delete(':') }
  games = array.map { |string| string.split('; ') }
  games_info = game_numbers.zip(games).to_h
  games_info.each do |game_id, grabs_info|
    
  end
end


sample = ["Game 1: 1 green, 2 blue; 15 blue, 12 red, 2 green", 
  "Game 2: 5 green, 2 red, 18 blue; 18 blue, 6 red, 9 green"]

p possible_games(sample)


=begin
# games
[
  ["Game 1: 1 green, 2 blue", "15 blue, 12 red, 2 green"], 
  ["Game 2: 5 green, 2 red, 18 blue", "18 blue, 6 red, 9 green"]
]

# games_info
# keys: game_id
# values: grabs_info
{
  "1"=>["Game 1: 1 green, 2 blue", "15 blue, 12 red, 2 green"], 
  "2"=>["Game 2: 5 green, 2 red, 18 blue", "18 blue, 6 red, 9 green"]
}
=end

string = "Game 1: 1 green, 2 blue"
words = string.split # ["Game", "1:", "1", "green,", "2", "blue"]

scores = {}

words.each_with_index do |word, index|
  next_word = words[index + 1] || ''
  scores[:red] = word.to_i if next_word.include?('red')
  scores[:green] = word.to_i if next_word.include?('green')
  scores[:blue] = word.to_i if next_word.include?('blue')
end

p scores # {:green=>1, :blue=>2}