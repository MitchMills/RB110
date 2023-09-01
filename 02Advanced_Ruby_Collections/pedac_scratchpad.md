# PROBLEM
A substring is a contiguous (non-empty) sequence of characters within a string.
  
A vowel substring is a substring that only consists of vowels ('a', 'e', 'i', 'o', and 'u') and has all five vowels present in it.
  
Given a string word, return the number of vowel substrings in word.


- input: string
  - one "word": no spaces
  - all lowercase

- output: integer
  - represents the number of vowel substrings in the input string
  - substring: contiguous sequence of characters within a string
  - vowel substring:
    - contains only vowels (aeiou)
    - has all five vowels present
    - order doesn't matter
    - case doesn't matter
    - can be entire input string, i.e. same length as input string
    - must be at least 5 characters in length
    - a given character can be part of multiple vowel substrings

# EXAMPLES
p count_vowel_substrings("abcde") == 0
p count_vowel_substrings("cuaieuouac") == 7
p count_vowel_substrings("aeiouu") == 2
p count_vowel_substrings("unicornarihan") == 0

cuaieuouac:
  - uaieuo
  - uaieuou
  - uaieuoua
  - aieuo
  - aieuou
  - aieuoua
  - ieuoua

# DATA STRUCTURE(S)
- string
  - array to hold all possible substrings
  - array to all successful substrings
-integer

# NOTES
- minimum string length is 5:
  - if string is length 10, last string at least 5 characters long starts at index 5: 0 1 2 3 4   5 6 7 8 9
  - so start index range is: 0..(string.length - 5)

- string length:
  - must be at least 5
  - can be entire input string
  - depends on starting index
  - length range: 5..(string.length - current starting index)

# ALGORITHM
- find all possible substrings
  - start at 0 index and find all substrings, then go to next index . . .
    - start at index 0, go until index (input string length - 5)

    - at a given index, get all possible lengths from that starting point
      - length 5, then length 6, ...
        - start at length 5, go until length (input string length - current index)
    - put all substrings into an array

- filter out unwanted substrings
- count number of substrings left
- return count


#################################

# PROBLEM


# EXAMPLES


# DATA STRUCTURE(S)


# ALGORITHM
