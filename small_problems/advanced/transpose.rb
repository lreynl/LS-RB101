def swap(arr, arr_dup, diag, i)
  arr_dup[diag][i] = arr[i][diag]
  arr_dup[i][diag] = arr[diag][i]
end

def swap_row_col(arr, arr_dup, diag)
  diag.upto(arr.length - 1) { |index| swap(arr, arr_dup, diag, index) }
end

def transpose(arr)
  arr_dup = []
  arr.length.times { arr_dup.push([]) }
  arr_dup.length.times do |diag|
    swap_row_col(arr, arr_dup, diag)
  end
  arr_dup
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


matrix = [
  [1, 2],
  [3, 4]
]

new_matrix = transpose(matrix)
p new_matrix == [[1, 3], [2, 4]]
p matrix == [[1, 2], [3, 4]]
