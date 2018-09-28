load "tictaktoe.rb"
puts "Tell me size of the board:"
size = gets.chomp
game = TicTakToe.new(size)
game.start
