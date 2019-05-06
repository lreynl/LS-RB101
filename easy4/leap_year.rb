def julian(year)
  (year % 4).zero?
end

def gregorian(year)
  if (year % 4).zero?
    return true unless (year % 100).zero? && year % 400 != 0
  end
  false
end

def leap_year?(year)
  return julian(year) if year <= 1752
  gregorian(year)
end

p leap_year?(2016)
p leap_year?(2015)
p leap_year?(2100)
p leap_year?(2400)
p leap_year?(240_000)
p leap_year?(240_001)
p leap_year?(2000)
p leap_year?(1900)
p leap_year?(1752)
p leap_year?(1700)
p leap_year?(1)
p leap_year?(100)
p leap_year?(400)
