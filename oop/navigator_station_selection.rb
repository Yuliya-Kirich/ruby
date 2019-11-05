class NavigatorStationSelection
  def navigator(passenger_train, cargo_train)
    station_selection = StationSelection.new
    if @train_type == 1
      station_selection.station_selection(passenger_train)
    elsif @train_type == 2
      station_selection.station_selection(cargo_train)
    else 'Произошла ошибка'
    end
  end
end