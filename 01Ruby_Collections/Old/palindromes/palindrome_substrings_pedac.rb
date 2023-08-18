# PROBLEM
# Given a string, write a method 'palindrome_substrings' which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:
# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

# Input: string
# Output: array of substrings

# Rules:
#   Explicit Requirements:
#     - Return all substrings which are palindromes
#     - Palindromes are case sensitive
#   Implicit Requirements:
#     - If the input string contains no substrings which are palindromes, return an empty array
#     - If input is an empty string, return an empty array

# ALGORITHM
# - Initialize an empty array 'result'
# - Create an array called 'substrings' that contains all substrings of the input string
#   that are at least two characters long
#       - For each character in the string except the last character:
#           - Add each substring that starts with that character and is at least two 
#             characters long to the 'substrings' array

# - Iterate through the substrings array
#   - If any substring is a palindrome, add it to the result array
# - Return the result array
