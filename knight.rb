require_relative 'piece'
require_relative 'stepping_piece'

class Knight < Piece
  include SteppingPiece

  def initialize(pos, board, color)
    super(pos, board)
    @color = color
    @symbol = :"♞"
  end

  def move_diffs
    [[2, 1], [2, -1],
    [-2, 1], [-2, -1],
    [1, 2], [1, -2],
    [-1, 2], [-1, -2]]
  end

end
