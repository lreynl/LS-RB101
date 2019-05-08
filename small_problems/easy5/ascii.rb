def ascii_sum(string)
  sum = 0
  while string.length > 0
    sum += string.slice!(0).ord # .chr is the opposite of ord
  end
  sum
end

p ascii_sum('Four score')
p ascii_sum('Launch School')
p ascii_sum('a')
p ascii_sum('')
