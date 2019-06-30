def letter_case_count(str)
  lower = 'a-z'
  upper = 'A-Z'
  non_alpha = '^a-zA-Z'
  result = {}
  result[:lowercase] ||= str.count(lower)
  result[:uppercase] ||= str.count(upper)
  result[:neither] ||= str.count(non_alpha)
  result
end


p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }