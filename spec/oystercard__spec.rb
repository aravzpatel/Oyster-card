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
    
    it "should raise an error if the balance is over the MAXIMUMLIMIT" do
      expect { oystercard.top_up(Oystercard::MAXIMUMLIMIT + 1) }.to raise_error "You've reached the maximum limit, which is #{Oystercard::MAXIMUMLIMIT}"
    end
  end

  describe '#deduct' do
    it "should deduct 2.50 every time" do
      oystercard.top_up(5)
      oystercard.deduct
      expect(oystercard.balance).to eql(2.5)
    end
  end

  describe "#touch_in" do
    it "should set in_journey? to true" do
      oystercard.top_up(5)
      oystercard.touch_in
      expect(oystercard.location).to eql(true)
    end
  end
  
  describe "#touch_out" do
    it "should set in_journey? to false" do
      oystercard.top_up(5)
      oystercard.touch_out
      expect(oystercard.location).to eql(false)
    end
  end
end 