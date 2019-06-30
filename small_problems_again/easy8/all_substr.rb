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



p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]