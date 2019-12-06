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
  require_relative 'manufacture_name.rb'
  require_relative 'instance_counter.rb'

  include ManufactureName
  include InstanceCounter

  attr_accessor :speed, :number_of_cars, :carriages
  attr_reader :route, :number
  @@trains = {}


  class<<self
    attr_accessor :trains

    def find(number)
      @@trains.each do |v|
        @@trains[number] if v.include?(number)
      end
    end

  end


  def initialize(number)
    @number = number
    @speed = 0
    @route = nil
    @current_station = nil
    @carriages = []
    @@trains[number] = self
  #  self.register_instance
    self.class.instance_methods
  end

  def up_speed(increase_speed)
    @speed += increase_speed
  end

  def slow_down(lower_speed)
    @speed -= lower_speed
    @speed = 0 if @speed < 0
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

  def add_carriages(carriage)
    if @speed.zero?
      @carriages << carriage
    else
      puts 'Дождитесь, когда поезд остановится'
    end
  end

  def remove_carriage
    @carriages.clear if @carriages.length == 1
    @carriages.delete_at(1)
  end
end
