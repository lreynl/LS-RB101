def run_total(arr)
  running = 0
  arr.map do |elem|
    elem += running
    running = elem
  end
end

p run_total([2, 5, 13])
p run_total([14, 11, 7, 15, 20])
p run_total([3])
p run_total([])