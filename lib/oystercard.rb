require_relative './journey'

class Oystercard

    attr_reader :balance, :entry_station, :exit_station

    MAXIMUM_BALANCE = 90
    MINIMUM_FARE = 1
    
    def initialize(journeyLog)
        @journeyLog = journeyLog
        @balance = 0
    end

    def top_up(amount)
        fail "Your card's balance can't exceed £#{MAXIMUM_BALANCE}. Your current balance is £#{@balance}." if @balance + amount > MAXIMUM_BALANCE
        @balance += amount
    end

    def in_jorney?
        @journeyLog.current_journey.complete?
       
    end

    def touch_in(station)
        @journeyLog.start(station)
        fail "Sorry, your card's balance isn't enough for travelling. Please top up." if @balance < MINIMUM_FARE
    end

    def touch_out(station)
        @journeyLog.finish(station)
        deduct(MINIMUM_FARE)
    end
    
    private

    def deduct(amount)
        @balance -= amount
    end

end