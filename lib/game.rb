#!/usr/bin/env ruby

require_relative 'player.rb'
require_relative 'board.rb'
require './bin/main.rb'

class Game
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
