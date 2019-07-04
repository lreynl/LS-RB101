require 'date'

def five_fri(year)
  date = Date.new(year, 1, 1)
  until date.friday?
    date = date.next_day
  end
  fri_count = 0
  months_with_5_fri = 0
  until date.year > year
    month = date.month
    fri_count += 1 if date.friday?
    date = date.next_day(7)
    if date.month > month
      months_with_5_fri += 1 if fri_count == 5
      fri_count = 0
    end
  end
  months_with_5_fri
end

p five_fri(2000)
p five_fri(2001)
p five_fri(2002)
p five_fri(2003)
p five_fri(2004)
p five_fri(2005)
p five_fri(2006)
p five_fri(2007)
p five_fri(2008)
p five_fri(2009)
p five_fri(2010)
