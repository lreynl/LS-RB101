PLAYER_PIECE = 'X'
COMPUTER_PIECE = 'O'
BLANK_SQUARE = ' '
MIN_SQUARE = 1
MAX_SQUARE = 9
MATCH = 5
GOES_FIRST = 'player'
TIE = 'tie'
WINS = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
       [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
       [[1, 5, 9], [3, 5, 7]].freeze

def prompt(text)
  print "> #{text}"
end

def init_board
  board = {}
  (1..9).each { |num| board[num] = BLANK_SQUARE }
  board[0] = { PLAYER_PIECE => 0, COMPUTER_PIECE => 0 }
  board
end

def clear_board!(board)
  (1..9).each { |num| board[num] = BLANK_SQUARE }
end

def clear_screen
  system 'clear' || 'cls'
end

def display_board(board)
  clear_screen
  puts "Player is X - Computer is O - First to #{MATCH} wins"
  puts ''
  puts "#{board[1]}|#{board[2]}|#{board[3]}"
  puts "-+-+-"
  puts "#{board[4]}|#{board[5]}|#{board[6]}"
  puts "-+-+-"
  puts "#{board[7]}|#{board[8]}|#{board[9]}"
  puts ''
end

def update_board!(board, space, piece)
  board[space] = piece if board[space] == BLANK_SQUARE
end

def joinor(empty, separator = ',', andor = 'or')
  available = ''
  empty.each_with_index do |square, index|
    square = square.to_s
    available += if index < empty.length - 2
                   square + separator + ' '
                 elsif index == empty.length - 2
                   square + separator + ' ' + andor + ' '
                 else
                   square
                 end
  end
  available
end

def empty_squares(board)
  board.keys.select { |key| board[key] == BLANK_SQUARE }
end

def valid_square?(num)
  num = num.to_f
  num >= MIN_SQUARE && num <= MAX_SQUARE && num == num.to_i
end

def available_square?(board, square)
  empty_squares(board).include?(square)
end

def inc_score(board, winner)
  board[0][winner] += 1
end

def winning_line?(board, line)
  board[line[0]] == board[line[1]] && board[line[0]] == board[line[2]]
end

def detect_winner(board)
  winning_piece = nil
  WINS.each do |line|
    if winning_line?(board, line)
      winning_piece = board[line[0]]
      return winning_piece unless winning_piece == BLANK_SQUARE
    end
  end
  return TIE if empty_squares(board).empty?
  winning_piece
end

def valid_winner?(piece)
  piece && piece != BLANK_SQUARE
end

def complete_line(board, piece)
  WINS.each do |line|
    line_pieces = line.map { |square| board[square] }
    if line_pieces.count(piece) == 2 && line_pieces.include?(BLANK_SQUARE)
      return line[line_pieces.index(BLANK_SQUARE)]
    end
  end
  nil
end

def computer_move!(board)
  square = complete_line(board, COMPUTER_PIECE)
  square = complete_line(board, PLAYER_PIECE) if square.nil?
  square = empty_squares(board).sample if square.nil?
  update_board!(board, square, COMPUTER_PIECE)
end

def player_move!(board)
  square = ''
  loop do
    prompt("Choose square from #{joinor(empty_squares(board))}: ")
    square = gets.chomp
    unless valid_square?(square)
      prompt("Not a valid square!\n")
      next
    end
    square = square.to_i
    prompt("That space is full!\n") unless available_square?(board, square)
    break if valid_square?(square) && available_square?(board, square)
  end
  update_board!(board, square, PLAYER_PIECE)
end

def score(board, player)
  board[0][player]
end

def show_round_winner(result)
  prompt("You win!\n") if result == PLAYER_PIECE
  prompt("Computer wins!\n") if result == COMPUTER_PIECE
  prompt("TIE\n") if result == TIE
end

def show_match_winner(result)
  prompt("You win the match!\n") if result == PLAYER_PIECE
  prompt("Computer wins the match!\n") if result == COMPUTER_PIECE
end

def show_score(board)
  prompt("Current score: Player, #{score(board, PLAYER_PIECE)}. " \
         "Computer, #{score(board, COMPUTER_PIECE)}.\n")
end

def rematch?
  prompt("Rematch? (ENTER for yes, anything alse to quit) ")
  choice = gets.chomp
  choice.empty? ? true : false
end

def keep_playing?
  prompt("Keep playing? (ENTER to continue, anything else to stop) ")
  choice = gets.chomp
  choice.empty? ? true : false
end

def end_game(board, result)
  display_board(board)
  if score(board, PLAYER_PIECE) == MATCH ||
     score(board, COMPUTER_PIECE) == MATCH
    show_match_winner(result)
  else
    show_round_winner(result)
  end
  show_score(board)
end

def switch_player(player)
  case player
  when 'player'
    'computer'
  when 'computer'
    'player'
  else
    'error'
  end
end

def place_piece!(board, player)
  player_move!(board) if player == 'player'
  computer_move!(board) if player == 'computer'
end

board = init_board
loop do
  current_player = GOES_FIRST
  loop do
    display_board(board)
    place_piece!(board, current_player)
    winner = detect_winner(board)
    if valid_winner?(winner)
      inc_score(board, winner) unless winner == TIE
      end_game(board, winner)
      break
    end
    current_player = switch_player(current_player)
  end
  if score(board, PLAYER_PIECE) == MATCH ||
     score(board, COMPUTER_PIECE) == MATCH
    rematch? ? board = init_board : break
  else
    keep_playing? ? clear_board!(board) : break
  end
end
