module SteppingPiece
  def moves
    possible_moves = []

    directions = move_diffs

    directions.each do |dir|
      row,col = @pos[0] + dir[0], @pos[1] + dir[1]

      if valid_move?([row, col])
        possible_moves << [row, col]
      end
    end

    possible_moves
  end
end
