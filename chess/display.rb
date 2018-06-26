require_relative 'board'
require_relative 'cursor'
require 'colorize'

class Display
  
  def initialize
  end

  def render(board)
    board.grid.each_with_index do |row, i|
      puts 
      
      row.each_with_index do |col, idx|
        if col.is_a?(NullPiece) && idx.odd? && i.even?
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
    end 
    true
  end
   
end