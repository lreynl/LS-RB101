# rock paper scissors
OPTIONS = %w(rock paper scissors)

def prompt(message)
  print "> #{message}"
end

def player_rps
  loop do
    prompt("YOU: choose #{OPTIONS.join(', ')}. ")
    choice = gets.chomp.downcase
    break choice unless OPTIONS.include?(choice) == false
  end
end

def comp_rps
  OPTIONS.sample
end

def winner(player, comp)
  return 't' if player == comp
  if player == 'rock'
    comp == 'scissors' ? result = 'p' : result = 'c'
  elsif player == 'paper'
    comp == 'rock' ? result = 'p' : result = 'c'
  else # player = scissors
    comp == 'rock' ? result = 'c' : result = 'p'
  end
  result
end

system "clear"

prompt("🗿📄✂️ rock paper scissors game 🗿📄✂️\n")
prompt("\n")

loop do
  player = player_rps
  comp = comp_rps
  prompt("#{player} vs. #{comp} ... ")
  case winner(player, comp)
  when 't'
    print "TIE\n"
  when 'p'
    print "You Win!\n"
  when 'c'
    print "Computer Wins!\n"
  else
    print "Something Broke!\n"
  end
  prompt("Play again? (y/n) ")
  break unless gets.chomp.downcase == 'y'
end