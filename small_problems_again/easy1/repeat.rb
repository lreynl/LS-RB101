def repeat(str, num)
  return if num < 0
  num.round.times { puts str }
end

repeat('Hi', 5)
