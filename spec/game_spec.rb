# frozen_string_literal: true

require './bin/main.rb'

describe Game do
  let(:chubi) { Player.new(choice: 'X', name: 'chubi') }
  let(:danilo) { Player.new(choice: 'O', name: 'danilo') }
  context '#intialize' do
    it 'randomly selects a current_player' do
      allow_any_instance_of(Array).to receive(:shuffle).and_return([danilo, chubi])
      game = Game.new([chubi, danilo])
      expect(game.current_player).to eq danilo
    end

    it 'randomly selects an other player' do
      allow_any_instance_of(Array).to receive(:shuffle).and_return([danilo, chubi])
      game = Game.new([chubi, danilo])
      expect(game.other_player).to eq chubi
    end
  end
  context '#switch_players' do
    it 'will set @current_player to @other_player' do
      game = Game.new([chubi, danilo])
      other_player = game.other_player
      game.switch_players
      expect(game.current_player).to eq other_player
    end

    it 'will set @other_player to @current_player' do
      game = Game.new([chubi, danilo])
      current_player = game.current_player
      game.switch_players
      expect(game.other_player).to eq current_player
    end
  end
end

describe UserInterface do
  let(:chubi) { Player.new(choice: 'X', name: 'chubi') }
  lets(:danilo) { Player.new(choice: 'O', name: 'danilo') }
  context '#solicit_move' do
    it 'asks the player to make a move' do
      game = Game.new([chubi, danilo])
      allow(game).to receive(:current_player).and_return(chubi)
      expected = 'chubi: Enter a number between 1 and 9 to make your move'
      expect(game.solicit_move).to eq expected
    end
  end
  context '#get_move' do
    it "converts human_move of '1' to [0, 0]" do
      game = Game.new([chubi, danilo])
      expect(game.get_move('1')).to eq [0, 0]
    end

    it "converts human_move of '1' to [0, 0]" do
      game = Game.new([chubi, danilo])
      expect(game.get_move('9')).to eq [2, 2]
    end
  end
  context '#game_over_message' do
    it "returns '{current player name} won!' if board shows a winner" do
      game = Game.new([chubi, danilo])
      allow(game).to receive(:current_player).and_return(chubi)
      allow(game.board).to receive(:game_over).and_return(:winner)
      expect(game.game_over_message).to eq 'chubi won!'
    end

    it "returns 'The game ended in a tie' if board shows a draw" do
      game = Game.new([chubi, danilo])
      allow(game).to receive(:current_player).and_return(chubi)
      allow(game.board).to receive(:game_over).and_return(:draw)
      expect(game.game_over_message).to eq 'The game ended in a tie'
    end
  end
end
