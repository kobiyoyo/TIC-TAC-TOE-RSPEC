require './lib/player'

describe Player do
    let(:player){Player.new(type)}
    context 'Empty' do
      let(:type){{ }}
      it 'checks where there is no value' do
          expect{player}.to raise_error
      end
    end
    context 'inputed values' do
      let(:type){{choice:'X',name:'Chubi'}}
      it 'checks where there is no value' do
          expect{player}.to_not raise_error
      end
    end
    context 'inputed choice values' do
      let(:type){{choice:'X',name:'Chubi'}}
      it 'checks where there is no value' do
          expect(player.choice).to eql('X')
      end
    end
    context 'inputed name values' do
      let(:type){{choice:'X',name:'Chubi'}}
      it 'checks where there is no value' do
          expect(player.name).to eql('Chubi')
      end
    end
end