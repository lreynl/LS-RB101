require 'date'

def friday_13th(year)
  day = 13
  month = 1
  fri_13_count = 0
  date = Date.new(year, month, day)
  12.times do
    fri_13_count += 1 if date.friday?
    date = date.next_month
  end
  fri_13_count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2