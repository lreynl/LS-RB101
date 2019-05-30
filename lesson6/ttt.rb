board = { 1 => ' ', 2 => ' ', 3 => ' ',
          4 => ' ', 5 => ' ', 6 => ' ',
          7 => ' ', 8 => ' ', 9 => ' ' }

def update_board(board, space, piece)
  board[space] = piece if board[space] == ' '
end

def display_board(board)
  puts "#{board[1]}|#{board[2]}|#{board[3]}"
  puts "------"
  puts "#{board[4]}|#{board[5]}|#{board[6]}"
  puts "------"
  puts "#{board[7]}|#{board[8]}|#{board[9]}"
end
  
update_board(board, 5, 'X')
display_board(board)
  