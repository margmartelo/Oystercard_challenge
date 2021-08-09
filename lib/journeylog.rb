class JourneyLog

    attr_reader :entry_station, :journeys

    def initialize(journey_class)
        @journey_class = journey_class
        @journeys = []
    end

    def start(station)
        journey = @journey_class.new(station)
        @journeys.push(journey)
    end
end