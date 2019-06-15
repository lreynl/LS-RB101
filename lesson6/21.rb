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
    if index == 0
      prompt('Face-down card, ')
    else
      print card + ' '
    end
  end
  puts ''
  player_hand[:cards].each { |card| print card + ' ' }
  puts ''
end

def update_score!(player, card)
  if card.chop != 'A'
    player[:score] += VALUES[card.chop]
  elsif card.chop == 'A'
    player[:score] <= 10 ? player[:score] += 11 : player[:score] += 1
  end
end

def hit!(deck, hand)
  card = draw!(deck)
  hand[:cards] << card
  update_score!(hand, card)
end

def bust?(hand)
  hand[:score] > 21
end

def end_game(comp_hand, player_hand)
  if player_hand[:score] > 21
    prompt("You went bust! Dealer wins!\n")
  elsif comp_hand[:score] > 21
    prompt("Dealer went bust! You win!\n")
  elsif comp_hand[:score] > player_hand[:score]
    prompt("Dealer wins!\n")
  elsif comp_hand[:score] < player_hand[:score]
    prompt("You win!\n")
  else
    prompt("It was a tie!\n")
  end
  your_score(player_hand)
end

def your_score(hand)
  prompt("Your score was #{hand[:score]}.\n")
end

def player_turn(deck, comp_hand, player_hand)
  loop do
    prompt("Hit or stay? ")
    hit_stay = gets.chomp
    break if hit_stay.downcase == 'stay'
    if hit_stay == 'hit'
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

comp_hand = { score: 0, cards: [] }
player_hand = { score: 0, cards: [] }
deck = init_deck
initial_deal(deck, comp_hand, player_hand)
display_cards(comp_hand, player_hand)
result = player_turn(deck, comp_hand, player_hand)
computer_turn(deck, comp_hand, player_hand) unless result == 'bust'
