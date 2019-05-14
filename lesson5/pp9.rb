arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map! { |sub_arr| sub_arr.sort { |a, b| b <=> a } }
p arr