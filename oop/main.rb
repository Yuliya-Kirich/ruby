# frozen_string_literal: true

require_relative 'train.rb'
require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'cargo_carriage.rb'
require_relative 'cargo_train.rb'
require_relative 'passenger_carriage.rb'
require_relative 'passenger_train.rb'

class Main
  user_input = nil
  puts 'Привет, это программа-абстракция железной дороги'

  while user_input != 0
    puts 'Введите 1, если вы хотите создать станцию'
    puts 'Введите 2, если вы хотите создать поезд'
    puts 'Введите 3, если вы хотите создать маршрут и управлять станциями в нем (добавлять, удалять)'
    puts 'Введите 4, если вы хотите назначить маршрут поезду'
    puts 'Введите 5, если вы хотите добавлять вагоны к поезду'
    puts 'Введите 6, если вы хотите отцеплять вагоны от поезда'
    puts 'Введите 7, если вы хотите перемещать поезд по маршруту вперед и назад'
    puts 'Введите 8, если вы хотите просматривать список станций и список поездов на станции'
    puts 'Введите 0, если хотите закончить программу'

    user_input = gets.to_i

    if user_input == 1
      puts 'Введите название станции'
      station_name = gets.chomp
      station = Station.new(station_name)

      puts "Станция \"#{station.name} \" создана"

    elsif user_input == 2
      puts "Если вы хотите создать поезд, типа: 'пассажирский'- нажмите 1; грузовой - 2"
      train_type = gets.to_i

      puts 'Введите номер поезда'
      train_number = gets.chomp

      if train_type == 1
        passenger_train = PassengerTrain.new(train_number)
        puts "Пассажирский поезд под номером \"#{passenger_train.number} \"  создан успешно."
        passenger_carriage = PassengerCarriage.new

      elsif train_type == 2
        cargo_train = CargoTrain.new(train_number)
        cargo_carriage = CargoCarriage.new
        puts "Грузовой поезд под номером \"#{cargo_train.number} \"  создан успешно."

      else
        puts 'Выбор типа поезда должен быть только из перечня '

      end

    elsif user_input == 3
      puts 'Введите начальную станцию'
      station = Station.new(gets.chomp)
      initial_station = station

      puts 'Введите конечную станцию'
      station = Station.new(gets.chomp)
      end_station = station
      route = Route.new(initial_station, end_station)
      puts "Путь со станциями #{route.station_list}  создан успешно."

      remove = nil
      while remove != 0
        puts 'Хотите добавить станцию - нажмите 1; удалить станцию - нажмите 2; закончить процесс добавления - нажмите 0'
        remove = gets.to_i
        case remove
        when 1
          puts 'Введите наименование станции, которую хотите добавить'
          station = Station.new(gets.chomp)
          intermediate_station = station
          route.add_intermediate_station(intermediate_station)
          puts "Путь со станциями #{route.station_list}  изменен успешно."

        when 2
          puts 'Введите наименование станции, которую хотите удалить'
          station = Station.new(gets.chomp)
          intermediate_station = station

          if route.station_list[1..-2].include?(intermediate_station)
            route.delete_intermediate_station(intermediate_station)
            puts "Путь со станциями #{route.station_list}  изменен успешно."
          else
            puts 'Нет такой станции в составе пути'
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
        puts "Путь поезду назначен: текущая станция #{cargo_train.current_station.name} "
        cargo_train.add_route(route)
      else
        puts "Произошла ошибка"
      end

    elsif user_input == 5
      if train_type == 1
        passenger_train.add_carriages(passenger_carriage)
        puts "Вагон пассажирскому поезду добавлен #{passenger_carriage.passenger_train_carriages.count} "
      elsif train_type == 2
        cargo_train.add_carriages(cargo_carriage)
        puts "Вагон пассажирскому поезду добавлен #{cargo_carriage.cargo_train_carriages.count}"
      else
        puts 'Нельзя данному типу поезда добавить вагоны'
      end

    elsif user_input == 6
      if train_type == 1
        passenger_carriage.passenger_train_carriages.clear if passenger_carriage.passenger_train_carriages.length == 1
        passenger_train.remove_carriage(passenger_carriage)
        puts "Вагоны пассажирскому поезду удалены #{passenger_carriage.passenger_train_carriages.count} "
      elsif train_type == 2
        cargo_carriage.cargo_train_carriages.clear if cargo_carriage.cargo_train_carriages.length == 1
        cargo_train.remove_carriage(cargo_carriage)
        puts "Вагоны грузовому поезду удалены #{cargo_carriage.cargo_train_carriages.count}"
      else
        puts 'Нельзя данному типу поезда удалить вагоны'
      end

    elsif user_input == 7
      remove = nil

      while remove != 0
        puts 'Если хотите перемещать поезд по маршруту вперед - нажмите 1; назад - нажмите 2; закончить процесс - нажмите 0'
        remove = gets.to_i

        case remove
        when 1
          if train_type == 1
            passenger_train.go_forward
            puts "текущая станция #{passenger_train.current_station.name}"
          elsif train_type == 2
            cargo_train.go_forward
            puts "текущая станция #{cargo_train.current_station.name}"
          else 'Произошла ошибка'
            end
        when 2
          if train_type == 1
            passenger_train.transit_station_back
            puts "текущая станция #{passenger_train.current_station.name}"
          elsif train_type == 2
            cargo_train.transit_station_back
            puts "текущая станция #{cargo_train.current_station.name}"
          else 'Произошла ошибка'
          end
        end
        end

    elsif user_input == 8
      remove = nil

      while remove != 0
        puts 'Если хотите просмотреть список станций - нажмите 1; список поездов на станции - нажмите 2; закончить процесс - нажмите 0'
        remove = gets.to_i

        case remove
        when 1

          puts "Список станций #{route.show_station_list}"

        when 2
          if train_type == 1
            puts "Список поездов на станции #{train.current_station.show_trains}"
          elsif train_type == 2
          else
            puts 'Произошла ошибка'
          end
        end
      end

    elsif user_input == 0
      puts 'Программа завершена'

    else
      puts 'Введите значение из списка'
      puts 'ok'
    end

  end
end
