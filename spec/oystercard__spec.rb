require 'oystercard'

describe Oystercard do 
    describe 'initialize' do 
      it 'initializes balance under oystercard class' do 
        oystercard = Oystercard.new
        expect(oystercard.balance).to eq(0)
       end 
    end 
end 