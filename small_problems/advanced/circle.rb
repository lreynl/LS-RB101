def circle(width)
  return 'error!' if width < 1
  r = width / 2
  y = x = r
  circle = ""
  top_half = ""
  line = ""
  y.downto(0) do |inc|
    x = Math.sqrt(r**2 - inc**2)
    (r - x).round.times do
      line += ' '
    end
    line += "*"
    x.round.times do
      line += ' '
    end
    line += line.reverse + "\n"
    circle += line

    line = ""
  end
  circle + circle.chomp.reverse
end

puts circle(52)