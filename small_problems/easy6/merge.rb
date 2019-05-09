def merge(arr1, arr2)
  (arr1 + arr2).uniq
end

p merge([1,2,3,4], [3,4,5,6])