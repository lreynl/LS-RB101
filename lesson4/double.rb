def double_nums(arr)
  arr.map { |num| num *= 2 }
end

def double_odd_i(arr)
  arr.each_index { |index| arr[index] *= 2 if index.odd? }
end

p double_nums([1,2,3,4,5])
p double_odd_i([1,2,3,4,5])