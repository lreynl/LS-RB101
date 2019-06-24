def transpose(arr)
  arr_dup = []
  arr[0].length.times do |i|
    row = []
    arr.length.times do |j|
      row.push(arr[j][i])
    end
    arr_dup.push(row)
  end
  arr_dup
end

p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]])
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]

p transpose([[1]]) == [[1]]
