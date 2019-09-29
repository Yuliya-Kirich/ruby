# frozen_string_literal: true

# Класс Train (Поезд):
# Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные указываются при создании экземпляра класса
# Может набирать скорость
# Может возвращать текущую скорость
# Может тормозить (сбрасывать скорость до нуля)
# Может возвращать количество вагонов
# Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов).
# Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
# Может принимать маршрут следования (объект класса Route).
# При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
# Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз.
# Возвращать предыдущую станцию, текущую, следующую, на основе маршрута

class Train
  attr_accessor :speed, :number_of_cars
  attr_reader :route, :type, :number

  def initialize(number, type, number_of_cars)
    @number = number
    @type = type
    @number_of_cars = number_of_cars
    @speed = 0
    @route = nil
    @current_station = nil
  end

  def up_speed(increase_speed)
    @speed += increase_speed
  end

  def slow_down(lower_speed)
    @speed -= lower_speed
    @speed = 0 if @speed < 0
  end

  def add_add_carriage
    @number_of_cars += 1 if @speed.zero?
  end

  def remove_carriage
    @number_of_cars -= 1 if (@number_of_cars > 0) && @speed.zero?
  end

  def add_route(route)
    @route = route
    @current_station = 0
    current_station.add_train(self)
  end

  def current_station
    return if route.nil?
    @route.station_list[@current_station]
  end

  def next_station
    return if route.nil?
    @route.station_list[@current_station + 1]
  end

  def previous_station
    return if route.nil? || @current_station == 0
    @route.station_list[@current_station - 1]
  end

  def go_forward
    return if next_station.nil?

    current_station.delete_train(self)
    @current_station += 1
    current_station.add_train(self)
  end

  def transit_station_back
    return if previous_station.nil?

    current_station.delete_train(self)
    @current_station -= 1
    current_station.add_train(self)
  end
end
