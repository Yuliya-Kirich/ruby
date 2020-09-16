# frozen_string_literal: true

class StationSelection

  def station_selection(class_name)
    class_name.go_forward
    puts "текущая станция #{class_name.current_station.name}"
  end

  def selection_transit(class_name)
    class_name.transit_station_back
    puts "текущая станция #{class_name.current_station.name}"
  end
end
