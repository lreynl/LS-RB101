def swap!(arr, i, j)
  arr[i], arr[j] = arr[j], arr[i]
end

def bubble_sort!(arr)
  loop do
    swap = false
    index = 0
    while index <= arr.length - 2
      if arr[index] > arr[index + 1]
        swap!(arr, index, index + 1)
        swap = true
      end
      index += 1
    end
    break unless swap
  end
  arr
end

array = [5, 3]
bubble_sort!(array)
p array #== [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array# == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array #== %w(Alice Bonnie Kim Pete Rachel Sue Tyler)