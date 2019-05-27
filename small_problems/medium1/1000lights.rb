def flip_switches(num)
  switches = Array.new(num, false)
  i, counter, results = 0, 0, []
  while counter < num
    i = counter
    counter += 1
    while i < num
      switches[i] = !switches[i]
      i += counter
    end
  end
  switches.each_with_index { |elem, index| results.push(index + 1) if elem }
  results
end

p flip_switches(1000)
