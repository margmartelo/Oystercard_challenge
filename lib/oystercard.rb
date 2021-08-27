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
        # if @journeys.length != 0 && !(@journeys[-1].complete?)
        #   return true unless @journeys[-1].entry_station == nil 
        # end
        # return false
    end

    def touch_in(station)
        @journeyLog.start(station)
        # journey = Journey.new(station)
        # @journeys.push(journey)
        fail "Sorry, your card's balance isn't enough for travelling. Please top up." if @balance < MINIMUM_FARE
    end

    def touch_out(station)
        @journeyLog.finish(station)
        # current_journey = @journeys[-1]
        # current_journey.exit_station = station
        deduct(MINIMUM_FARE)
        # @entry_station = nil
    end
    
    private

    def deduct(amount)
        @balance -= amount
    end

end