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

def player_choice
  loop do
    prompt("Choose #{OPTIONS.join(', ')}: ")
    choice = gets.chomp.downcase
    break choice unless OPTIONS.include?(choice) == false
  end
end

def computer_choice
  OPTIONS.sample
end

def decide_winner(player, comp)
  return 'tie' if player == comp
  if WINNING_PAIRS[player.to_sym].include?(KEY[comp.to_sym])
    'player'
  else
    'comp'
  end
end

def display_results(player_choice, computer_choice, winner)
  prompt("#{KEY[player_choice.to_sym]} vs. #{KEY[computer_choice.to_sym]} ... ")
  case winner
  when 'tie'
    print "TIE\n"
  when 'player'
    print "You Win!\n"
  when 'comp'
    print "Computer Wins!\n"
  end
end

def increment_score(winner, wins)
  wins[winner.to_sym] += 1 unless winner == 'tie'
end

system "clear"

prompt("🗿📄✂🦎🖖️ Rock, Paper, Scissors, Lizard, Spock Game 🗿📄✂🦎🖖️\n")
prompt("First to #{how_many_to_win} wins!\n")
prompt("\n")

loop do
  player = player_choice
  comp = computer_choice
  winner = decide_winner(player, comp)
  display_results(player, comp, winner)
  increment_score(winner, wins)
  prompt("Again? (y/n) ")
  break unless gets.chomp.downcase == 'y'
  break if wins[:player] == how_many_to_win || wins[:comp] == how_many_to_win
end

prompt("Final score ... YOU: #{wins[:player]} COMPUTER: #{wins[:comp]}\n")
