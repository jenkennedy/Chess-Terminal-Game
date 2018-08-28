require 'byebug'

class Piece
  attr_reader :symbol, :color, :pos

  def initialize(pos, board)
    @pos = pos
    @board = board
  end

  def move_piece(pos)
    @pos = pos
  end

  def valid_move?(pos)
    return false unless pos[0].between?(0,7) && pos[1].between?(0,7)
    return false if @board[pos].color == color
    true
  end

  private

  attr_reader :board
end
