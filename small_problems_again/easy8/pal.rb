def substrings(str)
  result = []
  len = str.length - 1
  str.chars.each_with_index do |_, index_outer|
    for index in (index_outer..len) do
      result << str[index_outer..index]
    end
  end
  result
end

def palindrome?(str)
  str == str.reverse
end

def palindromes(str)
  word_list = substrings(str)
  word_list.select { |word| word.length > 1 && palindrome?(word) }
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]