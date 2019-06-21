def char_count(arr, regex, total)
  ((arr.count do |char| 
  regex === char 
  end / total) * 100).round(2)
end

def letter_percentages(str)
  percentages = { lowercase: 0, uppercase: 0, neither: 0 }
  str = str.split('')
  total_count = str.length.to_f
  upper_case = /[A-Z]/
  lower_case = /[a-z]/
  non_alpha = /[^a-zA-Z]/
  percentages[:uppercase] = char_count(str, upper_case, total_count)
  percentages[:lowercase] = char_count(str, lower_case, total_count)
  percentages[:neither] = char_count(str, non_alpha, total_count)
  percentages
end

p letter_percentages('abCdef 123')
p letter_percentages('AbCd +Ef')
p letter_percentages('123')
p letter_percentages('abcdefGHI')
