require_relative 'board'
require_relative 'cursor'
require 'colorize'

class Display
   attr_reader :render, :board, :cursor 
   
  def initialize(board=Board.new)
    @board = board 
    @cursor = Cursor.new([0,0], board) 
  end
  
  def test
    loop do
      render
      cursor.get_input
    end
  end

  def render
    system("clear")
    board.grid.each_with_index do |row, i| 
      row.each_with_index do |col, idx|
        
        if [i,idx] == cursor.cursor_pos
          print "   ".colorize(:background => :yellow)
          
        elsif col.is_a?(NullPiece) && idx.odd? && i.even?
          print "   ".colorize(:background => :white)
        
        elsif col.is_a?(NullPiece) && idx.odd? && i.odd?
          print "   ".colorize(:background => :black)
          
        elsif col.is_a?(NullPiece) && idx.even? && i.even?
          print "   ".colorize(:background => :black)
          
        elsif col.is_a?(NullPiece) && idx.even? && i.odd?
          print "   ".colorize(:background => :white)
          
        elsif col.is_a?(Piece) && idx.even? && i.even?
          print " P ".colorize(:background => :black)
          
        elsif col.is_a?(Piece) && idx.even? && i.odd?
          print " P ".colorize(:background => :white)
          
        elsif col.is_a?(Piece) && idx.odd? && i.even?
          print " P ".colorize(:background => :white)
          
        elsif col.is_a?(Piece) && idx.odd? && i.odd?
          print " P ".colorize(:background => :black)
        end
      end 
      puts ""
    end
    
    
  end
   
end


