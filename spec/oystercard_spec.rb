require 'oystercard'

describe Oystercard do
    it "should have an initial default balance of 0" do
      expect(subject.balance).to eq 0
    end

    describe "#top_up" do
      it "can be topped up by a chosen amount of money" do 
        subject.top_up(10)
        expect(subject.balance).to eq 10
      end

      it "will raise an error if balance passes the maximum value allowed" do
        maximum_balance = Oystercard::MAXIMUM_BALANCE
        expect { subject.top_up(95) }.to raise_error("Your card's balance can't exceed £#{maximum_balance}. Your current balance is £#{subject.balance}.")
      end
    end

end
