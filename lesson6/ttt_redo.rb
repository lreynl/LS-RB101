PLAYER_PIECE = 'X'
COMPUTER_PIECE = 'O'
BLANK_SQUARE = ' '
MIN_SQUARE = 1
MAX_SQUARE = 9

def prompt(text)
  print "> #{text}"
end

def init_board
  board = {}
  (1..9).each { |num| board[num] = BLANK_SQUARE }
  board[0] = { PLAYER_PIECE => 0, COMPUTER_PIECE => 0 }
  board
end

def clear_board(board)
  (1..9).each { |num| board[num] = BLANK_SQUARE }
end

def display_board(board)
  system 'clear' || 'cls'
  puts 'Player is X - Computer is O'
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
  joined = ''
  empty.each_with_index do |square, index|
    square = square.to_s
    case
    when index < empty.length - 2
      joined += (square + separator + ' ')
    when index == empty.length - 2
      joined += (square + separator + ' ' + andor + ' ')
    when index == empty.length - 1
      joined += square
    end
  end
  joined
end

def empty_squares(board)
  board.keys.select { |key| board[key] == BLANK_SQUARE }
end

def valid_square?(num)
  num >= MIN_SQUARE || num <= MAX_SQUARE
end

def available_square?(board, square)
  empty_squares(board).include?(square)
end

def player_move!(board)
  square = ''
  loop do
    prompt("Choose square from #{joinor(empty_squares(board))}: ")
    square = gets.chomp.to_i
    unless valid_square?(square)
      prompt("Not a valid square!\n")
      next
    end
    prompt("That space is full!\n") unless available_square?(board, square)
    break if valid_square?(square) && available_square?(board, square)
  end
  update_board!(board, square, PLAYER_PIECE)
end

def inc_score(board, player)
  board[0][player] += 1
end

def identify_winner(board, winning_piece)
  case winning_piece
  #when empty_squares(board).empty?
  #  return 'TIE'
  when BLANK_SQUARE
    return nil
  when PLAYER_PIECE
    inc_score(board, PLAYER_PIECE)
    return 'You win!'
  when COMPUTER_PIECE
    inc_score(board, COMPUTER_PIECE)
    return 'Computer wins!'
  end
end

def detect_winner(board)
  winner = nil
  wins = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
         [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + [[1, 5, 9], [3, 4, 7]]
  wins.each do |line|
    if board[line[0]] == board[line[1]] &&
       board[line[0]] == board[line[2]]
      winner = identify_winner(board, board[line[0]]) 
      return winner unless winner.nil?
    end
  end
  return 'TIE' if empty_squares(board).empty?
  winner
end 

def computer_move!(board)
  square = empty_squares(board).sample
  update_board!(board, square, COMPUTER_PIECE)
end

def show_score(board)
  prompt("Current score: Player, #{board[0][PLAYER_PIECE]}. " +
         "Computer, #{board[0][COMPUTER_PIECE]}.\n")
end

def end_game(board, result)
  display_board(board)
  prompt("#{result}\n")
  show_score(board)
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
    #display_board(board)
    winner = detect_winner(board)
    if winner then break end_game(board, winner) end
    computer_move!(board)
    display_board(board)
    winner = detect_winner(board)
    if winner then break end_game(board, winner) end
  end
end

board ||= init_board
loop do
  game_loop(board)
  break unless play_again?
  clear_board(board)
end