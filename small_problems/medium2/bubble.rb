def swap(arr, i, j)
  arr[j], arr[i] = arr[i], arr[j]
end

def do_bubble!(arr)
  loop do
    swap = false
    arr.each_with_index do |_, index|
      break if index > arr.size - 2
      if arr[index] > arr[index + 1]
        swap(arr, index, index + 1)
        swap = true
      end
    end
    break if !swap
  end
end

names = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
#p do_bubble!([6, 2, 7, 1, 4])
#p do_bubble!([5,3])
#p do_bubble!([3,5])
do_bubble!(names)
p names