def count_fri_13(year)
  fri_13_count = 0
  (1..12).each do |month|
    fri_13_count +=1 if Time.gm(year, month, 13).friday?
  end
  fri_13_count
end

p count_fri_13(2015)
p count_fri_13(1986)
p count_fri_13(2019)
