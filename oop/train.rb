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
    @route = 'не назначен'
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
    located_at_first_station
    @current_station = 0
  end

  def located_at_first_station
    @route.station_list[0].add_train(self)
  end

  def current_station
    @route.station_list[@current_station]
  end

  def next_station
    @route.station_list[@current_station + 1]
  end

  def previous_station
    if @current_station == 0 || @current_station == nil?
      # puts 'Нет предыдущей станции'
    else @route.station_list[@current_station - 1]
    end
  end

  def go_forward
    if next_station.nil?
      # puts 'Конечная станция'
    else
      @route.station_list[@current_station].delete_train(self)
      @current_station += 1
      @route.station_list[@current_station].add_train(self)
    end
  end

  def transit_station_back
    if previous_station.nil?
      puts 'Конечная станция'
    else
      @route.station_list[@current_station].delete_train(self)
      @current_station -= 1
      @route.station_list[@current_station].add_train(self)
    end
  end

  def show_stations_train
    if @current_station.nil?
      puts 'Нет текущей станции'
    else
      puts "Текущая станция: #{@route.station_list[@current_station].name}"
    end
    if !previous_station.nil?
      puts 'Нет предыдущей станции'
    else
      puts "Предыдущая станция: #{@route.station_list[@current_station - 1].name}"
    end
    if !next_station.nil?
      puts 'Нет следующей станции'
    else
      puts "Следующая станция: #{@route.station_list[@current_station + 1].name}"
    end
  end
end
