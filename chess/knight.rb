require_relative 'piece.rb'

class Knight < Piece
  include SteppingPiece

  def initialize(pos, board, color)
    super(pos, board)
    @color = color
    @symbol = :"♞"
  end

  def move_spots
    [[2, 1], [2, -1],
    [-2, 1], [-2, -1],
    [1, 2], [1, -2],
    [-1, 2], [-1, -2]]
  end

end
