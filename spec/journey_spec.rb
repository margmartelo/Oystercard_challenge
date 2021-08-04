require 'journey'

describe Journey do
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }

  it "knows if a journey is not complete" do
    expect(subject.complete?).to be false
  end

  context 'if not given an entry station' do
    it "will default to a nil entry station" do
        expect(subject.entry_station).to eq nil
    end
  end

  before do 
    @journey = Journey.new(entry_station)
  end        

    context 'given an entry station' do
      
      it "will be created with an entry station" do
          expect(@journey.entry_station).to eq entry_station
      end

      it "knows if a journey is complete" do
        @journey.finish(exit_station)
        expect(@journey.complete?).to be true
      end

      it "returns itself when exiting a journey" do
        expect(@journey.finish(exit_station)).to eq @journey
      end
    end

      describe '#fare' do

        it "has a penalty fare by default" do
          expect(subject.fare).to eq Journey::PENALTY_FARE
        end

        it "will charge a penalty fare if journey's incomplete" do
          @journey.finish
          expect(@journey.fare).to eq Journey::PENALTY_FARE
        end

        it "will charge £1 per complete journey" do
          @journey.finish(exit_station)
          expect(@journey.fare).to eq 1
        end
    end
end

