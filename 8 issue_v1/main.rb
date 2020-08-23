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
require_relative 'logic_news/users_train_type_input'
require_relative 'logic_news/users_train_number_input'
# noinspection ALL
class Main
  user_input = nil
  a= BotList.new
  a.begin
  while user_input != 0
    a.bot
    user_input = gets.to_i
    if user_input == 1
      a= BotList.new
      a.define_station_name
      #puts 'Введите название станции'
      station_name = gets.chomp
      station = Station.new(station_name)
      # def new(*args)
      #  print "Создается новый #{self.name}\n"
      #  oldNew(*args)
      # end
      Station.all
      puts "Станция \"#{station.name}\" создана"

    elsif user_input == 2
      a.define_train_type

      train_type = UsersTrainTypeInput.new(gets.to_i)
      a.define_train_number
      train_number = UsersTrainNumberInput.new(gets.chomp)

      if train_type == 1
        passenger_train = PassengerTrain.new(train_number)
        Train.find(train_number)
        puts "Пассажирский поезд под номером \"#{passenger_train.number}\" создан успешно."
        a.define_carriage_seats
        number_of_seats = gets.chomp.to_i
        passenger_carriage = PassengerCarriage.new(number_of_seats)

      elsif train_type == 2
        cargo_train = CargoTrain.new(train_number)
        Train.find(train_number)
        puts "Грузовой поезд под номером \"#{cargo_train.number}\" создан успешно."
        a.define_train_value
        overall_volume = gets.chomp.to_i
        cargo_carriage = CargoCarriage.new(overall_volume)
      else
        a.denger_type_train
      end

    elsif user_input == 3
      a.define_start_station
      station = Station.new(gets.chomp)
      initial_station = station

      a.define_end_station
      station = Station.new(gets.chomp)
      station.take_picture
      station.record_video
      end_station = station
      route = Route.new(initial_station, end_station)
      puts "Путь со станциями #{route.station_list}  создан успешно."

      remove = nil
      while remove != 0
        a.define_add_station
        remove = gets.to_i
        case remove
        when 1
          a.define_station_name
          station = Station.new(gets.chomp)
          intermediate_station = station
          route.add_intermediate_station(intermediate_station)
          puts "Путь со станциями #{route.station_list}  изменен успешно."

        when 2
          a.define_remote_station
          station = Station.new(gets.chomp)
          intermediate_station = station

          if route.station_list[1..-2].include?(intermediate_station)
            route.delete_intermediate_station(intermediate_station)
            puts "Путь со станциями #{route.station_list}  изменен успешно."
          else
            a.define_absence_station
          end

        when 0
          break
           end
        end

    elsif user_input == 4

      if train_type == 1
        passenger_train.add_route(route)
        puts "Путь поезду назначен: текущая станция #{passenger_train.current_station.name} "
      elsif train_type == 2
        cargo_train.add_route(route)
        puts "Путь поезду назначен: текущая станция #{cargo_train.current_station.name} "
      else
        a.define_error
      end

    elsif user_input == 5
      if train_type == 1
        passenger_train.add_carriages(passenger_carriage)
        puts "Вагон пассажирскому поезду добавлен #{passenger_train.carriages.count} "
      elsif train_type == 2
        cargo_train.add_carriages(cargo_carriage)
        puts "Вагон пассажирскому поезду добавлен #{cargo_train.carriages.count}"
      else
        a.denger_wrong_type_train
      end

    elsif user_input == 6
      if train_type == 1
        passenger_train.remove_carriage
        puts "Вагоны пассажирскому поезду удалены #{passenger_train.carriages.count} "
      elsif train_type == 2
        cargo_train.remove_carriage
        puts "Вагоны грузовому поезду удалены #{cargo_train.carriages.count}"
      else
        a.denger_wrong_type_train_second
      end

    elsif user_input == 7
      remove = nil

      while remove != 0
        a.define_moving_train
        remove = gets.to_i

        station_selection = StationSelection.new
        case remove
        when 1
          if train_type == 1
            station_selection.station_selection(passenger_train)
          elsif train_type == 2
            station_selection.station_selection(cargo_train)
          else a.define_error
            end
        when 2
          if train_type == 1
            station_selection.selection_transit(passenger_train)
          elsif train_type == 2
            station_selection.selection_transit(cargo_train)
          else a.define_error
          end
        end
      end

    elsif user_input == 8
      remove = nil

      while remove != 0
        a.define_viewing_station_list
        remove = gets.to_i

        case remove
        when 1

          puts "Список станций #{route.show_station_list}"

        when 2
          if train_type == 1
            puts "Список поездов на станции #{Train.current_station.show_trains}"
          elsif train_type == 2
            station.add_train_in_station
          else
            a.define_error
          end
        end
      end

    elsif user_input == 0
      a.define_end

    else
      a.denger_limiting_input
    end

  end
end
