# frozen_string_literal: true
# При создании вагона указывать кол-во мест или общий объем, в зависимости от типа вагона
# Выводить список вагонов у поезда (в указанном выше формате), используя созданные методы
# Выводить список поездов на станции (в указанном выше формате), используя  созданные методы
# Занимать место или объем в вагоне

require_relative 'user_case/navigator.rb'
require_relative 'train.rb'
require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'cargo_carriage.rb'
require_relative 'cargo_train.rb'
require_relative 'passenger_carriage.rb'
require_relative 'passenger_train.rb'
require_relative 'manufacture_name.rb'
require_relative 'station_selection.rb'
require_relative 'instance_counter.rb'
require_relative 'passenger_boarding.rb'
require_relative 'logic_news/bot_list'
require_relative 'user_case/station_initiation'
require_relative 'user_case/train_type_initiation'
require_relative 'user_case/rout_initiation'
require_relative 'user_case/train_route_initiation'
require_relative 'user_case/adding_wagons'
require_relative 'user_case/uncoupled_wagons'
require_relative 'user_case/moving_train'
require_relative 'user_case/train_station_connection'
require_relative 'user_case/navigator'
require_relative 'user_case/manager'


class Main < Navigator
  Manager.new
end
