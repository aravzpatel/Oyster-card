class Oystercard
    
    attr_reader :balance 
    
    def initialize
        @balance = 0
    end 

    def top_up(value)
      @balance + value > 90 ? (raise "You've reached the maximum limit") : @balance += value
    end
end 

