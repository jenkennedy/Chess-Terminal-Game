require_relative 'piece.rb'

class Rook < Piece
  include SlidingPiece

  def initialize(pos, board, color)
    super(pos, board)
    @color = color
    @symbol = :"♜"
  end

  def move_dirs
    [[0, 1], [0, -1],
    [1, 0], [-1, 0]]
  end
end

# ♔♚
# ♖
# ♝♗
# ♞♘
# ♟♙
