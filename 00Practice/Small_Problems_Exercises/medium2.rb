### 2 ABCs
=begin
A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

'boxkdqcpnagtrefsjwhuvilyzm'

This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each letter in each block can only be used once.

Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

PROBLEM
input: string

output: boolean
  - true if input stringcan be created from letters available on blocks
    - case insensitive
  - false otherwise
  - blocks:
    - have two 'sides' with a letter on each side
      - only one 'side' can be used per input string
      - each block can be used only once

EXAMPLES

DATA STRUCTURES
- needs:
  - representation of blocks
  - account for whether an individual block has been used
    - if either side of a given block has already been used, can't be used again

- input: string
  - blocks: could be an array of letter pairs: [bo, xk, dq . . .]
    - can iterate over pairs and count the number of times input string includes each pair
- output: boolean

ALGORITHM
- create an array containing 'blocks'
  - each element represents a 'block'
    - each 'block' is a string with two letters
- create an empty hash with a default value of 0
- consider each element in the blocks array
  - consider each letter in the input string
    - if the current letter is included in the block, add 1 to the count for that block
- if any block has a count higher than 1, return false
=end

# BLOCKS = %w(bo xk dq cp na gt re fs jw hu vi ly zm)

# def block_word?(word)
#   letters = word.downcase.chars
#   counts = Hash.new(0)
#   BLOCKS.each do |block|
#     letters.each do |letter|
#       counts[block] +=1 if block.include?(letter)
#     end
#   end
#   counts.select { |block, count| count > 1 }.empty?
# end

# p block_word?('BATCH') #== true
# p block_word?('BUTCH') #== false
# p block_word?('jest') #== true


### 1 LONGEST SENTENCE
=begin
Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words. Sentences may end with periods (.), exclamation points (!), or question marks (?). Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. You should also print the number of words in the longest sentence.

The longest sentence in the below text is the last sentence; it is 86 words long. (Note that each '--' counts as a word.)

Another Example

Download the book at http://www.gutenberg.org/cache/epub/84/pg84.txt, and run your program on this file.

The longest sentence in this book is 157 words long.

Hint: f you have a variable str that contains a bunch of sentences, you can split into an array of sentences like this:

  sentences = text.split(/\.|\?|!/)

PROBLEM
input: string (text file)
  - contains sentences
    - sentence: string that ends with  . ! ?
      - word: sequence of contiguous non-space, non-sentence-ending characters

output: string, integer
  - string is longest sentence of input string
    - longest = greatest number of words
  - integer is number of words in that sentence

needs:
- way to divide text into sentences
- way to determine longest sentence
  - way to count number of words in each sentence

EXAMPLES

DATA STRUCTURES
- input: string
  - array of individual sentences
  - array of individual words in each sentence
- output: string, integer

ALGORITHM
- divide input string into individual sentences
- find the longest sentence
  - divide each sentence into individual words
  - select the sentence with the most words
- output longest sentence to terminal
- output number of words in that sentence to terminal

=end

# def longest_sentence(text)
#   sentences = text.split(/\.|\?|!/)
#   longest = sentences.max_by { |sentence| sentence.split.size }.strip
#   puts longest
#   puts longest.split.size
# end

# def longest_paragraph(text)
#   paragraphs = text.split(/\n\n/)
#   longest = paragraphs.max_by { |paragraph| paragraph.split.size }.strip
#   puts longest
#   puts longest.split.size
# end

# def longest_word(text)
#   words = text.split
#   longest = words.max_by { |word| word.size }
#   puts longest
#   puts longest.size
# end

# text = File.read('frankenstein.txt')

# text = "Four score and seven years ago our fathers brought forth on this continent a new nation, conceived in liberty, and dedicated to the proposition that all men are created equal.

# Now we are engaged in a great civil war, testing whether that nation, or any nation so conceived and so dedicated, can long endure. We are met on a great battlefield of that war. We have come to dedicate a portion of that field, as a final resting place for those who here gave their lives that that nation might live. It is altogether fitting and proper that we should do this.

# But, in a larger sense, we can not dedicate, we can not consecrate, we can not hallow this ground. The brave men, living and dead, who struggled here, have consecrated it, far above our poor power to add or detract. The world will little note, nor long remember what we say here, but it can never forget what they did here. It is for us the living, rather, to be dedicated here to the unfinished work which they who fought here have thus far so nobly advanced. It is rather for us to be here dedicated to the great task remaining before us -- that from these honored dead we take increased devotion to that cause for which they gave the last full measure of devotion -- that we here highly resolve that these dead shall not have died in vain -- that this nation, under God, shall have a new birth of freedom -- and that government of the people, by the people, for the people, shall not perish from the earth."

# longest_paragraph(text)
