# rock paper scissors
OPTIONS = %w(rock paper scissors)

def prompt(message)
  print "> #{message}"
end

# prompt player to choose from OPTIONS
def player_rps
  loop do
    prompt("Choose #{OPTIONS.join(', ')}: ")
    choice = gets.chomp.downcase
    break choice unless OPTIONS.include?(choice) == false
  end
end

# generate computer's choice
def comp_rps
  OPTIONS.sample
end

# decide the winner based on player's and
# computer's choice
def winner(player, comp)
  return 'tie' if player == comp
  if player == 'rock'
    comp == 'scissors' ? 'player' : 'comp'
  elsif player == 'paper'
    comp == 'rock' ? 'player' : 'comp'
  else # player = scissors
    comp == 'rock' ? 'comp' : 'player'
  end
end

system "clear"

prompt("🗿📄✂️ rock paper scissors game 🗿📄✂️\n")
prompt("\n")

# loop until player decides to stop
loop do
  player = player_rps
  comp = comp_rps
  prompt("#{player} vs. #{comp} ... ")
  case winner(player, comp)
  when 'tie'
    print "TIE\n"
  when 'player'
    print "You Win!\n"
  when 'comp'
    print "Computer Wins!\n"
  end
  prompt("Play again? (y/n) ")
  break unless gets.chomp.downcase == 'y'
end
