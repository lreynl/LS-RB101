def rotate(str)
  return str if str.length <= 1
  str.slice(1..-1) + str[0]
end

p rotate("testing")
p rotate('A')
p rotate('')