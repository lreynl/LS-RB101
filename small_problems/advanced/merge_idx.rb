def merge(arr1, arr2)
  return arr2 if arr1.empty?
  return arr1 if arr2.empty?
  result = []
  i = 0 
  j = 0 
  while i < arr1.length || j < arr2.length
  
    while i < arr1.length 
      if j < arr2.length
        if arr1[i] <= arr2[j]
          result.push(arr1[i])
        else
          break
        end        
      else
        result.push(arr1[i])
      end
      i += 1
    end
    
    while j < arr2.length
      if i < arr1.length
        if arr2[j] < arr1[i]
          result.push(arr2[j])
        else
          break
        end
      else
        result.push(arr2[j])
      end
      j += 1
    end
    
  end
  result
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 5, 9], [2, 6, 8])
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]