# works for string or array
def pal?(str)
  str == str.reverse
end

p pal?('amanaplanacanalpanama')
p pal?('a man a plan a canal panama')
p pal?([1,2,3,4,3,2,1])
p pal?(['1','2','3','3','2','1'])
p pal?([])
