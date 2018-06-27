
HORIZONTAL_DIRS = [[0, 1], [1, 0], [0, -1], [-1, 0]]
DIAGONAL_DIRS = [[1,1], [1, -1], [-1, 1], [-1, -1]]

module SlidingPiece 
  
  def moves
    result = []
    # move_dir.each do |direction|
    # 
    #   if direction == :horizontal
    # 
    #     HORIZONTAL_DIRS.each do |dir|
    #       curr_pos = self.pos
    #       #until pos[0] == 0 || pos[1] == 0 || pos[0] == 7 || pos[1] == 7
    #       while board.valid_pos?(curr_pos)
    #           curr_pos = [curr_pos[0] + dir[0], curr_pos[1] + dir[1]]
    #           result << curr_pos  
    #       end 
    #     end
    #   elsif direction == :diagonal  
    #   end 
      
      new_row = row.dup
      cut = self.pos[1]
      
      front = grid.pos[0][0..cut]
      back = grid.pos[0][cut..-1].reverse
      
      front.each_with_index do |el, idx|
         take = idx if el.color == self.color 
      end  
      
      back.each_with_index do |el, idx|
         drop = idx if el.color == self.color
      end              
      pos_moves = row[take..-drop]
      
      result
    end 
  
  def move_dir  
    dirs = [:horizontal, :diagonal]
  end
end

def row_selector
  board.grid.[pos[0]].select do |el|
    if el.color == self.color
      next if board.grid[[pos[0], el]] == self.pos 
      break
    end 
  end
end

def col_selector