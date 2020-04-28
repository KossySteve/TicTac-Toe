#!/usr/bin/env ruby

require './lib/player.rb'
require './lib/board.rb'
require './bin/main.rb'

class Game
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
