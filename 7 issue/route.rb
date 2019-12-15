# frozen_string_literal: true

# Класс Route (Маршрут):
# Имеет начальную и конечную станцию, а также список промежуточных станций.
# Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
# Может добавлять промежуточную станцию в список
# Может удалять промежуточную станцию из списка
# Может выводить список всех станций по-порядку от начальной до конечной

class Route
  attr_accessor :station_list

  def initialize(initial_station, end_station)
    @initial_station = initial_station
    @end_station = end_station
    @station_list = [initial_station, end_station]
    validate!
    valid?
  end

  def add_intermediate_station(intermediate_station)
    @station_list.insert(-2, intermediate_station)
    valid?
  end

  def delete_intermediate_station(intermediate_station)
    @station_list[1..-2].delete(intermediate_station)
  end

  def show_station_list
    @station_list.each { |station| puts station.name }
  end
  protected

  def valid?
    validate!
    puts "Маршрут создан успешно.#{station_list}"
  rescue
    puts "Маршрут с таким наименованием станций не может быть создан. Попробуйте позднее. #{station_list}"
    false
  end

  def validate!
    raise 'Наименование станции должно состоять из кириллические букв и цифр' if @initial_station.to_s !~ /[(а-я|ё|1-9)]/i
    raise 'Наименование станции должно состоять из кириллические букв и цифр' if @end_station.to_s !~ /[(а-я|ё|1-9)]/i
    raise 'Наименование станции не может отсутствовать' if @initial_station.nil? && @end_station.nil?
    if @intermediate_station != nil
    raise 'Наименование станции должно состоять из кириллические букв и цифр' if @intermediate_station.to_s !~ /[(а-я|ё|1-9)]/i
    end
  end
end
