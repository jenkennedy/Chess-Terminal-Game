require_relative 'piece.rb'

class King < Piece
  include SteppingPiece

  def initialize(pos, board, color)
    super(pos, board)
    @color = color
    @symbol = :"♚"
  end

  def move_diffs
    [[0, 1], [0, -1],
    [1, 0], [-1, 0],
    [1, 1], [-1, -1],
    [1, -1], [-1, 1]]
  end

end
