def halvsies(arr)
  if arr.length < 2
    return [arr, []]
  end
  len = arr.length
  if len.odd?
    [ arr[0..(len / 2)], arr[(len / 2 + 1)..-1] ]
  else
    [ arr[0..(len / 2 - 1)], arr[(len / 2)..-1] ] # ruby rounds len / 2
  end
end

p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
