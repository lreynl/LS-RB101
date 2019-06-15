DEALER_STOP = 17
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
  if hand[:ace_eleven] && hand[:score] > 21
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
  hand[:score] > 21
end

def results(dealer, player)
  if player[:score] > 21
    :p_bust
  elsif dealer[:score] > 21
    :d_bust
  elsif dealer[:score] > player[:score]
    :dealer
  elsif dealer[:score] < player[:score]
    :player
  else
    :tie
  end
end

def end_game(comp_hand, player_hand)
  who_won = results(comp_hand, player_hand)
  case who_won
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
  display_score(player_hand, comp_hand)
end

def display_score(player_hand, comp_hand)
  prompt("Your score was #{player_hand[:score]}. " \
         "Dealer score was #{comp_hand[:score]}.\n\n")
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
        end_game(comp_hand, player_hand)
        return 'bust'
      end
    else
      prompt("Not a valid choice!\n")
    end
  end
end

def computer_turn(deck, comp_hand, player_hand)
  while comp_hand[:score] <= DEALER_STOP
    hit!(deck, comp_hand)
  end
  display_cards(comp_hand, player_hand)
  end_game(comp_hand, player_hand)
end

def play_again?
  loop do
    prompt('Play again? (y/n) ')
    choice = gets.chomp
    next if choice.empty?
    return choice.downcase == 'y' || choice.downcase == 'yes' ? true : false
  end
end

loop do
  comp_hand = { score: 0, cards: [], ace_eleven: false }
  player_hand = { score: 0, cards: [], ace_eleven: false }
  deck = init_deck
  initial_deal(deck, comp_hand, player_hand)
  display_cards(comp_hand, player_hand)
  result = player_turn(deck, comp_hand, player_hand)
  computer_turn(deck, comp_hand, player_hand) unless result == 'bust'
  break unless play_again?
end
