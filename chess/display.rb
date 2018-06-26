require 'colorize'
require_relative 'board.rb'
require_relative 'cursor.rb'
require_relative 'piece.rb'

class Display
  def initialize(board)
    @cursor = Cursor.new([0, 0], board)
    @board = board
    @selected = false
  end

  def render
    system('clear')
    board.grid.each_with_index do |row, idx1|
      print "\n"
      row.each_with_index do |el, idx2|
        piece = el.symbol
        color = el.color
        bg_color = (idx1 + idx2).odd? ? :white : :black
        if @cursor.cursor_pos == [idx1, idx2]
          bg_color = @selected ? :red : :gray
          print " #{piece} ".colorize(:color => color, :background => bg_color).bold
        else
          print " #{piece} ".colorize(:color => color, :background => bg_color)
        end
      end
    end
    print "\n"
  end

  def run
    start_pos = nil
    while true
      render
      input = @cursor.get_input
      unless input.nil?
        start_pos = input if @selected
        unless @selected || start_pos.nil?
          make_move(start_pos, input)
          start_pos = nil
        end
        @selected = !@selected
      end
    end
  end

  private
  attr_reader :board
end
