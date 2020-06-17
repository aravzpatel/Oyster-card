class Oystercard
    MAXIMUMLIMIT = 90
    attr_reader :balance, :location 
    
    def initialize
        @balance = 0
        @location = false
    end 

    def top_up(value)
      @balance + value > MAXIMUMLIMIT ? (raise "You've reached the maximum limit, which is #{MAXIMUMLIMIT}") : @balance += value
    end

    def deduct
        @balance -= 2.5
    end

    def touch_in
      in_journey?
    end
    
    def touch_out
      in_journey?
    end
    
    def in_journey?
      @location = !@location
    end
end 

