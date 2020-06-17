class Oystercard
    MAXIMUMLIMIT = 90
    FARE = 1
    attr_reader :balance, :location 
    
    def initialize
      @balance = 0
      @location = false
    end 

    def top_up(value)
      @balance + value > MAXIMUMLIMIT ? (raise "You've reached the maximum limit, which is #{MAXIMUMLIMIT}") : @balance += value
    end

    def touch_in
      balance < FARE ? (raise StandardError.new "you have insufficient funds") : in_journey?
    end
    
    def touch_out
      in_journey?
      deduct
    end
    
    def in_journey?
      @location = !@location
    end

    private
    def deduct
      @balance -= FARE
    end
end 

