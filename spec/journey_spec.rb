require 'journey'

describe Journey do

    it "knows if a journey is not complete" do
      expect(subject.complete?).to be false
    end

    it "knows if a journey is complete" do
      @journey = Journey.new("Liverpool Street")
      @journey.finish("Walthamstow Central")
      expect(@journey.complete?).to be true
    end

    it "returns itself when exiting a journey" do
      @journey = Journey.new("Liverpool Street")
      expect(@journey.finish("Walthamstow Central")).to eq @journey
    end

    context 'if not given an entry station' do
      it "will default to a nil entry station" do
          expect(subject.entry_station).to eq nil
      end
    end

    context 'given an entry station' do
      before do 
          @journey = Journey.new("Liverpool Street")
      end        
          it "will be created with an entry station" do
              expect(@journey.entry_station).to eq "Liverpool Street"
          end
        
    end

    describe '#fare' do

      it "has a penalty fare by default" do
        expect(subject.fare).to eq Journey::PENALTY_FARE
      end

      it "will charge a penalty fare if journey's incomplete" do
        @journey = Journey.new("Liverpool Street")
        @journey.finish
        expect(@journey.fare).to eq Journey::PENALTY_FARE
      end

      it "will charge £1 per complete journey" do
        @journey = Journey.new("Liverpool Street")
        @journey.finish("Walthamstow Central")
        expect(@journey.fare).to eq 1
      end
    end
end

