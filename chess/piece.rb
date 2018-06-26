class Piece
  attr_reader :symbol, :color
  def initialize(pos, board)
    @pos = pos
    @board = board
  end

  def moves
    []
  end

  def valid_move?(pos)
    return false if @board[pos[0]][pos[1]].color == color
    true
  end

  private

  attr_reader :pos, :board
end

module SlidingPiece
  def moves
    possible_moves = []

    directions = move_dirs

    directions.each do |dir|
      row,col = @pos[0] + dir[0], @pos[1] + dir[1]

      while valid_move?([row, col])
        possible_moves << [row, col]

        current_spot = @board[row][col]
        break if !current_spot.is_a?(NullPiece) && current_spot.color != @color
        row,col = row + dir[0], col + dir[1]
      end
    end

    possible_moves
  end
end

module SteppingPiece
  def moves
    possible_moves = []

    directions = move_dirs

    directions.each do |dir|
      row,col = @pos[0] + dir[0], @pos[1] + dir[1]

      if valid_move?([row, col])
        possible_moves << [row, col]
      end
    end

    possible_moves
  end
end
