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
    33.times { print "-"}
    board.grid.each_with_index do |row, idx1|
      print "\n"
      row.each_with_index do |el, idx2|
        piece = el.nil? ? "X" : "O"
        if @cursor.cursor_pos == [idx1, idx2]
          color = @selected ? :green : :red
          print "|" + " #{piece} ".colorize(color).bold
        else
          print "| #{piece} "
        end
      end
      print "|\n"
      33.times {print "-"}
    end
    print "\n"
  end

  def run
    while true
      render
      input = @cursor.get_input
      unless input.nil?
        @selected = !@selected
      end
    end
  end

  private
  attr_reader :board
end
