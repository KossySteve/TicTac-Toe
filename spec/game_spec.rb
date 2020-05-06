require './lib/player.rb'
require './lib/board.rb'
require './lib/game.rb'
require './bin/main.rb'

describe Board do
  game_board = Board.new
  describe "#winner" do
    it "returns false when there is no winner" do
      expect(game_board.winner).to eql(false)
    end
    it "prints the game board" do
      expect(game_board.show).to be_nil
    end
    it "returns 9 cells to play on" do
      expect(game_board.field.length).to eql(9)
    end
    it "board is empty or is not full as game begins" do
      expect(game_board.full?).to eql(false)
    end
  end
end

describe Game do
  game = Game.new
  board = Board.new
  describe "#play" do
    it "instance of Game calls play method" do
      expect(game).to receive(:play)
      game.play
    end
    it "return game_over when there's a winner " do
      expect(game.play).to eql(:game_over) if board.winner == 'X'
    end
    it "responds to Main methods" do
      expect(game).to respond_to(:turn, :play_again, :start, :game_over)
    end
  end
end

describe Main do
  describe "#start" do
    it "create and stores player name" do
      @player_one = Player.new("Mark")
       expect(@player_one.name).to eq("Mark")
    end
    it "creates and stores player symbol" do
      @player_one = Player.new("Jana", "X")
       expect(@player_one.symbol).to eq("X")
    end
  end
end
