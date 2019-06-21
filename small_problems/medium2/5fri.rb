def has_5_fri(year)
  secs_in_day = 86400
  date = Time.gm(year)
  fri_count = 0
  months_with_5_fri = 0
  cur_month = date.month
  while date.year == year
    fri_count += 1 if date.friday?
    if fri_count == 5
      months_with_5_fri += 1
      fri_count = 0
    end
    date += secs_in_day
    if date.month > cur_month
      cur_month = date.month
      fri_count = 0
    end
  end
  months_with_5_fri
end

p has_5_fri(2000)
p has_5_fri(2001)
p has_5_fri(2002)
p has_5_fri(2003)
p has_5_fri(2004)
p has_5_fri(2005)
p has_5_fri(2006)
p has_5_fri(2007)
p has_5_fri(2008)
p has_5_fri(2009)
p has_5_fri(2010)
p has_5_fri(2011)
p has_5_fri(2012)
p has_5_fri(2013)
p has_5_fri(2014)
p has_5_fri(2015)
p has_5_fri(2016)
p has_5_fri(2017)
p has_5_fri(2018)
p has_5_fri(2019)
