def reverse!(arr)
  (arr.length * 0.5).round.times do |index|
    arr[index], arr[index - 2*index - 1] = arr[index - 2*index - 1], arr[index]
  end
  arr
end


list = [1,2,3,4]
result = reverse!(list)
list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]

list = ['abc']
p reverse!(list) == ["abc"]
p list == ["abc"]

list = []
p reverse!(list) == []
p list == []