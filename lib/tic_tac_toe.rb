# Helper Methods
class TicTacToe
  WIN_COMBINATIONS  = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def initialize(board = nil)
  @board = board || Array.new(9, " ")

end

# Helper Methods
def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end
########################################################
def move(indx,usr_)
  index = indx -1
  @board[index] = usr_
#  return @board
end
########################################################

########################################################
def valid_move?(position)
  position=position.to_i-1
  if position >= 0 && position <= 8 #position.to_i.between?(0,8)
    if !position_taken?( position)
      return true
    else return false
    end
  else return false
  end
end
#def valid_move?(board, input)
#  input.to_i.between?(1,9) && !position_taken?(board, input.to_i-1)
#end
########################################################
def turn()
  puts "Please enter 1-9:"
  input = gets.strip
  intger=input.to_i
  #position = intger.to_i -1
  if valid_move?(input)
    move( intger,current_player())
    display_board()
  else
    turn()
  end
end
########################################################
# Define your play method below
def play()
 c=1
 p="X"
  while !over?()
    turn()
  end
  if won?()
    puts "Congratulations #{winner()}!"
  elsif draw?()
    puts "Cats Game!"
  else
  end
end


##################################

########################################################


# Helper Method
def current_player()
  counter =turn_count()
  if counter % 2 ==0
    return "X"
  else return "O"
  end
end
########################################################

def turn_count()
  counter=0
  @board.each do |player|
    if player=="X" || player=="O"
      counter+=1
    end
  end
return counter
end
###########################################################

#current_player(Array.new(9," "))

def position_taken?(position)
 if @board[position]== "" || @board[position]== " "
  return false
 elsif @board[position]== nil
  return false
 elsif @board[position]=="X" || @board[position]=="O"
   return true
 end
end###################################################

# Define your WIN_COMBINATIONS constant

def won?()
  WIN_COMBINATIONS.detect do |e|
    @board[e[0]] == @board[e[1]] &&  @board[e[1]] == @board[e[2]] &&  position_taken?( e[0])
  end
end

########################################################

def full?()
 if @board.none?{|e| e==" "} #draw
  return true
 else return false
 end
end
########################################################

###############################333333
def draw?()
  !won?() && full?()
end

def over?()
  if draw?()
    return true
  elsif won?()
    return true
  else
    return false
  end
end
############################
def winner()
  if won?()
    #return current_player(board)
      WIN_COMBINATIONS.each  do |a|
    if @board[a[0]] =="O" &&  @board[a[1]] =="O" && @board[a[2]] =="O"
      return "O"
    elsif @board[a[0]] =="X" &&  @board[a[1]] =="X" && @board[a[2]] =="X"
      return "X"
     end
                             end
  else
    return nil
  end
end


end
