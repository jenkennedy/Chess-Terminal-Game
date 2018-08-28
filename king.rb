require_relative 'piece'
require_relative 'stepping_piece'

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
