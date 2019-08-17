require './lib/cell'

describe Cell do
    let(:cell){Cell.new}
    
    context 'initialize empty Cell' do
        it 'checks class when value empty' do
            expect(cell.value).to eql('')
        end
    end
    
    context 'intialize cell with value' do
        it 'check when vaue is O' do
            obj = Cell.new('o')
            expect(obj.value).to eql('o')
        end
    end
end