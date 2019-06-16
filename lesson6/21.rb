require 'io/console'
DEALER_STAY = 17
MAX_SCORE = 21
WINS_FOR_MATCH = 5
VALID_RESPONSE = ['y', 'yes', 'n', 'no']
VALUES = { '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8,
           '9' => 9, '10' => 10, 'J' => 10, 'Q' => 10, 'K' => 10 }.freeze

def init_deck
  deck = []
  suits = ['♤', '♡', '♧', '♢']
  val = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']
  suits.each do |suit|
    val.each do |value|
      deck.push(value + suit)
    end
  end
  deck
end

def init_hand
  { score: 0, cards: [], ace_eleven: false }
end

def prompt(text)
  print "> #{text}"
end

def clear
  system 'clear' || 'cls'
end

def draw!(deck)
  card = deck.sample
  deck.delete(card)
  card
end

def initial_deal(deck, comp_hand, player_hand)
  2.times do
    card = draw!(deck)
    comp_hand[:cards] << card
    update_score!(comp_hand, card)
  end
  2.times do
    card = draw!(deck)
    player_hand[:cards] << card
    update_score!(player_hand, card)
  end
end

def display_cards(comp_hand, player_hand)
  clear
  comp_hand[:cards].each_with_index do |card, index|
    prompt('Dealer: Face-down card, ') if index == 0
    print card + ' ' unless index == 0
  end
  puts "\n\n"
  player_hand[:cards].each_with_index do |card, index|
    prompt("Player: #{card} ") if index == 0
    print card + ' ' unless index == 0
  end
  puts "\n\n"
end

def rescore_ace!(hand)
  if hand[:ace_eleven] && hand[:score] > MAX_SCORE
    hand[:score] -= 10
    hand[:ace_eleven] = false
  end
end

def score_ace!(hand)
  if hand[:score] <= 10
    hand[:score] += 11
    hand[:ace_eleven] = true
  else
    hand[:score] += 1
  end
end

def update_score!(player, card)
  if card.chop == 'A'
    score_ace!(player)
  else
    player[:score] += VALUES[card.chop]
  end
  rescore_ace!(player)
end

def hit!(deck, hand)
  card = draw!(deck)
  hand[:cards] << card
  update_score!(hand, card)
end

def bust?(hand)
  hand[:score] > MAX_SCORE
end

def results(dealer, player)
  if player[:score] > MAX_SCORE
    :p_bust
  elsif dealer[:score] > MAX_SCORE
    :d_bust
  elsif dealer[:score] > player[:score]
    :dealer
  elsif dealer[:score] < player[:score]
    :player
  else
    :tie
  end
end

def results_message(winner)
  case winner
  when :p_bust
    prompt("You went bust! Dealer wins!\n")
  when :d_bust
    prompt("Dealer went bust! You win!\n")
  when :dealer
    prompt("Dealer wins!\n")
  when :player
    prompt("You win!\n")
  when :tie
    prompt("It was a tie!\n")
  end
end

def inc_match_points(winner, match_score)
  return nil if winner == :tie
  match_score[:player] += 1 if winner == :player || winner == :d_bust
  match_score[:dealer] += 1 if winner == :dealer || winner == :p_bust
end

def end_game(comp_hand, player_hand, match_points)
  who_won = results(comp_hand, player_hand)
  results_message(who_won)
  inc_match_points(who_won, match_points)
  display_score(player_hand, comp_hand, match_points)
  return :match if match_points[:player] == WINS_FOR_MATCH ||
                   match_points[:dealer] == WINS_FOR_MATCH
end

def display_score(player_hand, comp_hand, match_score)
  prompt("Your score was #{player_hand[:score]}. " \
         "Dealer score was #{comp_hand[:score]}.\n\n")
  prompt("Match total: Player #{match_score[:player]}, " \
         "Dealer #{match_score[:dealer]}\n\n")
end

def display_match_score(match_score)
  prompt("Final match score: Player, #{match_score[:player]}, " \
         "Dealer #{match_score[:dealer]}\n\n")
end

def player_turn(deck, comp_hand, player_hand)
  loop do
    prompt("Hit or stay (h/s)? ")
    hit_stay = gets.chomp
    break if hit_stay.downcase == 'stay' || hit_stay.downcase == 's'
    if hit_stay.downcase == 'hit' || hit_stay.downcase == 'h'
      hit!(deck, player_hand)
      display_cards(comp_hand, player_hand)
      if bust?(player_hand)
        return :bust
      end
    else
      prompt("Not a valid choice!\n")
    end
  end
end

def computer_turn(deck, comp_hand, player_hand)
  while comp_hand[:score] <= DEALER_STAY
    hit!(deck, comp_hand)
  end
  display_cards(comp_hand, player_hand)
end

def keep_playing?
  loop do
    prompt('Keep playing? (y/n) ')
    choice = gets.chomp
    choice.downcase!
    next if choice.empty? || VALID_RESPONSE.include?(choice) == false
    return choice == 'y' || choice == 'yes' ? true : false
  end
end

def rematch?
  loop do
    prompt('Rematch? (y/n) ')
    choice = gets.chomp
    next if choice.empty? || VALID_RESPONSE.include?(choice) == false
    return choice.downcase == 'y' || choice.downcase == 'yes' ? true : false
  end
end

def title
  clear
  prompt("♤ ♡ ♧ ♢  21 Game ♤ ♡ ♧ ♢ \n\n")
  prompt("First to #{WINS_FOR_MATCH} wins\n\n")
  prompt('Press any key to start')
  STDIN.getch
  clear
end

title
loop do
  match_points = { player: 0, dealer: 0 }
  match = nil
  stop = false
  loop do
    comp_hand = init_hand
    player_hand = init_hand
    deck = init_deck
    initial_deal(deck, comp_hand, player_hand)
    display_cards(comp_hand, player_hand)
    result = player_turn(deck, comp_hand, player_hand)
    if result == :bust
      match = end_game(comp_hand, player_hand, match_points)
      break if match
      if keep_playing?
        next
      else
        stop = true
        break
      end
    end
    computer_turn(deck, comp_hand, player_hand)
    match = end_game(comp_hand, player_hand, match_points)
    break if match
    if keep_playing?
      next
    else
      stop = true
      break
    end
  end
  break if stop
  display_match_score(match_points)
  break unless rematch?
end
