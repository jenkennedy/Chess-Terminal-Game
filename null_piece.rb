require 'Singleton'

class NullPiece
  include Singleton

  attr_reader :color, :symbol

  def initialize
    @color = :white
    @symbol = :" "
  end

  def moves
    []
  end
end
