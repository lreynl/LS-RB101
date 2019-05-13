def mid_char(str)
  return str if str.length <= 2
  index = (str.length / 2).floor
  return str[index] if str.length.odd?
  return str[index - 1, 2] if str.length.even?
end

p mid_char('abcde')
p mid_char('Launchschool')
p mid_char('Launch School')
p mid_char('z')
p mid_char('')