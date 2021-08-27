require 'journeylog'

describe JourneyLog do
    let(:journey){ double :journey, exit_station: nil }
    let(:entry_station){ double :entry_station }
    let(:exit_station){ double :exit_station }
    let(:journey_class){ double :journey_class }
    
    describe '#start' do
        it 'will start a journey' do
            expect(journey_class).to receive(:new).with(entry_station)
            journeyLog = JourneyLog.new(journey_class)
            journeyLog.start(entry_station)
        end

        it 'register the current journey' do
            allow(journey_class).to receive(:new).with(entry_station).and_return journey
            journeyLog = JourneyLog.new(journey_class)
            journeyLog.start(entry_station)
            expect(journeyLog.current_journey).to eq journey
        end
    end
#finish should add an exit station to the current_journey
    describe '#finish' do
        it 'will add an exit station to a journey' do
            allow(journey_class).to receive(:new).with(entry_station).and_return journey
            journeyLog = JourneyLog.new(journey_class)
            journeyLog.start(entry_station)
            expect(journeyLog).to receive(:finish).with(exit_station)
            journeyLog.finish(exit_station)
        end
    end
  
end