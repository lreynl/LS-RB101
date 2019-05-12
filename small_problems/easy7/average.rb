def average(arr)
  format("%.3f", arr.reduce(:*) / arr.length.to_f)
end

p average([2, 5, 7, 11, 13, 17])