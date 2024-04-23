def century(year)
  century = get_century(year)
  format_century(century)
end

def get_century(year)
  century, remainder = year.divmod(100)
  remainder == 0 ? century : century + 1
end

def format_century(century)
  quotient, remainder = century.divmod(10)
  suffix = quotient % 10 == 1 ? 'th' : get_suffix(remainder)
  century.to_s + suffix
end

def get_suffix(remainder)
  case remainder
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end
