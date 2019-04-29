vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(list)
  inventory = Hash.new(0)
  list.each { |car| inventory[car.downcase.to_sym] += 1 }
  inventory.each_pair { |car, quant| puts "#{car} => #{quant}" }
end

count_occurrences(vehicles)
