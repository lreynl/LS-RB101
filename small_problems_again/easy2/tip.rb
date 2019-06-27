def amounts
  print 'What\'s the total bill? '
  bill = gets.chomp.to_f
  print 'What\'s the tip percentage? '
  percentage = gets.chomp.to_f / 100.0
  [bill, percentage]
end

def calc_tip(cost)
  print sprintf("%s%.2f%s", "The tip is $", (cost[0] * cost[1]), ".\n")
  print sprintf("%s%.2f%s", "The total bill is $",(cost[0] + cost[0] * cost[1]), ".\n")
end

calc_tip(amounts)
  