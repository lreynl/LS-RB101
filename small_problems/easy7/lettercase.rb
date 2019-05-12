def case_count(str)
  hash = { lowercase: 0, uppercase: 0, neither: 0 }
  str.chars.each do |char|
    if /[a-z]/.match?(char)
      hash[:lowercase] += 1
    elsif /[A-Z]/.match?(char)
      hash[:uppercase] += 1
    else
      hash[:neither] += 1
    end
  end
  hash
end

p case_count('abCdef 123')
p case_count('AbCd +Ef')
p case_count('')