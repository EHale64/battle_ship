require './lib/ship'
require './lib/cell'
require './lib/board'

class ComputerTest < Minitest::Test
  def setup
    @player_board = Board.new
    @computer_board =
    @computer = Computer.new(@player_board, @computer_board)
  end
end
