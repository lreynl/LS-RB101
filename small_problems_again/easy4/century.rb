def suffix(century)
  last_two = century % 100.0
  last = last_two % 10.0
  case last
  when 1
    last_two == 11 ? 'th' : 'st'
  when 2
    last_two == 12 ? 'th' : 'nd'
  when 3
    last_two == 13 ? 'th' : 'rd'
  else
    'th'
  end  
end

def year_to_century(year)
  (year / 100.0).ceil
end  

def century(year)
  century = year_to_century(year)
  century.to_s + suffix(century)
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'