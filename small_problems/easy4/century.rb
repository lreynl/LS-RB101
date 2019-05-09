def div_by_100(num)
  num / 100.0
end

def century(num)
  num = div_by_100(num).ceil
  num.to_s + suffix(num)
end

def suffix(num)
  num = '0' + num.to_s
  last_2 = num[-2..-1].to_i
  if last_2 > 3 && last_2 < 21
    'th'
  elsif last_2 == 1
    'st'
  elsif last_2 == 2
    'nd'
  elsif last_2 == 3
    'rd'
  else
    'th'
  end
end

p century(2000)
p century(2001)
p century(1965)
p century(256)
p century(5)
p century(10103)
p century(1052)
p century(1127)
p century(11201)