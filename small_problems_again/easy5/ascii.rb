def ascii_value(str)
  return 0 if str.empty?
  str.split('').map { |char| char.ord }.reduce(:+)
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0