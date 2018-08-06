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
  input = gets.strip
  @index = input.to_i - 1
end

def move
  @board[@index] = @current_player
end

def valid_move?
  @index.between?(0,8) && !position_taken?
end

def turn
  puts "Please enter 1-9:"
  input_to_index
  if valid_move?
    move
    display_board
  else
    turn
  end
end

def play

  until over?
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  else
    puts "Cat's Game!"
  end
end

#..............#
#Helper Methods#
#..............#


def won?

  WIN_COMBINATIONS.detect do |win|
    (@board[win[0]] == "X" || @board[win[0]] == "O") && (@board[win[0]] == @board[win[1]] && @board[win[1]] == @board[win[2]])
  end
end

def full?
  @board.all?{|index| index == "X" || index == "O"}
end

def draw?
  !won?(@board) && full?(@board)
end

def over?
  won?(@board) || draw?(@board) ||  full?(@board)
end

def winner
  if over?(@board)
    @board[won?(@board)[0]]
  end
end


def turn_count
  counter = 0
  @board.each do |position|
    if (position == "X" || position == "O")
      counter += 1
    end
  end
  counter
end

def current_player
  (turn_count(@board)).even? ? "X" : "O"
end

end

def position_taken?
  !(@board[@index].nil? || @board[@index] == " " || @board[@index] == "")
end