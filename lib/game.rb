require './lib/board'
require './lib/computer'
require './lib/cell'
require './lib/ship'

class Game

  attr_reader :player_board,
              :computer_board

  def initialize
    @computer = Computer.new
    @player_board = Board.new
    @computer_board = @computer.board
    @player_cruiser = Ship.new("Cruiser", 3)
    @computer_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
    @computer_submarine = Ship.new("Submarine", 2)
  end


  def player_placing_ships
    @computer.setup_board([@computer_cruiser, @computer_submarine])
    p "I have laid out my ships on the grid."
    p "You now need to lay out your two ships."
    p "The Cruiser is three units long and the Submarine is two units long."
    print @player_board.render(true)
    p "Enter the squares for the Cruiser (3 spaces):"
    print "> "
    placement = gets.chomp
    until @player_board.place(@player_cruiser, placement.split) do
      p "THOSE ARE INVALID COORDINATES. PLEASE TRY AGAIN: "
      print "> "
      placement = gets.chomp
    end

    print @player_board.render(true)
    p "Enter the squares for the Submarine (2 spaces):"
    print "> "

    placement2 = gets.chomp
    until @player_board.place(@player_submarine, placement2.split) do
      p "THOSE ARE INVALID COORDINATES. PLEASE TRY AGAIN: "
      print "> "
      placement2 = gets.chomp
    end
    print @player_board.render(true)
  end
end
