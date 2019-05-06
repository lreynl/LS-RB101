# rock paper scissors lizard spock

require 'io/console' # need for 'press any key'

OPTIONS = %w(r p s l sp)
WINNING_PAIRS = { r:  ['scissors', 'lizard'],
                  p:  ['rock', 'spock'],
                  s:  ['paper', 'lizard'],
                  l:  ['paper', 'spock'],
                  sp: ['rock', 'scissors'] }

KEY = { r: ['rock', '[r]ock'], p: ['paper', '[p]aper'],
        s: ['scissors', '[s]cissors'], l: ['lizard', '[l]izard'],
        sp: ['spock', '[sp]ock'] }

TO_WIN = 5
wins = { player: 0, comp: 0 }

def prompt(message)
  print "> #{message}"
end

def valid_move_choice?(choice)
  OPTIONS.include?(choice)
end

def player_choice
  loop do
    options_list = ''
    KEY.each_value { |val| options_list += val[1] + ' ' }
    prompt("Choose #{options_list}: ")
    choice = gets.chomp.downcase
    break choice if valid_move_choice?(choice)
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
  prompt("#{KEY[player_choice.to_sym][0]} vs. " \
         "#{KEY[computer_choice.to_sym][0]} ... ")
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
    prompt("REMATCH? (y/n) ")
    do_again = gets.chomp.downcase
    next if do_again.length.zero?
    break true if do_again == 'y'
    break false if do_again == 'n'
    prompt("That wasn't an option!\n")
  end
end

def match_ended?(current_score)
  current_score[:player] == TO_WIN || current_score[:comp] == TO_WIN
end

def show_score(score)
  prompt("YOU: #{score[:player]} " \
         "COMPUTER: #{score[:comp]}\n")
end

def show_final_score(score)
  prompt("Final score ... \n")
  show_score(score)
end

def reset_score(wins)
  wins[:player] = 0
  wins[:comp] = 0
end

def press_any_key
  prompt('press any key...')
  STDIN.getch
end

def clear_screen
  system('clear') || system('cls')
end

def game_loop
  loop do
    player = player_choice
    comp = computer_choice
    winner = decide_winner(player, comp)
    display_results(player, comp, winner)
    increment_score(winner, wins)
    break if match_ended?(wins)
    show_score(wins)
    press_any_key
    clear_screen
  end
end

clear_screen
prompt("🗿📄✂🦎🖖️ Rock, Paper, Scissors, Lizard, Spock Game 🗿📄✂🦎🖖️\n")
prompt("First to #{TO_WIN} wins!\n")
prompt("\n")

loop do
  game_loop
  show_final_score(wins)
  break unless again?
  clear_screen
  reset_score(wins)
end
