- For each index of the input string, get all substrings that can be made starting from that index
  - From a given index, first get length 1 substring, then length 2 substring, etc, up to the longest substring that can be made from that starting index
  - Then move to the next higher index

  - Outer Loop:
	    - this loop is keeping track of the current index to start from
		  - start at index 0, then index 1, up to the last index of the input string:
        - 0 up to (input string length - 1)
    - Inner Loop:
      - this loop is keeping track of the length of the substring
      - start at length 1, then 2, up to max length that can be made starting at that index:
        - input string length - starting index




- Get all possible length 1 substrings, then length 2 substrings, etc
  - For a given length, get substrings of that length from every possible starting index
  - Then move to the next higher length

  - Outer Loop:
      - this loop is keeping track of the current desired length of substrings to find
      - start at length 1, then 2, up to the maximum possible substring size:
        - 1 up to input string length
    - Inner Loop:
      - this loop is keeping track of the index to start from
      - start at index 0, then 1, up to the last possible index that can produce a substring of the current desired length:
        - 0 up to (input string length - current desired length)


# PROBLEM


- input: 

- output:

# EXAMPLES


# DATA STRUCTURES


# ALGORITHM


# # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # #

# PROBLEM


- input: 

- output:

# EXAMPLES


# DATA STRUCTURES


# ALGORITHM
