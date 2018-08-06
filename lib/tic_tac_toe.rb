class TicTacToe

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # left-right diagonal
  [6,4,2]  # right-left diagonal
]


def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index
  @user_input.to_i - 1
end

def move
  @board[@index] = @current_player
end

def valid_move?
  @index.between?(0,8) && !position_taken?(@board, @index)
end

def turn
  puts "Please enter 1-9:"
  @input = gets.strip
  @index = input_to_index(input)
  if valid_move?(@board, @index)
    move(@board, @index, current_player(@board))
    display_board(@board)
  else
    turn(@board)
  end
end

def play

  until over?(@board)
    turn(@board)
  end

  if won?(@board)
    puts "Congratulations #{winner(@board)}!"
  else
    puts "Cat's Game!"
  end
end










end
