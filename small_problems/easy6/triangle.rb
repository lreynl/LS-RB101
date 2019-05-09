def triangle(num)
  num.times { |index| puts ' ' * (num - 1 - index) + '*' * (1 + index) }
end

triangle(0)
triangle(5)
triangle(9)