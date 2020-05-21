require './lib/board'
require './lib/computer'
require './lib/cell'
require './lib/ship'

class Game
  attr_reader :computer,
              :player_board,
              :computer_board,
              :player_cruiser,
              :computer_cruiser,
              :player_submarine,
              :computer_submarine

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
    print "\nEnter the squares for the Cruiser (3 spaces): "
    print "\n> "
    placement = gets.chomp

    until @player_board.place(@player_cruiser, placement.split) do
      p "THOSE ARE INVALID COORDINATES. PLEASE TRY AGAIN: "
      print "> "
      placement = gets.chomp
    end

    print @player_board.render(true)
    print "\nEnter the squares for the Submarine (2 spaces):"
    print "\n> "

    placement2 = gets.chomp
    until @player_board.place(@player_submarine, placement2.split) do
      p "THOSE ARE INVALID COORDINATES. PLEASE TRY AGAIN: "
      print "> "
      placement2 = gets.chomp
    end
    print @player_board.render(true)
  end

  def computer_fire
    random_cell = @player_board.cells.values.sample
    until random_cell.fired_upon? == false do
      random_cell = @player_board.cells.values.sample
    end
    random_cell.fire_upon
    random_cell
  end

  def turn
    loop do
    puts "\n=============COMPUTER BOARD============="
    print @computer_board.render
    puts "\n==============PLAYER BOARD=============="
    print @player_board.render(true)
    puts "\nEnter the coordinate for your shot: "
    print "> "
    
    player_shot = gets.chomp
      until @computer_board.valid_coordinate?(player_shot) do
        @computer_board.valid_coordinate?(player_shot) == false
        p "THOSE ARE INVALID COORDINATES. PLEASE TRY AGAIN: "
        print "> "
        player_shot = gets.chomp
      end

      until @computer_board.cells[player_shot].fired_upon? == false
        p "YOU HAVE ALREADY FIRED ON THAT SPOT. PLEASE TRY AGAIN: "
        print "> "
        player_shot = gets.chomp
      end
      @computer_board.cells[player_shot].fire_upon

      if @computer_board.cells[player_shot].render == "M"
        p "Your shot on #{player_shot} was a miss"
      elsif @computer_board.cells[player_shot].render == "H"
        p "Your shot on #{player_shot} was a hit"
      elsif @computer_board.cells[player_shot].render == "X"
        p "You sunk my #{@computer_board.cells[player_shot].ship.name}!"
      end

      bang = computer_fire
        if bang.render == "M"
          p "My shot on #{bang.coordinate} was a miss"
        elsif bang.render == "H"
          p "My shot on #{bang.coordinate} was a hit"
        elsif bang.render == "X"
          p "I sunk your #{bang.ship.name}!"
        end

      if @computer_cruiser.sunk? && @computer_submarine.sunk?
        p "You win!"
        break
      elsif
        @player_cruiser.sunk? && @player_submarine.sunk?
        p "I win!"
        break
      end
    end
  end
end
