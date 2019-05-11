def mult_by_val(arr, val)
  arr.map { |elem| elem *= val }
end

p mult_by_val([1,2,3,4,5], 3)
p mult_by_val([], 0)