#!/usr/bin/env ruby

require './lib/player.rb'
require './lib/board.rb'
require './lib/game.rb'
require './bin/main.rb'

class Game
  include Main
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
# Game.new.play
