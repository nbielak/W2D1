require_relative 'board'
require_relative 'stepping_piece'
require_relative 'sliding_piece'
require 'singleton'

class Piece
  
  attr_reader :color, :pos
  
  def initialize(color, board, pos)
    @color = color
    @board = board 
    @pos = pos 
  end
  
  def pos=(val)
    @pos = val 
  end
  
  def to_s
    self.color
  end
  
  def empty?
    return true if self.is_a?(NullPiece)
    false
  end
  
  def valid_moves
    valid_moves = []
    return false if self.color == board[pos].color
    true
  end
  
  def moves(start_pos)
    moves = []
  end
end



class NullPiece
  include Singleton
  
end

# 
# class King 
# 
# 
#   ♔♚
# end 
# 
# 
# class Queen 
#   ♕♛
# end 
# 
# 
# class Rook 
# 
#   ♖♜
# end 
# 
# 
# class Bishop 
# 
#   ♗♝
# end 
# 
# 
# class Knight
#   ♘♞
# end 
# 
# class Pawn
#   ♙♟
# end 
# 
# 
# 
# 
# 
