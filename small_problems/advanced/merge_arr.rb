def insert(arr, elem)
  if elem > arr[-1]
    arr.push(elem)
    return
  end
  if elem < arr[0]
    arr.unshift(elem)
    return
  end    
  arr.each_with_index do |_, index|
    break if index > arr.length - 2
    if elem < arr[index + 1] && elem >= arr[index]
      arr.insert(index + 1, elem)
      break
    end
  end
end

def merge(arr1, arr2)
  return arr2 if arr1.empty?
  return arr1 if arr2.empty?
  arr1_copy = []
  arr1.each { |elem| arr1_copy.push(elem) }
  arr2.each { |elem| insert(arr1_copy, elem) }
  arr1_copy
end

p merge([1, 5, 9], [2, 6, 8])

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
    