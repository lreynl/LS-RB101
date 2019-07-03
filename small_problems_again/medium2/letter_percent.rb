def letter_percentages(str)
  count = { lowercase: 0, uppercase: 0, neither: 0 }
  total_count = str.length.to_f / 100
  str.chars.each do |char|
    count[:lowercase] += 1 if /[a-z]/     === char
    count[:uppercase] += 1 if /[A-Z]/     === char
    count[:neither]   += 1 if /[^a-zA-Z]/ === char
  end
  count[:lowercase] /= total_count
  count[:uppercase] /= total_count
  count[:neither]   /= total_count
  count[:lowercase] = count[:lowercase].round(2)
  count[:uppercase] = count[:uppercase].round(2)
  count[:neither  ] =   count[:neither].round(2)
  count
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
p letter_percentages('abcdefGHI')