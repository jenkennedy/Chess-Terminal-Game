require_relative 'piece.rb'

class Queen < Piece
  include SlidingPiece

  def initialize(pos, board, color)
    super
    @color = color
    @symbol = :q if color == :white
    @symbol = :Q if color == :black
  end
end
