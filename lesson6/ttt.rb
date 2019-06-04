#board = { 1 => ' ', 2 => ' ', 3 => ' ',
#          4 => ' ', 5 => ' ', 6 => ' ',
#          7 => ' ', 8 => ' ', 9 => ' ' }

def prompt(text)
  print "> #{text}"
end

def init_board
  board = {}
  (1..9).each { |num| board[num] = ' ' }
  board
end

def update_board!(board, space, piece)
  board[space] = piece if board[space] == ' '
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
  board.keys.select { |key| board[key] == ' ' }
end

def player_move!(board)
  square = ''
  loop do
    prompt("Choose square #{empty_squares(board)}:" )
    square = gets.chomp.to_i
    break if square >= 1 && square <= 9 && empty_squares(board).include?(square)
  end
  update_board!(board, square, 'X')
end

def computer_move!(board)
  square = empty_squares(board).sample
  #board[square] = 'O'
  update_board!(board, square, 'O')
end

def game_over?(board)
  empty_squares(board).empty?
end

def end_game(board)
  display_board(board)
end

def game_loop(board)
  loop do
    display_board(board)
    player_move!(board)
    computer_move!(board)
    if game_over?(board)
      end_game(board)
      break
    end
  end
end

board = init_board
game_loop(board)
#update_board(board, 5, 'X')
#update_board(board, 1, 'O')
#update_board(board, 9, 'X')
#display_board(board)
  