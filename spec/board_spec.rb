# frozen_string_literal: true

require './lib/board'

describe Board do
  let(:board) { Board.new(type) }
  context 'inputed values' do
    let(:type) { { grids: 'grid' } }
    it 'checks where there is no value' do
      expect { board }.to_not raise_error
    end
  end
  context 'Default grid' do
    let(:board) { Board.new }
    it 'set to three rows by default' do
      expect(board.grids.size).to eql(3)
    end

    it 'set to three values in each row in default state' do
      board.grids.each do |x|
        expect(x.size).to eql(3)
      end
    end
  end
  context 'inputed values' do
    let(:type) { { grids: 'grid' } }
    it 'checks where there is no value' do
      expect(board.grids).to eql('grid')
    end
  end
  context '#get_cell' do
    let(:board) { Board.new(grids: type) }
    let(:type) { [['', 'daniel', ''], ['', '', ''], ['', '', '']] }
    it 'checkes for grid placement' do
      expect(board.get_cell(1, 0)).to eql('daniel')
    end
  end
  context '#set_cell' do
    it 'sets the value of the cell object at a (x, y) coordinate' do
      Cat = Struct.new(:value)
      grid = [[Cat.new('cool'), '', ''], ['', '', ''], ['', '', '']]
      board = Board.new(grids: grid)
      board.set_cell(0, 0, 'meow')
      expect(board.get_cell(0, 0).value).to eq 'meow'
    end
  end

  context '#game_over' do
    TestCell = Struct.new(:value)
    let(:x_cell) { TestCell.new('X') }
    let(:y_cell) { TestCell.new('Y') }
    let(:empty) { TestCell.new }
    it 'returns :winner if winner? is true' do
      board = Board.new
      allow(board).to receive(:winner?).and_return(true)
      expect(board.game_over).to eq :winner
    end

    it 'returns :draw if winner? is false and draw? is true' do
      board = Board.new
      allow(board).to receive(:winner?).and_return(false)
      allow(board).to receive(:draw?).and_return(true)
      expect(board.game_over).to eq :draw
    end

    it 'returns false if winner? is false and draw? is false' do
      board = Board.new
      allow(board).to receive(:winner?).and_return(false)
      allow(board).to receive(:draw?).and_return(false)
      expect(board.game_over).to be false
    end
    it 'returns :winner when row has objects with values that are all the same' do
      grid = [
        [x_cell, x_cell, x_cell],
        [y_cell, x_cell, y_cell],
        [y_cell, y_cell, empty]
      ]
      board = Board.new(grids: grid)
      expect(board.game_over).to eq :winner
    end

    it 'returns :winner when colum has objects with values that are all the same' do
      grid = [
        [x_cell, x_cell, empty],
        [y_cell, x_cell, y_cell],
        [y_cell, x_cell, empty]
      ]
      board = Board.new(grids: grid)
      expect(board.game_over).to eq :winner
    end

    it 'returns :winner when diagonal has objects with values that are all the same' do
      grid = [
        [x_cell, empty, empty],
        [y_cell, x_cell, y_cell],
        [y_cell, x_cell, x_cell]
      ]
      board = Board.new(grids: grid)
      expect(board.game_over).to eq :winner
    end

    it 'returns :draw when all spaces on the board are taken' do
      grid = [
        [x_cell, y_cell, x_cell],
        [y_cell, x_cell, y_cell],
        [y_cell, x_cell, y_cell]
      ]
      board = Board.new(grids: grid)
      expect(board.game_over).to eq :draw
    end

    it 'returns false when there is no winner or draw' do
      grid = [
        [x_cell, empty, empty],
        [y_cell, empty, empty],
        [y_cell, empty, empty]
      ]
      board = Board.new(grids: grid)
      expect(board.game_over).to be false
    end
  end
end
