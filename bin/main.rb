#!/usr/bin/env ruby

require './lib/player.rb'
require './lib/board.rb'

class Game
  @@game_symbols = %w[X O]
  def start
    puts 'Welcome to Tic Tac Toe'
    puts 'player 1 what is your name?'
    pl_one = gets.chomp
    puts " #{pl_one} choose your symbol either X or O to play "
    symbol = gets.chomp
    unless @@game_symbols.include? symbol
      puts 'Only enter X or O'
      puts " #{pl_one} choose your symbol either X or O to play "
      symbol = gets.chomp.upcase
    end
    

    @@game_symbols.delete(symbol)
    puts 'player 2 what is your name?'
    pl_two = gets.chomp
    symbol_two = @@game_symbols[0]
    puts "#{pl_two} your symbol is #{symbol_two}"
    @players = {pl_one => symbol,pl_two => symbol_two}
    puts ''

    @player_one = Player.new(pl_one, symbol)
    @player_two = Player.new(pl_two, symbol_two)
    @board = Board.new
    @board.show
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
      puts "#{@players.key('X')} wins"
      
    when 'O'
      puts "#{@players.key('O')} wins"
    else
      puts 'It is a draw !!!'
    end
    play_again
  end

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
