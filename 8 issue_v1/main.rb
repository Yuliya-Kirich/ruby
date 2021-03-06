# frozen_string_literal: true

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


# noinspection ALL
class Main
  user_input = nil
  a= BotList.new
  a.begin
  while user_input != 0
    a.bot
    user_input = gets.to_i
    if user_input == 1
      StationInitiation.init

    elsif user_input == 2
      TrainTypeInitiation.init

    elsif user_input == 3
      RoutInitiation.init

    elsif user_input == 4
      TrainRouteInitiation.init

    elsif user_input == 5
      AddingWagons.init

    elsif user_input == 6
      UncoupledWagons.init

    elsif user_input == 7
      MovingTrain.init

    elsif user_input == 8
      TrainStationConnection.init

    elsif user_input == 0
      a.define_end

    else
      a.denger_limiting_input
    end

  end
end
