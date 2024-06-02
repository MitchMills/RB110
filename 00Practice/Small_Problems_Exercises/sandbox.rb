VALID_TOKENS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

OPERATORS = {
  'ADD' => :+,
  'SUB' => :-,
  'MULT' => :*,
  'DIV' => :/,
  'MOD' => :%
}

def minilang(program)
  return "Error: invalid token(s) in program" unless all_tokens_valid?(program)
  memory = { register: 0, stack: [] }
  process_program(program, memory)
end

def all_tokens_valid?(program)
  program.split.all? { |token| valid_token?(token) }
end

def valid_token?(token)
  VALID_TOKENS.include?(token) || token.to_i.to_s == token
end

def process_program(program, memory)
  program.split.each do |token|
    return "Error: empty stack" if stack_error?(memory[:stack], token)
    memory[:register] = process_token(memory, token)
  end
  nil
end

def stack_error?(stack, token)
  stack.empty? && (token == 'POP' || OPERATORS.include?(token))
end

def process_token(memory, token)
  inputs = [memory[:register], memory[:stack], token]
  OPERATORS.include?(token) ? calculation(inputs) : other_operation(inputs)
end

def calculation(inputs)
  register, stack, token = inputs
  operands = [register, stack.pop]
  operator = OPERATORS[token]
  operands.inject(operator)
end

def other_operation(inputs)
  register, stack, token = inputs
  case token
  when 'PUSH'
    stack << register
    register
  when 'POP' then stack.pop
  when 'PRINT' then p register
  else token.to_i
  end
end
