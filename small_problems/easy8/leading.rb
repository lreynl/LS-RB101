def substrings_at_start(str)
  sub_str = []
  str.length.times do
    sub_str.unshift(str)
    str = str.chop
  end
  sub_str
end

p substrings_at_start('abc')
p substrings_at_start('xxyyzz')