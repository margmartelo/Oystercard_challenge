class Journey

    attr_accessor :entry_station, :exit_station

  PENALTY_FARE = 6

  def initialize(entry_station=nil)
    @entry_station = entry_station
    @exit_station = nil
  end


  def complete?
    !(!entry_station || !exit_station) 
  end
 
  def fare
    if complete? == false
      PENALTY_FARE
    else
      fare = 1
    end
  end

  def finish(exit_station=nil)
    @exit_station = exit_station
    self
  end

end

