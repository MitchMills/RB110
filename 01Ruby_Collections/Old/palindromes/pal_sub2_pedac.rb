=begin
PROBLEM & EXAMPLES:
Given a string, write a method `palindrome_substrings` which returns
all the substrings from a given string which are palindromes. Consider
palindrome words case sensitive.

Test Cases:
palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
palindrome_substrings("palindrome") == []
palindrome_substrings("") == []

Rules:
Explicit Requirements:
  - Return all substrings which are palindromes
  - Palindromes are case sensitive ('dad' is a palindrome, 'Dad' is not)
Implicit Requirements:
  - Return palindrome substrings as an array of strings
  - If an input string contains no palindromes, return an empty array
  - If an input string is empty, return an empty array
  - Palindromes are at least two characters long

Input: string
Output: array of substrings

ALGORITHM
  - Initialize an empty array 'palindromes'
  - Extract all substrings at least two character long from input string
    - Put them into an array 'all_substrings'
      - Outer Loop: iterate through input string
        - Go from first character to second-to-last character (2 charactar minimum)
          - (index 0 to index -2)
        - Inner Loop: extract all possible substrings starting at current index
          - Go from length 2 through (string length - current index)

  - Iterate through 'all_substrings' array
      - Put all substrings which are palindromes into 'palindromes' array
  - Return 'palindromes' array

=end