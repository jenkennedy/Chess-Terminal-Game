require_relative 'piece.rb'

class Bishop < Piece
  include SlidingPiece

  def initialize(pos, board, color)
    super(pos, board)
    @color = color
    @symbol = :"♝"
  end

  def move_dirs
    [[1, 1], [-1, -1],
    [1, -1], [-1, 1]]
  end
end

# ♔♚
# ♜♖
# ♞♘
# ♟♙
