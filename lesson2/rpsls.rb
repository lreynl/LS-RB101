# rock paper scissors
OPTIONS = %w(r p s l sp)
WINNING_PAIRS = { r:  ['scissors', 'lizard'],
                  p:  ['rock', 'spock'],
                  s:  ['paper', 'lizard'],
                  l:  ['paper', 'spock'],
                  sp: ['rock', 'scissors'] }

KEY = { r: 'rock', p: 'paper', s: 'scissors', l: 'lizard', sp: 'spock' }
wins = { player: 0, comp: 0 }
how_many_to_win = 5

def prompt(message)
  print "> #{message}"
end

def player_rps
  loop do
    prompt("Choose #{OPTIONS.join(', ')}: ")
    choice = gets.chomp.downcase
    break choice unless OPTIONS.include?(choice) == false
  end
end

def comp_rps
  OPTIONS.sample
end

def winner(player, comp)
  return 'tie' if player == comp
  if WINNING_PAIRS[player.to_sym].include?(KEY[comp.to_sym])
    'player'
  else
    'comp'
  end
end

system "clear"

prompt("🗿📄✂🦎🖖️ Rock, Paper, Scissors, Lizard, Spock Game 🗿📄✂🦎🖖️\n")
prompt("First to #{how_many_to_win} wins!\n")
prompt("\n")

loop do
  player = player_rps
  comp = comp_rps
  prompt("#{KEY[player.to_sym]} vs. #{KEY[comp.to_sym]} ... ")
  case winner(player, comp)
  when 'tie'
    print "TIE\n"
  when 'player'
    print "You Win!\n"
    wins[:player] += 1
  when 'comp'
    print "Computer Wins!\n"
    wins[:comp] += 1
  end
  prompt("Play again? (y/n) ")
  break unless gets.chomp.downcase == 'y'
  break if wins[:player] == how_many_to_win || wins[:comp] == how_many_to_win
end

prompt("Final score ... YOU: #{wins[:player]} COMPUTER: #{wins[:comp]}\n")
