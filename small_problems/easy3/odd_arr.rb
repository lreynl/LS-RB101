def remove_even_index(arr)
  copy = []
  arr.each_with_index { |elem, index| copy << elem if (index + 1).odd? }
  arr = copy
end

#def remove_even_index(arr)
#  index = 0
#  while(index <= arr.length - 1)
#    index += 1
#    arr.delete_at(index)
#  end
#  arr
#end

=begin
def remove_even_index(arr)
  len = (arr.length / 2.0).ceil
  to_keep = []
  odds = []
  len.times { |index| to_keep << index * 2 }
  to_keep.each { |index| odds << arr[index] }
  odds
end
=end

p remove_even_index([1,2,3,4,5,6,7,8,9])
p remove_even_index([4])
p remove_even_index([])
p remove_even_index([1,2])
p remove_even_index(['odd', 'even','odd','even','odd','even'])