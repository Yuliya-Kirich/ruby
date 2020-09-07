require_relative '../passenger_train'
require_relative '../cargo_train'
require_relative 'train_type_initiation'
require_relative '../train'
require_relative '../route'
require_relative 'rout_initiation'

class TrainRouteInitiation < TrainTypeInitiation


  def initialize
    super
  end

  def self.init


  if @@train_type == 1

    @@passenger_train.add_route(@@train_track)
    puts "Путь поезду назначен: текущая станция #{@@passenger_train.current_station.name} "
  elsif @@train_type == 2

    @@cargo_train.add_route(route)
    puts "Путь поезду назначен: текущая станция #{@@cargo_train.current_station.name} "
  else
    a = BotList.new
    a.define_error
  end
  end

end