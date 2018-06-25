class Board
  
  attr_reader :grid
  
  def initialize
    @grid = Array.new(8) {Array.new(8) {NullPiece.new}}
    populate
  end
  
  def [](pos)
    x, y = pos 
    grid[x][y]
  end 
  
  def []=(pos, value)
    x, y = pos 
    grid[x][y] = value
  end 
  
  def populate 
    [-2, -1, 0, 1].each do |row|
      self[row].map! do |col|
        col = Piece.new
      end 
    end 
    @grid
  end 
  
  def move_piece(start_pos, end_pos)
    piece = @grid[start_pos]
    raise ArgumentError if grid[start_pos] == NullPiece
    raise ArgumentError unless piece.valid_pos?(end_pos)
    
    @grid[end_pos] = piece
    @grid[start_pos] = NullPiece
  end
  
  def valid_pos?(pos)
    pos.each {|el| return false if el < 0 || el > 7}
    true
  end
    
end