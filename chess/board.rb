require_relative 'piece.rb'
require_relative 'display.rb'
require_relative 'cursor.rb'
require 'byebug'

class Board
  attr_reader :grid

  def initialize
    @piece = Piece.new #temp null piece
    @grid = Array.new(8) {Array.new(8, nil)}
    @grid[2][2] = @piece
  end

  def move_piece(start_pos, end_pos)
    start_piece = @grid[start_pos[0]][start_pos[1]]
    raise "No piece at start" if start_piece.nil?
    raise "Can't move there" if start_piece.valid_move?(start_pos, end_pos)
  end


end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  display = Display.new(board)
  display.run
end
