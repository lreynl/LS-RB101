def center(n)
  puts '*' * n
end

def star_line(num, n)
  line = ''
  line += ' ' * (n - 1) + '*' + ' ' * ((num - 3) / 2 - (n - 1))
  line += '*'
  line += ' ' * ((num - 3) / 2 - (n - 1)) + '*' + ' ' * (n - 1)
  puts line
end

def upper(num)
  1.upto(num / 2) do |n| 
    star_line(num, n)
  end
end

def lower(num)
 (num / 2).downto(1) do |n|
    star_line(num, n)
  end 
end

def star(n)
  upper(n)
  center(n)
  lower(n)
end

star(7)
star(9)
star(19)