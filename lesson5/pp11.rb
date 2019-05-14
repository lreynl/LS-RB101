arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

p arr.map { |sub_arr| sub_arr.select { |num| num % 3 == 0 } }