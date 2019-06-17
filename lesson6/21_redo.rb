require 'io/console'
DEALER_STAY = 17
MAX_SCORE = 21
WINS_FOR_MATCH = 5
VALID_YES_NO = ['y', 'yes', 'n', 'no']
VALID_HIT_STAY = ['h', 'hit', 's', 'stay']
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

def init_match
  { player: 0, dealer: 0 }
end

def initial_deal(deck, dealer_hand, player_hand)
  2.times do
    card = draw!(deck)
    dealer_hand[:cards] << card
    update_score!(dealer_hand, card)
  end
  2.times do
    card = draw!(deck)
    player_hand[:cards] << card
    update_score!(player_hand, card)
  end
end

def prompt(text)
  print "> #{text}"
end

def clear
  system 'clear' || 'cls'
end

def title
  clear
  prompt("♤ ♡ ♧ ♢  21 Game ♤ ♡ ♧ ♢ \n\n")
  prompt("First to #{WINS_FOR_MATCH} wins\n\n")
  prompt('Press any key to start')
  STDIN.getch
  clear
end

def score(hand)
  hand[:score]
end

def round_over?(hand)
  score(hand) >= MAX_SCORE
end

def check_perfect_score(dealer, player)
  if score(player) == MAX_SCORE ||
     score(dealer) == MAX_SCORE
    prompt("Perfect score!\n")
  end
end

def round_score(dealer_hand, player_hand)
  if score(player_hand) > MAX_SCORE
    :p_bust
  elsif score(dealer_hand) > MAX_SCORE
    :d_bust
  elsif score(dealer_hand) > score(player_hand)
    :dealer
  elsif score(dealer_hand) < score(player_hand)
    :player
  elsif score(player_hand) == score(dealer_hand)
    :tie
  end
  nil
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

def score_ace!(hand)
  if hand[:score] <= 10
    hand[:score] += 11
    hand[:ace_eleven] = true
  else
    hand[:score] += 1
  end
end

def rescore_ace!(hand)
  if hand[:ace_eleven] && hand[:score] > MAX_SCORE
    hand[:score] -= 10
    hand[:ace_eleven] = false
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

def inc_match_points(winner, match_points)
  return nil if winner == :tie
  match_points[:player] += 1 if winner == :player || winner == :d_bust
  match_points[:dealer] += 1 if winner == :dealer || winner == :p_bust
end

def draw!(deck)
  card = deck.sample
  deck.delete(card)
  card
end

def hit_me!(deck, hand)
  card = draw!(deck)
  hand[:cards] << card
  update_score!(hand, card)
end

def user_hit_stay
  hit_stay = ''
  loop do
    prompt("Hit or stay (h/s)? ")
    hit_stay = gets.chomp
    if VALID_HIT_STAY.include?(hit_stay)
      break
    else
      prompt("Not a valid choice!\n")
      next
    end
  end
  hit_stay
end

def hit?
  response = user_hit_stay
  response.downcase == 'hit' || response.downcase == 'h'
end

def display_score(dealer, player, match_points)
  prompt("Your score was #{player[:score]}. " \
         "Dealer score was #{dealer[:score]}.\n\n")
  prompt("Match total: Player #{match_points[:player]}, " \
         "Dealer #{match_points[:dealer]}\n\n")
end

def display_cards(dealer_hand, player_hand)
  clear
  dealer_hand[:cards].each_with_index do |card, index|
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

def match_winner?(player, dealer)
  return false if player.nil? || dealer.nil?
  score(player) == MAX_SCORE || score(dealer) == MAX_SCORE
end

def display_match_score(match_points)
  prompt("Final match score: Player, #{match_points[:player]}, " \
         "Dealer #{match_points[:dealer]}\n\n")
end

def user_yes_no(option)
  choice = ''
  loop do
    prompt('Keep playing? (y/n) ') if option == :round
    prompt('Rematch? (y/n) ') if option == :match
    choice = gets.chomp
    choice.downcase!
    if choice.empty? || !VALID_YES_NO.include?(choice)
      prompt('Enter (y/n): ')
      next
    else
      break
    end
  end
  choice
end

def continue?(option = :round)
  response = user_yes_no(option)
  response == 'y' || response == 'yes'
end

title
loop do
  match_points = init_match
  match_winner = false
  player = nil
  dealer = nil
  until match_winner?(player, dealer)
    deck = init_deck
    player = init_hand
    dealer = init_hand
    initial_deal(deck, dealer, player)
    display_cards(dealer, player)
    until round_over?(player)
    #loop do
    #  break if round_over?(player)
      hit? ? hit_me!(deck, player) : break
      display_cards(dealer, player)
    end
    while !round_over?(dealer) && !round_over?(player) &&
          score(dealer) <= DEALER_STAY
      hit_me!(deck, dealer)
    end
    display_cards(dealer, player)
    result = round_score(dealer, player)
    check_perfect_score(dealer, player)
    results_message(result)
    inc_match_points(result, match_points)
    display_score(dealer, player, match_points)
    break unless continue?(:round)
  end
  if match_winner
    display_match_score(match_points)
    break unless continue?(:match)
  else
    break
  end
end
