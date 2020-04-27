#!/usr/bin/env ruby

require './lib/player.rb'
require './lib/board.rb'
require './bin/main.rb'

class Game
  def turn(player)
    puts "#{player.name} pick a box to mark"
    pick = gets.chomp
    cell = pick.to_i - 1
    # check if the cell is occupied
    if @board.field[cell] == 'X' || @board.field[cell] == 'O' || pick.length != 1 || !pick[/[1-9]/]
      puts 'Invalid Cell'
      turn(player)
    else
      @board.field[cell] = player.symbol
      @board.show
    end
  end

  def game_over
    case @board.winner
    when 'X'
      puts "#{@players.key('X')} wins"

    when 'O'
      puts "#{@players.key('O')} wins"
    else
      puts 'It is a draw !!!'
    end
    play_again
  end

  def play
    start
    until @board.winner or @board.full?
      turn(@player_one)
      break if @board.winner or @board.full?

      turn(@player_two)
    end
    game_over
  end
end
Game.new.play
