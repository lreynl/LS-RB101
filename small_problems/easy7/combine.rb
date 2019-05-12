def interleave(arr1, arr2)
  combined = []
  max_len = [arr1.length, arr2.length].max
  max_len.times do
    combined << arr1.shift
    combined << arr2.shift
  end
  combined
end

p interleave([1, 2, 3], ['a', 'b', 'c', 'd'])