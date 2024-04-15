### 1 REPEAT YOURSELF
=begin
Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

PROBLEM
input: string, integer
  - integer is positive
    - indicates how many times to output the string to terminal
output: output to terminal
  - print string as many times as integer indicates

EXAMPLES

DATA STRUCTURES
- needs:
  - way to keep track of repetitions

- input: string, integer
  - looping structure
    - break condition: integer
- output: string printed to terminal integer times

ALGORITHM
- print string integer times to terminal
=end

def repeat(string, repetitions)
  repetitions.times { puts string }
end

repeat('Hello', 3)
