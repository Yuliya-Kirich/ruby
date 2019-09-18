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
  attr_accessor :speed, :number_of_cars, :current_station, :previous_station, :next_station
  attr_reader :route, :type, :number

  def initialize(number, type, number_of_cars)
    @number = number
    @type = type
    @number_of_cars = number_of_cars
    @speed = 0
    @way = []
    @current_station = 'no'
    @previous_station = 'no'
    @next_station = 'no'
  end

  def up_speed(increase_speed)
    @speed += increase_speed
  end

  def show_speed
    puts @speed
  end

  def slow_down(lower_speed)
    @speed -= lower_speed unless @speed <= 0
  end

  def show_sum_of_cars
    puts @number_of_cars
  end

  def add_sum_cars
    @number_of_cars += 1 if @speed <= 0
  end

  def take_away_cars
    @number_of_cars -= 1 if (@number_of_cars > 0) & (@speed <= 0)
  end

  def add_route(route)
    @way = route.station_list
    @current_station = route.show_station_list[0]
  end

  def transit_station_forward(route)
    route.station_list.each.with_index(1) do |val, index|
      unless @current_station != val
        @current_station = route.show_station_list[index]
        @previous_station = route.show_station_list[index - 1] if index > 1
        @next_station = route.show_station_list[index + 1]
        break
        # puts "#{val} , #{index}, #{@current_station}"
      end
    end
    puts @current_station
  end

  def transit_station_back(route)
    route.station_list.each.with_index(0) do |val, index|
      (1..-1).each do |index|
        next if @current_station != val

        @current_station = route.show_station_list[index - 1]
        break
        # puts "#{val} , #{index}, #{@current_station}"
      end
    end
    puts @current_station
  end

  def show_stations_train
    puts "current station is #{@current_station}, previous station #{@previous_station}, next_station #{@next_station}"
  end
  end
