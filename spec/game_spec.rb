require './lib/player.rb'
require './lib/board.rb'
require './lib/game.rb'
require './bin/main.rb'

describe Board do
  describe "#winner" do
    it "returns false when there is no winner" do
      a_winner = Board.new
      expect(a_winner.winner).to eql(false)
    end
    it "returns the game board" do
      game_board = Board.new
      game_board.show
    end
    it "returns 9 cells to play on" do
      game_board = Board.new
      expect(game_board.field.length).to eql(9)
    end
    it "board is empty or is not full as game begins" do
      game_board = Board.new
      expect(game_board.full?).to eql(false)
    end
  end
end

describe Game do
  describe "#play" do
    it "instance of Game calls play method" do
      game = Game.new
      expect(game).to receive(:play)
      game.play
    end
    it "return game_over when there's a winner " do
      game = Game.new
      board = Board.new
      expect(game.play).to eql(:game_over) if board.winner == 'X'
    end
    it "responds to Main methods" do
      game = Game.new
      expect(game).to respond_to(:turn, :play_again, :start, :game_over)
    end
  end
end
