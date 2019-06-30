
def middle_word(str)
  str = str.split
  return if str.empty? || str.length.even?
  return str[0] if str.length == 1
  middle = str.length / 2
  str[middle]
end

p middle_word('')
p middle_word('a')
p middle_word('a ball')
p middle_word('a ball car dog egg')
