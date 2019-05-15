def buy_fruit(arr)
  list = []
  arr.each { |sub_arr| sub_arr[1].times { list.push(sub_arr[0]) } }
  list
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]])