#!/usr/bin/env ruby
puts "Welcome to the game of Tic Tac Toe!!"
puts "Player 1 what is your name?"
player_1 = gets.chomp
puts "Welcome #{player_1} choose your game symbol: X or O"
player_1_symbol = gets.chomp
# player 1 chooses "X or O"
puts "Ok #{player_1} you will be playing with #{player_1_symbol} as your symbol"
puts "Player 2 what is your name?"
player_2 = gets.chomp
puts "Welcome #{player_2} choose your game symbol"
player_2_symbol = gets.chomp
# player 2 chooses "O or X"
puts "Ok #{player_2} you will be playing with #{player_2_symbol} as your symbol"



# Display board
puts "___1_|__2__|__3__"
puts "___4_|__5__|__6__"
puts "___7_|__8__|__9__"


3.times do
  puts "player1 choose any of the numbered positions from 1 to 9 that hasn't been played on to play #{player_1_symbol}"
  position = gets.chomp
# Player 1 will play
  puts "X" # at chosen position
  puts "player2 choose any of the numbered positions from 1 to 9 that hasn't been played on to play #{player_2_symbol}"
  position = gets.chomp
# Player 2 will play
  puts "O" # at chosen position
  puts "player1 choose any of the numbered positions from 1 to 9 to play #{player_1_symbol}"
  position = gets.chomp
# Player 1 will play
  puts "X" # at chosen position
end


# Draw
puts "Its a draw~! or player1 wins! or player2 wins!"
puts "Game Over"
puts "Do you want to play again?"
