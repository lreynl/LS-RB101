def reverse(str)
  reversed = []
  str = str.split('')
  str.each { |char| reversed.unshift(char) }
  reversed.join('')
end

def reverse!(str)
  len = str.length / 2
  (0..len).each { |index| str[index], str[-index - 1] = str[-index - 1], str[index] }
end

string = 'reverse me'
p reverse(string)
p string
reverse!(string)
p string