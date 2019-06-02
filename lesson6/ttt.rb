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

def update_board(board, space, piece)
  board[space] = piece if board[space] == ' '
end

def display_board(board)
  puts "#{board[1]}|#{board[2]}|#{board[3]}"
  puts "-+-+-"
  puts "#{board[4]}|#{board[5]}|#{board[6]}"
  puts "-+-+-"
  puts "#{board[7]}|#{board[8]}|#{board[9]}"
end

def player_move(board)
  square = ''
  loop do
    prompt('Choose square 1 - 9: ')
    square = gets.chomp.to_i
    break if square >= 1 && square <= 9
  end
  update_board(board, square, 'X')
end

board = init_board
player_move(board)
#update_board(board, 5, 'X')
#update_board(board, 1, 'O')
#update_board(board, 9, 'X')
display_board(board)
  