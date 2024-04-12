MAX_NUMBER_WITH_UNIQUE_DIGITS = 9_876_543_210

FEATURED_REQUIREMENTS = {
  parity: :odd,
  multiple_of: 7,
  unique_digits: true
}

def featured(number, requirements = FEATURED_REQUIREMENTS)
  return no_solution_message if no_solution?(number, requirements)

  start_number = start_number(number, requirements)
  factor = requirements[:multiple_of]

  (start_number..).step(factor * 2).find do |num|
    requirements[:unique_digits] ? all_digits_unique?(num) : num
  end
end

def no_solution_message
  "There is no number that can fulfill the given requirements."
end

def no_solution?(number, requirements)
  (requirements[:unique_digits] && number >= MAX_NUMBER_WITH_UNIQUE_DIGITS) ||
  (requirements[:parity] == :odd && requirements[:multiple_of].even?)
end

def start_number(number, requirements)
  next_multiple = next_multiple(number, factor)
  factor = requirements[:multiple_of]

  if requirements[:parity] == :odd
    adjust_for_parity(Proc.new(&:odd?), next_multiple, factor)
  elsif requirements[:parity] == :even
    adjust_for_parity(Proc.new(&:even?), next_multiple, factor)
  end
end

def next_multiple(number, factor)
  ((number / factor) + 1) * factor
end

def adjust_for_parity(parity, number, factor)
  number.parity ? number : number + factor
end

def all_digits_unique?(number)
  number.digits.size == number.digits.uniq.size
end

p adjust_for_parity(:odd?, 14, 7)
