require_relative 'piece'

class Board
  
  attr_reader :grid
  
  def initialize(grid = Board.default_grid)
    @grid = grid
    populate
  end
  
  def self.default_grid
    Array.new(8) {Array.new(8) {NullPiece.new}}
  end 
  
  def [](pos)
    #equire 'byebug' ; byebug
    x, y = pos 
    @grid[x][y]
  end 
  
  def []=(pos, value)
    x, y = pos 
    @grid[x][y] = value
  end 
  
  def populate 
    [-2, -1, 0, 1].each do |row|
      grid[row].map! do |col|
        col = Piece.new
      end 
    end 
    @grid
  end 
  
  def move_piece(start_pos, end_pos)
    #require 'byebug' ; byebug
    piece = self[start_pos]
    raise ArgumentError if piece.is_a?(NullPiece)
    raise ArgumentError unless valid_pos?(end_pos)
    
    self[end_pos] = piece
    self[start_pos] = NullPiece
  end
  
  def valid_pos?(pos)
    pos.each {|el| return false if el < 0 || el > 7}
    true
  end
    
end

# board = Board.new
# p board.grid
# p board.grid.length
# board.move_piece([0, 0], [3, 3])
# p board.grid
# board.move_piece([0, 1], [0, 9])

