def print_line(width, num)
  side = ' ' * ((width - num) / 2)
  center = '*' if num == 1
  center = '*' + ' ' * (num - 2) + '*' if num != 1
  puts side + center + side
end

def diamond(width)
  return if width.even?
  i = 1
  until i == width
    print_line(width, i)
    i += 2
  end
  while i >= 1
    print_line(width, i)
    i -= 2
  end
end

diamond(1)
diamond(2)
diamond(5)
diamond(9)
diamond(21)