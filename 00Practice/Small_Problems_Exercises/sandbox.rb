# def friday_13th(year)
#   (1..12).count { |month| Time.new(year, month, 13).friday? }
# end

# p friday_13th(2015) == 3
# p friday_13th(1986) == 1
# p friday_13th(2019) == 2

require 'date'

def five_friday_months(year)
  (1..12).count { |month| fridays_in_month(year, month) == 5 }
end

def fridays_in_month(year, month)
  first_friday = get_first_friday(year, month)
  (first_friday..31).step(7).count { |day| Date.valid_date?(year, month, day) }
end

def get_first_friday(year, month)
  (1..7).find { |day| Date.new(year, month, day).friday? }
end

p five_friday_months(2015) == 4
p five_friday_months(1986) == 4
p five_friday_months(2019) == 4
p five_friday_months(2021) == 5
