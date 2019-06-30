def buy_fruit(arr)
  list = []
  arr.each do |item|
    item[1].times { list << item[0] }
  end
  list
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
  