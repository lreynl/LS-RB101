PLAYER_PIECE = 'X'
COMPUTER_PIECE = 'O'
BLANK_SQUARE = ' '

def prompt(text)
  print "> #{text}"
end

def init_board
  board = {}
  (1..9).each { |num| board[num] = BLANK_SQUARE }
  board
end

def update_board!(board, space, piece)
  board[space] = piece if board[space] == BLANK_SQUARE
end

def display_board(board)
  system 'clear' || 'cls'
  puts "#{board[1]}|#{board[2]}|#{board[3]}"
  puts "-+-+-"
  puts "#{board[4]}|#{board[5]}|#{board[6]}"
  puts "-+-+-"
  puts "#{board[7]}|#{board[8]}|#{board[9]}"
end

def empty_squares(board)
  board.keys.select { |key| board[key] == BLANK_SQUARE }
end

def player_move!(board)
  square = ''
  loop do
    prompt("Choose square from #{empty_squares(board).join(', ')}: ")
    square = gets.chomp.to_i
    prompt("That space is full\n") unless empty_squares(board).include?(square)
    break if square >= 1 && square <= 9 &&
             empty_squares(board).include?(square)
  end
  update_board!(board, square, PLAYER_PIECE)
end

def computer_move!(board)
  square = empty_squares(board).sample
  update_board!(board, square, COMPUTER_PIECE)
end

# need this otherwise linter says det_winner too complex
def player_or_computer(board, winner)
  return nil if board[winner] == BLANK_SQUARE
  if board[winner] == PLAYER_PIECE
    return 'You win!'
  else
    return 'Computer wins!'
  end
end

def det_winner(board)
  wins = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
         [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + [[1, 5, 9], [3, 4, 7]]
  winner = nil
  wins.each do |line|
    if board[line[0]] == board[line[1]] &&
       board[line[0]] == board[line[2]]
      winner = player_or_computer(board, line[0])
      return winner unless winner.nil?
    end
  end
  winner
end

def winner_yet(board)
  winner = det_winner(board)
  return winner unless winner.nil?
  return 'TIE' if empty_squares(board).empty?
  nil
end

def end_game(board, result)
  display_board(board)
  prompt("#{result}\n")
end

def play_again?
  prompt("Play again? (y/n) ")
  choice = gets.chomp
  choice.downcase.start_with?('y') ? true : false
end

def game_loop(board)
  loop do
    display_board(board)
    player_move!(board)
    computer_move!(board)
    result = winner_yet(board)
    if !!result
      break end_game(board, result)
    end
  end
end

loop do
  board = init_board
  game_loop(board)
  break unless play_again?
end
