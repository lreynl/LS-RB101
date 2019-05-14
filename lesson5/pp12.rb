arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

hash = {}
arr.each { |sub_arr| hash[sub_arr[0]] = sub_arr[1] }
p hash