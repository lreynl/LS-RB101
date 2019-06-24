def sine(width)
  return 'error!' if width < 1
  x = width.round
  y = x
  r = x
  circle = ""
  top_half = ""
  line = ""
  y.downto(0) do |inc|
    x = r - Math.asin(inc/x)
    (r - x).round.times do
      line += ' '
    end
    line += "*"
    x.round.times do
      line += ' '
    end
    #line += line.reverse + "\n"
    
    circle += line +"\n"

    line = ""
  end
  circle + circle.chomp.reverse
end

puts sine(50)