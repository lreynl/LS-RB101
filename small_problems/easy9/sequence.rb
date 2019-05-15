def sequence(count, multiplier)
  sequence = []
  count.times { |index| sequence << (index + 1) * multiplier }
  sequence
end

p sequence(5, 2)
p sequence(0, 9)
p sequence(7, -7)
p sequence(3, 0)