def short_long_short(str1, str2)
  str1.length > str2.length ? str2 + str1 + str2 : str1 + str2 + str1
end

p short_long_short('123','abcdef')
p short_long_short('zyxwv', '987')
