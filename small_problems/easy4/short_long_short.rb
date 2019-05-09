def short_long_short(str1, str2)
  return str1 + str2 + str1 if str1.length < str2.length
  str2 + str1 + str2
end

p short_long_short('abc', 'defgh')
p short_long_short('abcde', 'fgh')
p short_long_short('', 'xyz')
