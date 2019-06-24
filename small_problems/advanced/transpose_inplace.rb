def swap(arr, diag, i)
  temp = arr[diag][i]
  arr[diag][i] = arr[i][diag]
  arr[i][diag] = temp
end

def swap_row_col(arr, diag)
  diag.upto(arr.length - 1) { |index| swap(arr, diag, index) }
end

def transpose(arr)
  arr.length.times do |diag|
    swap_row_col(arr, diag)
  end
  arr
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)
p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

matrix = [ 
  [1,2,3,4,5],
  [6,7,8,9,10],
  [11,12,13,14,15],
  [16,17,18,19,20],
  [21,22,23,24,25]
]

new_matrix = transpose(matrix)
p new_matrix == [[1, 6, 11, 16, 21], [2, 7, 12, 17, 22], [3, 8, 13, 18, 23], [4, 9, 14, 19, 24], [5, 10, 15, 20, 25]]
p matrix == [ 
  [1,2,3,4,5],
  [6,7,8,9,10],
  [11,12,13,14,15],
  [16,17,18,19,20],
  [21,22,23,24,25]
]
