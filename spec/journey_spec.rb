require 'journey'

describe Journey do
  describe "#in_journey?" do
    it "should return whether a user is currently in/not in a journey" do
      card = Oystercard.new
      card.top_up(5)

      expect { card.touch_in("station") }.to change{journey.in_journey?}.from(false).to(true)

    end
  end

end
