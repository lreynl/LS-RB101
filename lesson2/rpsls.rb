# rock paper scissors lizard spock
OPTIONS = %w(r p s l sp)
WINNING_PAIRS = { r:  ['scissors', 'lizard'],
                  p:  ['rock', 'spock'],
                  s:  ['paper', 'lizard'],
                  l:  ['paper', 'spock'],
                  sp: ['rock', 'scissors'] }

KEY = { r: ['rock', '[r]ock'], p: ['paper', '[p]aper'], s: ['scissors', '[s]cissors'], 
        l: ['lizard', '[l]izard'], sp: ['spock', '[sp]ock'] }
wins = { player: 0, comp: 0 }
to_win = 5

def prompt(message)
  print "> #{message}"
end

def player_choice
  loop do
    options_list = ''
    KEY.each_value { |val| options_list += val[1] + ' ' }
    prompt("Choose #{options_list}: ")
    choice = gets.chomp.downcase
    break choice unless OPTIONS.include?(choice) == false
    prompt("That wasn't an option!\n")
  end
end

def computer_choice
  OPTIONS.sample
end

def decide_winner(player, comp)
  return 'tie' if player == comp
  if WINNING_PAIRS[player.to_sym].include?(KEY[comp.to_sym][0])
    'player'
  else
    'comp'
  end
end

def display_results(player_choice, computer_choice, winner)
  prompt("#{KEY[player_choice.to_sym][0]} vs. #{KEY[computer_choice.to_sym][0]} ... ")
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

def again?
  do_again = ' '
  loop do
    prompt("Again? (y/n) ")
    do_again = gets.chomp.downcase
    next if do_again.length.zero?
    break if do_again == 'y' || do_again == 'n'
    prompt("That wasn't an option!\n")
  end
  do_again
end

system('clear') || system('cls')

prompt("🗿📄✂🦎🖖️ Rock, Paper, Scissors, Lizard, Spock Game 🗿📄✂🦎🖖️\n")
prompt("First to #{to_win} wins!\n")
prompt("\n")

loop do
  player = player_choice
  comp = computer_choice
  winner = decide_winner(player, comp)
  display_results(player, comp, winner)
  increment_score(winner, wins)
  play_again = again?
  break if wins[:player] == to_win || wins[:comp] == to_win || play_again == 'n'
end

prompt("Final score ... YOU: #{wins[:player]} COMPUTER: #{wins[:comp]}\n")
