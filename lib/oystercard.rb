class Oystercard
    MAXIMUMLIMIT = 90
    FARE = 1
    attr_reader :balance, :location , :entry_station, :history

    def initialize
      @balance = 0
      @history = []
      # @location = false
    end

    def top_up(value)
      @balance + value > MAXIMUMLIMIT ? (raise "You've reached the maximum limit, which is #{MAXIMUMLIMIT}") : @balance += value
    end

    def touch_in(station)
      balance < FARE ? (raise StandardError.new "you have insufficient funds") : Journey.new(station) #
      @entry_station = station #
      ##store this new journey in the history.
    end

    def touch_out(station)
      ## look through history for that journey.
      ## if you have previous and complete journey then you create a new journey
      in_journey? #
      deduct #
      @history << { touch_in: @entry_station, touch_out: station } #
      @entry_station = nil
      # journey = Journey.new
    end

    def in_journey?
      @entry_station != nil #
    end

    private
    def deduct
      @balance -= FARE
    end
end
