def substrings_at_start(str)
  result = []
  str.chars.each_with_index do |_, index|
    result << str[0..index]
  end
  result
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']