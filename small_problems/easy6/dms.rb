CIRCLE = 360
MIN_SEC = 60
DEG_SIGN = '°'
MIN_SIGN = "\'"
SEC_SIGN = "\""

def dms(deg)
  deg %= CIRCLE
  d = deg.floor
  m = ((deg - d) * MIN_SEC).floor
  s = (((deg - d) * MIN_SEC) - m) * MIN_SEC
  s = s.round
  format("%d%s%02d%s%02d%s", d, DEG_SIGN, m, MIN_SIGN, s, SEC_SIGN)
end

puts dms(76.73)
puts dms(254.6)
puts dms(93.034773)
puts dms(0)
puts dms(360)
puts dms(360)
puts dms(361)
puts dms(-720.1)
puts dms(-179)
puts dms(31680)