require_relative 'piece.rb'

class Pawn < Piece
  def initialize(pos, board, color)
    super(pos, board)
    @color = color
    @symbol = :"♟"
    @direction = pos[0] > 3 ? -1 : 1
  end

  def move_piece(pos)
    @has_moved ||= true if pos != @pos
    super
  end

  def moves
    possible_moves = []
    potential = [pos[0] + @direction * 2, pos[1]]
    if @has_moved.nil? && valid_move?(potential)
      possible_moves << potential
    end
    potential = [pos[0] + @direction, pos[1] + 1]
    if board[potential].is_a?(Piece) && board[potential].color != color
      possible_moves << potential
    end
    potential = [pos[0] + @direction, pos[1] - 1]
    if board[potential].is_a?(Piece) && board[potential].color != color
      possible_moves << potential
    end
    potential = [pos[0] + @direction, pos[1]]
    if valid_move?(potential)
      possible_moves << potential
    end
    possible_moves
  end

  def valid_move?(pos)
    return false unless super
    return false unless board[pos] == NullPiece.instance
    true
  end
end
