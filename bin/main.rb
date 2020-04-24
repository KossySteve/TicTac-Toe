#!/usr/bin/env ruby
require_relative 'player.rb'
require_relative 'board.rb'

class Game
  def start
    puts 'Welcome to Tic Tac Toe'
    puts '----------+-----------'
    puts 'player 1 what is your name?'
    player1 = gets.chomp

    puts " #{player1} choose your symbol either X or O to play "
    symbol = gets.chomp
    unless $game_symbols.include? symbol
      puts "Only enter X or O"
      puts " #{player1} choose your symbol either X or O to play "
      symbol = gets.chomp.upcase
    end

    $game_symbols.delete(symbol)
    puts 'player 2 what is your name?'
    player2 = gets.chomp
    symbol2 = $game_symbols[0]
    puts "#{player2} your symbol is #{symbol2}"
    puts ""

    @player_1 = Player.new(player1, symbol)
    @player_2 = Player.new(player2, symbol2)
    board = Board.new
    board.show
  end

  def turn(player)
    puts "pick a number position on the board you want to play on"
    pick = gets.chomp
    cell = pick.to_i - 1
    if board.field[cell] == 'X' or board.field[cell] == 'O' or pick.length != 1 or !pick == (1..9)
      puts "invalid choice... pls choose positions not filled from 1 to 9"
    else
      board.field[cell] = player.symbol
      board.show
    end
  end

  def game_over
    case board.winner
    when 'X'
      if @player_1.symbol == 'X'
        puts "#{@player_1.name} wins!!!"
      else
        puts "#{@player_2.name} wins!!!"
      end
    when 'O'
      if @player_1.symbol == 'O'
        puts "#{@player_1.name} wins!!!"
      else
        puts "#{@player_2.name} wins!!!"
      end
    else
      puts "It is a draw !!!"
    end
    play_again
  end

  def play_again
    puts "Do you wanna play again... Yes or No ??"
    answer = gets.chomp.upcase
    if answer == 'YES'
      Game.new.play
    else
      puts "Thanks for playing"
    end
  end

  def play
    start
    until board.winner or board.full?
      turn(player_1)
      turn(player_2)
    end
    game_over
  end
end
Game.new.play
