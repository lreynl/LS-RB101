# rock paper scissors
OPTIONS = %w(r p s l sp)

WINNING_PAIRS = { r:  ['scissors', 'lizard'],
                  p:  ['rock', 'spock'],
                  s:  ['paper', 'lizard'],
                  l:  ['paper', 'spock'],
                  sp: ['rock', 'scissors'] }

KEY = { r: 'rock', p: 'paper', s: 'scissors', l: 'lizard', sp: 'spock' }

wins = { player: 0, computer: 0 }

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
  if WINNING_PAIRS[player.to_sym].include?(comp.to_sym)
    'player'
  else
    'comp'
  end
end

system "clear"

prompt("🗿📄✂🦎🖖️ Rock, Paper, Scissors, Lizard, Spock Game 🗿📄✂🦎🖖️\n")
prompt("\n")

# loop until player decides to stop
loop do
  player = player_rps
  comp = comp_rps
  prompt("#{KEY[player.to_sym]} vs. #{KEY[comp.to_sym]} ... ")
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
