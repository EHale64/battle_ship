require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'


p "Welcome to  BATTLESHIP!"
p "Enter p to play. Enter r for rules. Enter q to quit."
print "> "
player_choice = gets.chomp
loop do
  if player_choice == "p"
    game = Game.new
    game.player_placing_ships
    game.turn
  elsif player_choice == "q"
    break
  elsif player_choice == "r"
    p "Today we will be using a 4x4 board."
    p "You will see the board displayed once the game begins."
    p "You will be able to place you ships anwhere you like."
    p "Note: Valid ship placement will only be horizontal or diagonal."
    p "And ships may not overlap one another."
    p "We will then take turns firing one shot at a time at each others ships."
    p "Shots will be displayed on the board after firing."
    p "The game will end when one of us sinks both of our opponnets ships."
    p "Have questions? Please visit:"
    p "https://www.hasbro.com/common/instruct/Battleship.PDF"
    p "For official game rules and information."
    p "Enter p to play. Enter r for rules. Enter q to quit."
    print "> "
  else
   p "Invalid input, please try again: "
   print "> "
  end
  player_choice = gets.chomp

end
