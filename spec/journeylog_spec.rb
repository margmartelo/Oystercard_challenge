require 'journeylog'

describe JourneyLog do
    let(:journey){ double :journey }
    let(:station){ double :station }
    let(:journey_class){ double :journey_class }
    
    describe '#start' do
        it 'will start a journey' do
            expect(journey_class).to receive(:new).with(station)
            journeyLog = JourneyLog.new(journey_class)
            journeyLog.start(station)
        end

        it 'records a journey' do
            allow(journey_class).to receive(:new).with(station).and_return journey
            journeyLog = JourneyLog.new(journey_class)
            journeyLog.start(station)
            expect(journeyLog.journeys).to include journey
        end
    end

  
end