def print_line(width, stars, corner)
  line = ' ' * (width - stars) + '*' * stars
  puts corner == :lr || corner == :ur ? line : line.reverse
end

def triangle(width, corner)
  range = if corner == :ll || corner == :lr
            (1..width)
          else
            width.downto(1)
          end
  range.each { |stars| print_line(width, stars, corner) }
end

triangle(5, :ul)
triangle(5, :ur)
triangle(5, :lr)
triangle(5, :ll)
