def check_pal(str)
  str.reverse == str
end

def pal_list(str)
  list = []
  return list if str.empty?
  i = 0
  j = 2
  while i <= str.length - 2
    while j < str.length
      list << str.slice(i, j) if check_pal(str.slice(i, j))
      j += 1
    end
    j = 2
    i += 1
  end
  list
end

p pal_list("supercalifragilisticexpialidocious")
p pal_list("abcddcbA")
p pal_list("")