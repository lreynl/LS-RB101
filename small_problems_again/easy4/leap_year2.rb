def julian?(year)
  year < 1752
end

def leap_year?(year)
  if julian?(year)
    return year % 4 == 0
  end
  if year % 4 == 0
    return true unless year % 100 == 0 && year % 400 != 0
  end
  false
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true
