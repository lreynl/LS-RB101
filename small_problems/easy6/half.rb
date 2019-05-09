def half(arr)
  return [[], []] if arr.empty?
  split = []
  split << arr[0..(arr.length / 2).ceil]
  split << arr[(arr.length / 2).ceil + 1..-1]
  split
end

p half([1,2,3,4,5,6])
p half([1, 2, 3, 4, 5])
p half([1,2,3,4,5,6,7,8,9,0,11,22,33,44,55,66,77,88,99,00,11])
p half([5])
p half([])