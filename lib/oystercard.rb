class Oystercard

    attr_reader :balance
    MAXIMUM_BALANCE = 90
    
    def initialize
        @balance = 0
        @in_jorney = false
    end

    def top_up(amount)
        fail "Your card's balance can't exceed £#{MAXIMUM_BALANCE}. Your current balance is £#{@balance}." if @balance + amount > MAXIMUM_BALANCE
        @balance += amount
    end

    def deduct(amount)
        @balance -= amount
    end

    def in_jorney?
        @in_jorney
    end

    def touch_in
        @in_jorney = true
    end

    def touch_out
        @in_jorney = false
    end

end