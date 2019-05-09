def reverse(arr)
  copy = []
  (arr.length).times do |index|
    copy[index] = arr[-1 * (index + 1)]
  end
  copy
end

list = [1,2,3,4,5]
p list.object_id
p list = reverse(list)
p list.object_id