### 4 MATCHING PARENTHESES
=begin
Write a method that takes a string as an argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

Note that balanced pairs must each start with a (, not a ).

PROBLEM
input: string

output: boolean
  - return true if all parentheses in input string are 'balanced'
    - same number of '(' and ')' characters
    - balanced pairs must start with a '('
    - if no parentheses in input string, string is 'balanced'

EXAMPLES

DATA STRUCTURES
- needs:
  - a way to determine 'balance'

- input: string
  - array of individual characters in input string
  - counter to track balance
    - start at 0
    - increment or decrement for each ( or )
- output: boolean

ALGORITHM
- set a balance counter to 0
- create an array of individual characters in the input string
- for each character:
  - ignore unless it is ( or )
  - increment counter if (
  - decrement counter if )
  - return false if counter is ever less than 0
- return true if counter == 0 at end, false otherwise
=end

def balanced?(string)
  balance = 0
  string.chars.each do |character|
    balance += 1 if character == '('
    balance -= 1 if character == ')'
    break if balance < 0
  end
  balance == 0
end


p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What ())(is() up') == false


### 3 LETTERCASE PERCENTAGE
=begin
In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.

Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.

7:17
PROBLEM
input: string
  - will always contain at least one character (i.e. no empty strings)
  - may contain lowercase, uppercase and non-alpha characters

output: hash
  - keys: symbols: lowercase, uppercase, neither
    - neither = non-alpha characters
    - spaces count (as neither)
  - values: floats percentage of that type of charcter in input string

EXAMPLES

DATA STRUCTURES
needs:
  - length of input string
  - number of each type of character
    - way to identify type of character
      - array of all lowercase alpha characters
      - array of all uppercase alpha characters
- input: string
  - array of individual characters in string
- output: hash

ALGORITHM
- create an array of all lowercase alpha characters
- create an array of all uppercase alpha characters
- create an empty hash with a default value of

- convert input string into an array of individual characters
- for each character in the input string
  - increment the appropriate value in the hash
- transform the hash values into percentages
  - divide the count by the length of the input string (as a float)
- return the hash

=end
# def letter_percentages(string)
#   {
#     lowercase: percentage(string, 'a-z'),
#     uppercase: percentage(string, 'A-Z'),
#     neither: percentage(string, '^A-Za-z')
#   }
# end

# def letter_percentages(string)
#   percentages = { lowercase: 'a-z', uppercase: 'A-Z', neither: '^A-Za-z' }
#   percentages.transform_values { |target| percentage(string, target) }
# end

# def percentage(string, target)
#   (string.count(target) / string.size.to_f * 100 ).round(1)
# end

###
# def letter_percentages(string)
#   counts = counts(string)
#   percentages(string, counts)
# end

# def counts(string)
#   {
#     lowercase: string.count('a-z'),
#     uppercase: string.count('A-Z'),
#     neither: string.count('^A-Za-z')
#   }
# end

# def percentages(string, counts)
#   counts.transform_values { |count| (count * 100.0 / string.size).round(1) }
# end
###

### ESTHER HO
# def letter_percentages(string)
#   percentages = { lowercase: 'a-z', uppercase: 'A-Z', neither: '^a-zA-Z' }

#   percentages.transform_values do |range|
#     (string.count(range) * 100.0 / string.size).round(1)
#   end
# end
###

# p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
# p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
# p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
# p letter_percentages('abcdefGHI') == {:lowercase=>66.7, :uppercase=>33.3, :neither=>0.0}


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
  - contains only alpha characters
    - upper and lower case
output: boolean
  - true if string can be constructed from 'blocks', false otherwise
    - each block contains two characters (one on each side)
      - a particular block can only be used once
        - therefore no repeats of the same letter
        - if letter on one side of a block has been used, letter on other side cannot be
  - case insensitive
    - e.g. 'b' == 'B'

EXAMPLES

DATA STRUCTURES
-needs:
  - a way to represent the blocks
  - a way to determine if a particular block has been used

- input: string
  - array to represent blocks
    - each element is a two letter string # ['bo', 'xk', 'dq', . . .]
  - array of each letter in downcased input string # ['b', 'a', 't', 'c', 'h']
  - count of how many times each element in blocks array includes each letter in input string
- output: boolean
  - false if count is greater than 1 for any block

ALGORITHM
- create a representation of the blocks
  - array of thirteen elements
    - each element is a two-letter string
- determine how many times each block is used to create the input string
  - for each block in blocks array
    - consider each letter in input string
    - if letter occurs in that block, increase count by 1
- return false if any block is used more than once, true otherwise
=end

# BLOCKS = %w(bo xk dq cp na gt re fs jw hu vi ly zm)

# def block_word?(word)
#   letters = word.downcase.chars
#   counts = BLOCKS.map do |block|
#     letters.count { |letter| block.include?(letter) }
#   end
#   counts.all? { |count| count < 2 }
# end

# def block_word?(word)
#   letters = word.downcase.chars
#   BLOCKS.each do |block|
#     return false if (letters.count { |letter| block.include?(letter) }) > 1
#   end
#   true
# end

# def block_word?(word)
#   BLOCKS.none? { |block| word.downcase.count(block) > 1 }
# end

# p block_word?('BATCH') #== true
# p block_word?('BUTCH') #== false
# p block_word?('jest') #== true
# p block_word?('apple') #== false
# p block_word?('Baby') #== false


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
