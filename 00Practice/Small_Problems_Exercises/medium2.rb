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
input: string
  - contains words and sentences
    - sentences end with: . ! ?
    - words: any contiguous sequence of non-space, non-sentence-ending characters
      - '--', e.g., counts as a word
output: string, integer
  - string is longest sentence in input string based on word count
  - integer is number of words in that sentence

EXAMPLES

DATA STRUCTURES
- input: string
  - array of individual sentences
  - for each sentence, array of individual words
  - hash: keys are indexes of sentences in sentences array
    - values are word count
  - sorted hash: by word count
- output: string

ALGORITHM
- create an empty hash
- create an array of individual sentences from the input string: sentences
- for each sentence, create an array of individual words in that sentence: words
  - create a key value pair in the hash
    - key is index of sentence in sentences array
    - value is size of words array
- sort the hash by value
- for the largest value:
  - output the sentence at that key index from sentences to the terminal
  - output that value to the terminal

=end

# def longest_sentence(text)
#   sentences = text.split(/\.|\?|!/)
#   word_counts = word_counts(sentences)
#   longest = word_counts.sort_by { |index, length| length }.last
#   puts sentences[longest.first].strip
#   puts longest.last
# end

# def word_counts(sentences)
#   word_counts = {}
#   sentences.each_with_index do |sentence, index|
#     words = sentence.split
#     word_counts[index] = words.size
#   end
#   word_counts
# end

# text = File.read('frankenstein.txt')

# text = "Four score and seven years ago our fathers brought forth on this continent a new nation, conceived in liberty, and dedicated to the proposition that all men are created equal.

# Now we are engaged in a great civil war, testing whether that nation, or any nation so conceived and so dedicated, can long endure. We are met on a great battlefield of that war. We have come to dedicate a portion of that field, as a final resting place for those who here gave their lives that that nation might live. It is altogether fitting and proper that we should do this.

# But, in a larger sense, we can not dedicate, we can not consecrate, we can not hallow this ground. The brave men, living and dead, who struggled here, have consecrated it, far above our poor power to add or detract. The world will little note, nor long remember what we say here, but it can never forget what they did here. It is for us the living, rather, to be dedicated here to the unfinished work which they who fought here have thus far so nobly advanced. It is rather for us to be here dedicated to the great task remaining before us -- that from these honored dead we take increased devotion to that cause for which they gave the last full measure of devotion -- that we here highly resolve that these dead shall not have died in vain -- that this nation, under God, shall have a new birth of freedom -- and that government of the people, by the people, for the people, shall not perish from the earth."

# longest_sentence(text)
