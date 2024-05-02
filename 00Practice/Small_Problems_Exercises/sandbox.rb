MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24

def time_of_day(minutes)
  hours, minutes = minutes.divmod(MINUTES_PER_HOUR)
  hours %= HOURS_PER_DAY
  [hours, minutes].map do |unit|
    unit < 10 ? unit.to_s.prepend('0') : unit.to_s
  end.join(':')
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
