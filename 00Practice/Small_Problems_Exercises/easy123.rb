def century(year)
  century = determine_century(year)
  suffix = determine_suffix(century)
  century.to_s + suffix
end

def determine_century(year)
  quotient, remainder = year.divmod(100)
  remainder == 0 ? quotient : quotient + 1
end

def determine_suffix(century)
  return 'th' if [11, 12, 13].include?(century % 100)
  case century % 10
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end
