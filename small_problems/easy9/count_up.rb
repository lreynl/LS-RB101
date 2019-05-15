def sequence(num)
  #sequence = []
  #num.times { |index| sequence.push(index + 1) }
  #sequence
  if num > 0
    (1..num).to_a
  else
    (num..0).to_a if num <= 0
  end
end

p sequence(9)
p sequence(1)
p sequence(0)
p sequence(-5)
p sequence(-1)