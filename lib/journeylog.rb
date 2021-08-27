class JourneyLog

    attr_reader :entry_station, :exit_station, :current_journey

    def initialize(journey_class)
        @journey_class = journey_class
        @current_journey = nil
    end

    def start(entry_station)
        _current_journey(entry_station)
    end

    def finish(exit_station)
        @current_journey.finish(exit_station)
    end
    
    private
    def _current_journey(station)
        @current_journey = @journey_class.new(station) unless @current_journey != nil
        @current_journey
    end
end