def merge(left, right)
  result = []
  until left.empty? || right.empty?
    result << if left[0] <= right[0]
                left.shift
              else
                right.shift
              end
  end
  until left.empty?
    result << left.shift
  end
  until right.empty?
    result << right.shift
  end
  result
end

def merge_sort(arr)
  return if arr.length <= 1
  half = arr.length / 2
  left = arr.slice(0..(half - 1))
  right = arr.slice(half..-1)
  left = merge_sort(left)
  right = merge_sort(right)
  merge(left, right)
end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
p merge_sort([]) == []
p merge_sort([0]) == [0]
