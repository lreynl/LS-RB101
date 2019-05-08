def after_midnight(time)
  time = time.split(':')
  minutes = time[0].to_i * 60 + time[1].to_i
  minutes %= 1440
end

def before_midnight(time)
  time = time.split(':')
  minutes = time[0].to_i * 60 + time[1].to_i
  minutes = 1440 - minutes
  minutes %= 1440
end

p after_midnight("12:34")
p after_midnight("00:01")
p after_midnight("24:00")
p before_midnight("12:34")
p before_midnight("00:01")
p before_midnight("24:00")