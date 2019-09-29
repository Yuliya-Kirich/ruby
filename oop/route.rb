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
  end

  def add_intermediate_station(intermediate_station)
    @station_list.insert(-2, intermediate_station)
  end

  def delete_intermediate_station(intermediate_station)
    @station_list[1..-2].delete(intermediate_station)
  end

  def show_station_list
    @station_list.each { |station| puts station.name }
  end
end
