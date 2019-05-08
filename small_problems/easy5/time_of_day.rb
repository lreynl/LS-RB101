def time(minutes)
  if minutes < 0
    minutes *= -1
    neg = true
  end
  while minutes > 1440
    minutes %= 1440
  end
  minutes = 1440 - minutes if neg
  "#{format("%02d", minutes / 60)}:#{format("%02d", minutes % 60)}"
end

p time(0)
p time(-3)
p time(35)
p time(-1437)
p time(3000)
p time(800)
p time(-4231)