class Oystercard

    attr_reader :balance
    attr_reader :entry_station
    MAXIMUM_BALANCE = 90
    MINIMUM_FARE = 1
    
    def initialize
        @balance = 0
    end

    def top_up(amount)
        fail "Your card's balance can't exceed £#{MAXIMUM_BALANCE}. Your current balance is £#{@balance}." if @balance + amount > MAXIMUM_BALANCE
        @balance += amount
    end

    def in_jorney?
        @entry_station != nil 
    end

    def touch_in(station)
        @entry_station = station
        fail "Sorry, your card's balance isn't enough for travelling. Please top up." if @balance < MINIMUM_FARE
        @in_jorney = true
    end

    def touch_out
        deduct(MINIMUM_FARE)
        @entry_station = nil
    end
    
    private

    def deduct(amount)
        @balance -= amount
    end

end