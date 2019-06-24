
def star(num)
  return 'error!' if num.even?
  top_half = ""
  ((num - 1) / 2).times do |i|
    top_half += (' ' * i + '*' + ' ' * ((num - 3) / 2 - i) + "*" +
                 ' ' * ((num - 3) / 2 - i) + '*' + ' ' * i + "\n")
  end
  center = ("*" * num)
  top_half + center + top_half.reverse
end

puts star(7)
puts star(9)
puts star(10)
puts star(11)