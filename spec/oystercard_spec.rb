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

    describe "#in_jorney?" do
      it "will return if a passenger is currently travelling or not" do
        expect(subject.in_jorney?).to be false 
      end
    end

    describe "#touch_in" do
      let(:station) { double :station }
      context "when balance is equal or higher than minimum fare" do
        it "will change the state of the card for 'in use'" do
          subject.top_up(10)
          subject.touch_in(station)
          expect(subject.in_jorney?).to be true
        end

        it "will save the entry station" do
          subject.top_up(10)
          subject.touch_in("Liverpool Street")
          expect(subject.entry_station).to eq "Liverpool Street"
        end

      end

      context "when balance is lower than minimum fare" do
        it "will raise an error" do
          expect { subject.touch_in(station) }.to raise_error("Sorry, your card's balance isn't enough for travelling. Please top up.")
        end
      end
    end

    describe "#touch_out" do
      let(:station) { double :station }
      it "will change the state of the card for 'not in use'" do
        subject.top_up(10)
        subject.touch_in(station)
        subject.touch_out(station)
        expect(subject.in_jorney?).to be false
      end

      it "will reduce the balance by minimum fare" do
        subject.top_up(10)
        subject.touch_in(station)
        expect { subject.touch_out(station) }.to change{ subject.balance }.by(-Oystercard::MINIMUM_FARE)
      end

      it "will save the exit station" do
        subject.top_up(10)
        subject.touch_in(station)
        subject.touch_out("Piccadilly Circus")
        expect(subject.exit_station).to eq "Piccadilly Circus"
      end
    end

end
