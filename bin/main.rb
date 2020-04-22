#!/usr/bin/env ruby
puts "Welcome to the game of Tic Tac Toe!!"
puts
puts "Player 1 what is your name?"
player_1 = gets.chomp
puts "Welcome #{player_1} choose your game symbol" 
player_1_symbol = gets.chomp
puts "Ok #{player_1} you will be playing with #{player_1_symbol} as your symbol"
# player 1 chooses x
puts "Player 2 what is your name?"
player_2 = gets.chomp
puts "Welcome #{player_2} choose your game symbol" 
player_2_symbol = gets.chomp
puts "Ok #{player_2} you will be playing with #{player_2_symbol} as your symbol"
# player 2 chooses O


# Display board
puts "----+----+----"
puts "----+----+----"
puts "----+----+----"
puts "----+----+----"


# Player 1 will play
puts "x"
# Player 2 will play
puts "o"
# Player 1 will play
puts "x"
# Player 2 will play
puts "o"
# Player 1 will play
puts "x"
# Player 2 will play
puts "o"
# Player 1 will play
puts "x"

# Draw
puts "Its a draw"
puts "Game Over"
puts "Do you want to play again?"








