MIN_IN_DAY = 1440

def after_midnight(time)
  time = time.split(':')
  hours = time[0]
  minutes = time[1]
  (hours.to_i * 60 + minutes.to_i) % MIN_IN_DAY
end

def before_midnight(time)
  (MIN_IN_DAY - after_midnight(time)) % MIN_IN_DAY
end



p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0