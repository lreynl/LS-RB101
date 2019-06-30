def dms(angle)
  deg = angle.floor
  angle = angle - angle.floor
  angle *= 60
  angle = angle.round(5)
  min = angle.floor
  angle = angle - angle.floor
  angle *= 60
  sec = angle.round % 60.0
  if sec == 60
    sec = 0
    min += 1
  end
  if min == 60
    min = 0
    deg += 1
  end
  deg %= 360
  deg.to_s + '°' + "%02.f" % min + '\'' + "%02.f" % sec + '"'
end



puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
puts dms(400) == %(40°00'00")
puts dms(-40) == %(320°00'00")
puts dms(-420) == %(300°00'00")