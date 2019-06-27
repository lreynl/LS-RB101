def odd_numbers
  #(1..99).each { |num| puts num if num.odd? }
  1.upto(99) { |num| puts num if num.odd? }
end

odd_numbers