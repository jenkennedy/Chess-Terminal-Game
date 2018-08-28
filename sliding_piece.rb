module SlidingPiece
  def moves
    possible_moves = []

    directions = move_dirs

    directions.each do |dir|
      row,col = @pos[0] + dir[0], @pos[1] + dir[1]

      while valid_move?([row, col])
        possible_moves << [row, col]

        current_spot = @board[[row,col]]
        break if !current_spot.is_a?(NullPiece) && current_spot.color != @color
        row,col = row + dir[0], col + dir[1]
      end
    end

    possible_moves
  end
end
