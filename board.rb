require_relative 'piece'
require_relative 'display'
require_relative 'cursor'
require_relative 'queen'
require_relative 'king'
require_relative 'bishop'
require_relative 'rook'
require_relative 'knight'
require_relative 'pawn'
require_relative 'null_piece'
require 'byebug'

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) {Array.new(8, NullPiece.instance)}
    setup_board
  end

  def setup_board
    self[[0,3]] = Queen.new([0,3], self, :cyan)
    self[[7,3]] = Queen.new([7,3], self, :magenta)
    self[[0,4]] = King.new([0,4], self, :cyan)
    self[[7,4]] = King.new([7,4], self, :magenta)

    self[[0,0]] = Rook.new([0,0], self, :cyan)
    self[[0,7]] = Rook.new([0,7], self, :cyan)
    self[[7,0]] = Rook.new([7,0], self, :magenta)
    self[[7,7]] = Rook.new([7,7], self, :magenta)

    self[[0,1]] = Knight.new([0,1], self, :cyan)
    self[[0,6]] = Knight.new([0,6], self, :cyan)
    self[[7,1]] = Knight.new([7,1], self, :magenta)
    self[[7,6]] = Knight.new([7,6], self, :magenta)

    self[[0,2]] = Bishop.new([0,2], self, :cyan)
    self[[0,5]] = Bishop.new([0,5], self, :cyan)
    self[[7,2]] = Bishop.new([7,2], self, :magenta)
    self[[7,5]] = Bishop.new([7,5], self, :magenta)

    8.times do |i|
      next if i == 4
      self[[1,i]] = Pawn.new([1,i], self, :cyan)
      self[[6,i]] = Pawn.new([6,i], self, :magenta)
    end
  end

  def move_piece(start_pos, end_pos)
    start_piece = @grid[start_pos[0]][start_pos[1]]
    raise "No piece at start" if start_piece == NullPiece.instance
    raise "Can't move there" unless start_piece.moves.include?(end_pos)
    self[end_pos] = start_piece
    start_piece.move_piece(end_pos)
    self[start_pos] = NullPiece.instance
  end

  def in_check?(color)
    cyan_king = magenta_king = nil

    @grid.each do |row|
      row.each do |piece|
        if piece.is_a?(King)
          if piece.color == :cyan
            cyan_king = piece
          else
            magenta_king = piece
          end
        end
      end
    end

     checked = check_kings(cyan_king, magenta_king)
     checked ? (puts "Checkmate!") : nil
     checked
  end

  def check_kings(cyan_king, magenta_king)
    @grid.each do |row|
      row.each do |piece|
        unless piece.is_a?(King)
          if piece.color == :cyan
            return true if piece.moves.include?(magenta_king.pos)
          else
            return true if piece.moves.include?(cyan_king.pos)
          end
        end
      end
    end

    false
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
