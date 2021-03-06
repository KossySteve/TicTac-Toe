#!/usr/bin/env ruby

require './lib/player.rb'
require './lib/board.rb'
require './lib/game.rb'
require 'colorize'

module Main
  puts 'Welcome to Tic Tac Toe'

  def start
    @game_symbols = %w[X O]
    puts 'player 1 what is your name?'
    pl_one = gets.chomp
    while pl_one.strip.empty?
      puts 'Cannot be empty, please key in your name again'
      pl_one = gets.chomp
    end
    puts " #{pl_one} choose your symbol either X or O to play "
    symbol = gets.chomp.upcase
    until @game_symbols.include? symbol
      puts 'Only enter X or O'
      puts "#{pl_one} choose your symbol either X or O to play "
      symbol = gets.chomp.upcase
    end
    @player_one = create_player(pl_one, symbol)
    @game_symbols.delete(symbol)
    puts 'player 2 what is your name?'
    pl_two = gets.chomp
    while pl_two.strip.empty?
      puts 'Cannot be empty, please key in your name again'
      pl_two = gets.chomp
    end
    symbol_two = @game_symbols[0]
    puts "#{pl_two} your symbol is #{symbol_two}"
    @players = { pl_one => symbol, pl_two => symbol_two }
    puts ''
    @player_two = create_player(pl_two, symbol_two)
    @board = Board.new
    @board.show
  end

  # play again method
  def play_again
    puts 'Do you wanna play again... Yes or No ??'
    valid_yes_answers = %w[YES Y]
    valid_no_answers = %w[NO N]
    answer = gets.chomp.upcase
    until valid_yes_answers.any? { |item| item == answer } || valid_no_answers.any? { |item| item == answer }
      puts 'Answer yes or no please!'
      answer = gets.chomp.upcase
    end
    Game.new.play if valid_yes_answers.any? { |item| item == answer }
  end

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
      puts "#{@players.key('X')} wins".red

    when 'O'
      puts "#{@players.key('O')} wins".red
    else
      puts 'It is a draw !!!'.red
    end
    play_again
  end
end
