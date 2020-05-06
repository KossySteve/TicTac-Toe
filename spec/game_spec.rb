require './lib/board.rb'
require './lib/player.rb'
require './lib/game.rb'

RSpec.describe do
  describe 'Game' do
    let(:board) { Board.new }
    let(:game) { Game.new }

    it 'instance of Game calls play method' do
      expect(game).to receive(:play)
      game.play
    end
    it "return game_over when there's a winner " do
      expect(game.play).to eql(:game_over) if board.winner == 'X'
    end
    it 'responds to Main methods' do
      expect(game).to respond_to(:turn, :play_again, :start, :game_over)
    end
  end
  describe 'Player' do
    it 'creates instance with name of player correctly' do
      a = create_player('Joseph', 'X')
      expect(a.name).to eq('Joseph')
    end
    it 'creates instance with correct player symbol' do
      b = create_player('Joseph', 'X')
      expect(b.symbol).to eq('X')
    end
    it 'raises error when name is given as integer' do
      expect { create_player('90', 'X') }.to raise_error(ArgumentError, 'Name can\'t be an Integer')
    end
  end
  describe 'Board' do
    let(:board) { Board.new }
    it 'has only 9 positions' do
      expect(board.field.length).to eq(9)
    end
    it 'checks if the board is not occupied' do
      possible_values = %w[X O]
      board.field.all? { |cell| possible_values.include?(cell) }
      expect(board.full?).to eq(false)
    end
    it 'checks that board is fully occupied ' do
      board.field = %w[
        X O X
        X O X
        X O X
      ]
      expect(board.full?).to eq(true)
    end
    it 'shows winner is X when X is aligned in the first row ' do
      board.field = [
        'X', 'X', 'X',
        '', '', '',
        '', '', ''
      ]
      expect(board.winner).to eq('X')
    end
    it ' shows winner is X when X is aligned in the first column ' do
      board.field = [
        'X', '', '',
        'X', '', '',
        'X', '', ''
      ]
      expect(board.winner).to eq('X')
    end
    it 'shows winner is O when O is aligned in second column' do
      board.field = [
        '', 'O', '',
        '', 'O', '',
        '', 'O', ''
      ]
      expect(board.winner).to eq('O')
    end

    it 'shows winner is X when X symbol occupies second row of the board' do
      board.field = [
        '', '', '',
        'X', 'X', 'X',
        '', '', ''
      ]
      expect(board.winner).to eq('X')
    end

    it 'shows winner is O when O symbol occupies third row of the board' do
      board.field = [
        '', '', '',
        '', '', '',
        'O', 'O', 'O'
      ]
      expect(board.winner).to eq('O')
    end

    # 258
    it 'shows winner is X when X is aligned diagonally' do
      board.field = [
        '', '', 'X',
        '', 'X', '',
        'X', '', ''
      ]
      expect(board.winner).to eq('X')
    end

    # 246
    it 'shows winner is X when X is aligned on the third column' do
      board.field = [
        '', '', 'X',
        '', '', 'X',
        '', '', 'X'
      ]
      expect(board.winner).to eq('X')
    end
    # 048
    it 'shows winner is O when O is aligned diagonally' do
      board.field = [
        'O', '', '',
        '', 'O', '',
        '', '', 'O'
      ]
      expect(board.winner).to eq('O')
    end
    it 'evaluates to false when there is no winner' do
      board.field = %w[
        O O X
        X X O
        O X O
      ]
      expect(board.winner).to eq(false)
    end
  end
  
end
