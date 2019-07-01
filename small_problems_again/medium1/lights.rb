def lights(num)
  result = Array.new(num, false)
  step = 1  
  result.each_with_index do |elem, index|
    i = step
    until i > num
      result[i - 1] = !result[i - 1]
      i += step
    end
    step += 1
  end
  result.map.with_index { |elem, index| index + 1 if elem }.select { |elem| elem }
end

p lights(5)
p lights(10)
p lights(1000)
