def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def play(board)
  count = 0
  while count<9
    turn(board)
    count+=1
  end
end

def move(board, index, current_player = "X")
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board1)
  counter = 0
board1.each do |space|
if space == "O" || space == "X"
  counter += 1

end
end
return counter
end

def current_player(board)
  if turn_count(board).even? == true
    return "X"
  else
    return "O"
  end

end


# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2],

]

$xwon = nil
def won?(board)
  #WIN_COMBINATIONS.each do |win_combination|

#end
  #for each win_combination in WIN_COMBINATIONS
  # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
  # grab each index from the win_combination that composes a win.
  i=-1;
  while i<7
    i+=1
  win_index_1 = WIN_COMBINATIONS[i][0]
  win_index_2 = WIN_COMBINATIONS[i][1]
  win_index_3 = WIN_COMBINATIONS[i][2]



  position_1 = board[win_index_1] # load the value of the board at win_index_1
  position_2 = board[win_index_2] # load the value of the board at win_index_2
  position_3 = board[win_index_3] # load the value of the board at win_index_3

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    $xwon = true
    return WIN_COMBINATIONS[i] # return the win_combination indexes that won.
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    $xwon = false
    return WIN_COMBINATIONS[i]
  else
    false
  end
end

end

def full?(board)
  if board.detect{|i| i == " "} == " "
    return false
  else
    return true
end

end

def draw?(board)
  if won?(board) == nil
    return true
  else
    return false
  end

end

def over?(board)
  if full?(board) == false && won?(board) == nil
     return false
  else
    return true
  end

end

def winner(board)
  won?(board)
  if $xwon == true
    return "X"
  elsif $xwon == false && won?(board) != nil
    return "O"
  else
    return nil
  end

end
