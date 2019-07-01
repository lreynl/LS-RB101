def line(width, stars)
  puts ' ' * ((width - stars) / 2) + '*' * stars + ' ' * ((width - stars) / 2)
end

def diamond(num)
  return line(1, 1) if num == 1
  stars = 1
  while stars <= num
    line(num, stars)
    stars += 2
  end
  stars -= 4
  while stars >= 1
    line(num, stars)
    stars -= 2
  end
end

diamond(1)
diamond(5)
diamond(9)
diamond(20)