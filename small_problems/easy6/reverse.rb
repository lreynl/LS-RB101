def reverse(arr)
  (arr.length / 2).floor.times do |index|
    arr[index], arr[-1 * (index + 1)] = arr[-1 * (index + 1)], arr[index]
  end
  arr
end