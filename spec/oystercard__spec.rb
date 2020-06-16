require 'oystercard'

describe Oystercard do 
  let(:oystercard) { Oystercard.new }

  describe '#initialize' do 
    it 'initializes balance under oystercard class' do 
      expect(oystercard.balance).to eq(0)
    end 
  end 

  describe "#top_up" do
    it "should equal 5 if we #top_up the balance by 5" do
      oystercard.top_up(5)
      expect(oystercard.balance).to eql(5)
    end
  end
end 