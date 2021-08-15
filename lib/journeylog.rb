class JourneyLog

    attr_reader :entry_station, :journeys

    def initialize(journey_class)
        @journey_class = journey_class
        @journeys = []
        @current_journey = nil
    end

    def start(station)
        journey = @journey_class.new(station)
        @journeys.push(journey)
        @current_journey = @journeys[-1]
    end
    
    private
    def current_journey
        @current_journey = @journey_class.new(station) unless @current_journey != nil
        @current_journey
    end
end