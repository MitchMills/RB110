# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

=begin
input: string
output: array
  - contains all substrings from input string which are palindromes

RULES
- Explicit
  - case sensitive: 'Dad' is not a palindrome, 'dad' is

- Implicit
  - if input string is empty, return empty array
  - if input string contains no palindrome substrings, return empty array

- Questions
  - Is input always a string? If not, how to handle?
  - what is a substring (can whole input string be a substring?)
  - what is a palindrome? Can a single character be a palindrome?
  - must substrings be in order they appear in input string?
  - what about spaces?
=end
