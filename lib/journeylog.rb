class JourneyLog

    attr_reader :entry_station, :journey

    def initialize(journey_class)
        @journey_class = journey_class
    end

    def start(station)
        @journey = @journey_class.new(station)
    end
end