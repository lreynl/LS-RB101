def substrings_at_start(str)
  sub_str = []
  str.length.times do
    sub_str.unshift(str)
    str = str.chop
  end
  sub_str
end

def all_substr(str)
  result = []
  str.length.times do
    result.push(substrings_at_start(str))
    str = str[1..-1]
  end
  result.flatten
end

p all_substr('abcd')