require 'oystercard'

describe Oystercard do

    let(:entry_station) { double :station }
    let(:exit_station) { double :station }
    let(:journeyLog) { double :journeyLog, current_journey: nil }
   
    it "should have an initial default balance of 0" do
      oyster = Oystercard.new(journeyLog)
      expect(oyster.balance).to eq 0
    end

    describe "#top_up" do
      it "can be topped up by a chosen amount of money" do 
        oyster = Oystercard.new(journeyLog)
        oyster.top_up(10)
        expect(oyster.balance).to eq 10
      end

      it "will raise an error if balance passes the maximum value allowed" do
        oyster = Oystercard.new(journeyLog)
        maximum_balance = Oystercard::MAXIMUM_BALANCE
        expect { oyster.top_up(95) }.to raise_error("Your card's balance can't exceed £#{maximum_balance}. Your current balance is £#{oyster.balance}.")
      end
    end

    describe "#in_jorney?" do
      it "will return if a passenger is currently travelling or not" do
        oyster = Oystercard.new(journeyLog)
        allow(journeyLog.current_journey).to receive(:complete?).and_return false
        expect(oyster.in_jorney?).to be false 
      end
    end

    describe "#touch_in" do
      context "when balance is equal or higher than minimum fare" do
        it "will change the state of the card for 'in use'" do
          oyster = Oystercard.new(journeyLog)
          oyster.top_up(10)
          allow(journeyLog).to receive(:start).with(entry_station)
          allow(journeyLog.current_journey).to receive(:complete?).and_return true
          oyster.touch_in(entry_station)
          expect(oyster.in_jorney?).to be true
        end
      end

      context "when balance is lower than minimum fare" do
        it "will raise an error" do
          oyster = Oystercard.new(journeyLog)
          allow(journeyLog).to receive(:start).with(entry_station)
          expect { oyster.touch_in(entry_station) }.to raise_error("Sorry, your card's balance isn't enough for travelling. Please top up.")
        end
      end
    end

    describe "#touch_out" do
        context "in journey" do 
    
              it "will change the state of the card for 'not in use'" do
                oyster = Oystercard.new(journeyLog)
                oyster.top_up(10)
                allow(journeyLog).to receive(:start).with(entry_station)
                oyster.touch_in(entry_station)
                  allow(journeyLog).to receive(:finish).with(exit_station)
                  oyster.touch_out(exit_station)
                  allow(journeyLog.current_journey).to receive(:complete?).and_return false
                  expect(oyster.in_jorney?).to be false
              end

              it "will reduce the balance by minimum fare" do
                  oyster = Oystercard.new(journeyLog)
                  oyster.top_up(10)
                  allow(journeyLog).to receive(:start).with(entry_station)
                  oyster.touch_in(entry_station)
                  allow(journeyLog).to receive(:finish).with(exit_station)
                  expect { oyster.touch_out(exit_station) }.to change{ oyster.balance }.by(-Oystercard::MINIMUM_FARE)
              end
        end
    end
end


