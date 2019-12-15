require_relative 'manufacture_name.rb'


class Train

  include ManufactureName
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

     valid?
    @speed = 0
    @route = nil
    @current_station = nil
    @carriages = []
    @@trains[number] = self
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


  protected

  def valid?
    validate!
    puts "Пассажирский поезд создан успешно."
  rescue
    puts 'Поезд с таким номером не может быть создан. Попробуйте позднее.'
    false
  end

  def validate!
    raise 'Номер должен состоять из кириллические букв и цифр' if number.to_s !~ /^[а-я|1-9]{3}-?[а-я|1-9]{2}$/i
    raise 'Номер не может быть пустым' if number.nil?
  end

end
