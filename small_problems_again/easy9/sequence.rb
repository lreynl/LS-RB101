def sequence(num)
  if num > 0
    (1..num).to_a
  else
    num.upto(0).to_a if num <= 0
  end
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(-5) == [-5,-4,-3,-2,-1,0]
p sequence(0) == [0]
p sequence(-1) == [-1, 0]