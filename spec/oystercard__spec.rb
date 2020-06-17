require 'oystercard'

describe Oystercard do 
  let(:oystercard) { Oystercard.new }
  let(:station){ double :station }

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
    it "should deduct 1 every time" do
      card = Oystercard.new
      card.top_up(5)
      card.send(:deduct) #can call a private method in a test
      expect(card.balance).to eql(5 - Oystercard::FARE)
    end
  end

  describe "#touch_in" do
    it "should set in_journey? to true" do
        oystercard.top_up(5)
        oystercard.touch_in(station)
        expect(oystercard.in_journey?).to eql(true)
    end
    
    it "remembers the station" do
        oystercard.top_up(5)
        oystercard.touch_in(station)
        expect(oystercard.entry_station).to eql(station)
    end

    it "should only let you touch in if you have a minimum amount for a journey" do
      expect { oystercard.touch_in(station) }.to raise_error(StandardError, "you have insufficient funds")
    end    
  end
  
  describe "#touch_out" do
    
    before "top up the card" do
      oystercard.top_up(5)
      oystercard.touch_in(station)
    end

    it "should set in_journey? to false" do
      expect{ oystercard.touch_out("station") }.to change(oystercard, :in_journey?).from(true).to(false)
    end

    it "should reduce the balance by the FARE amount" do
      expect { oystercard.touch_out("station") }.to change{oystercard.balance}.by(-Oystercard::FARE)
    end

    it "station should be nil" do
      expect {oystercard.touch_out("station")}.to change{oystercard.entry_station}.from(station).to(nil)
    end
  end

  describe "#show_history" do
    it "should show empty travel history" do
      expect(oystercard.history).to match_array([])
    end

    it "should save entry and exit stations" do
      oystercard.top_up(10)
      oystercard.touch_in("station1")
      oystercard.touch_out("station2")
      expect(oystercard.history).to match_array([{touch_in: "station1", touch_out: "station2"}])
    end

    
  end

end 