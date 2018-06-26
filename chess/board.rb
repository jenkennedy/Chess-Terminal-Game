require_relative 'piece.rb'
require_relative 'display.rb'
require_relative 'cursor.rb'
require_relative 'queen'
require_relative 'null_piece'
require 'byebug'

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) {Array.new(8, NullPiece.instance)}
    @grid[2][2] = Queen.new([2,2], self, :cyan)
  end

  def move_piece(start_pos, end_pos)
    start_piece = @grid[start_pos[0]][start_pos[1]]
    raise "No piece at start" if start_piece == NullPiece.instance
    raise "Can't move there" if start_piece.valid_move?(end_pos)
    self[end_pos] = start_piece
    self[start_pos] = NullPiece.instance
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos, value)
    @grid[pos[0]][pos[1]] = value
  end
end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  display = Display.new(board)
  display.run
end
