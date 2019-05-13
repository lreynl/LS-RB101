def substrings_at_start(str)
  sub_str = []
  str.length.times do
    sub_str.unshift(str)
    str = str.chop
  end
  sub_str
end

def palindrome?(str)
  str == str.reverse
end

def all_substr_pal(str)
  result = []
  str.length.times do
    result.push(substrings_at_start(str))
    str = str[1..-1]
  end
  result.flatten!
  result.select { |sub_str| sub_str.length > 1 && palindrome?(sub_str) }
end

p all_substr_pal('hello-madam-did-madam-goodbye')