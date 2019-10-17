class CargoTrain < Train

  def initialize(number)
    super(number)
  end

  def add_route(route)
    super
  end

  def current_station
    super
  end

  def next_station
    super
  end

  def previous_station
    super
  end

  def go_forward
    super
  end

  def transit_station_back
    super
  end

  def add_carriages(cargo_carriage)
    cargo_carriage.cargo_train_carriages << self
  end

  def remove_carriage(cargo_carriage)
    cargo_carriage.cargo_train_carriages.delete_at(1)
  end

end


