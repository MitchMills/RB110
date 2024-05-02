MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = 1440

def after_midnight(time)
  hours, minutes = time.split(':').map(&:to_i)
  ((hours * MINUTES_PER_HOUR) + minutes) % MINUTES_PER_DAY
end

def before_midnight(time)
  (MINUTES_PER_DAY - after_midnight(time)) % MINUTES_PER_DAY
end

p after_midnight('00:00') == 0
p after_midnight('12:34') == 754
p after_midnight('24:00') == 0
p after_midnight('03:03') == 183

p before_midnight('00:00') == 0
p before_midnight('12:34') == 686
p before_midnight('24:00') == 0
p before_midnight('23:57') == 3
p before_midnight('14:00') == 600
