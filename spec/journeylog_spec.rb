require 'journeylog'

describe JourneyLog do
#     describe "#start" do
#         it "will start with an entry station" do
#             expect(journeylog.start('Liverasdfa')).to 
#         end
#     end    
# end


    # let(:journey){ double :journey } 
    # let(:station){ double :station }
    # let(:journey_class){double :journey_class, new: station}
    # subject {described_class.new(journey_class: journey_class)}

    describe '#start' do
        it 'it will start a journey' do
            station = double(:station)
            journey_class = double(:journey_class)
            expect(journey_class).to receive(:new).with(station)
            
            journeyLog = JourneyLog.new(journey_class)
            journeyLog.start(station)
            # expect(journey_class).to receive(:new).with(entry_station: station)
            # subject.start(station)
        end

    end
end