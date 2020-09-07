require_relative '../station'
require_relative '../route'
require_relative '../logic_news/bot_list'
require_relative 'train_type_initiation'


class RoutInitiation

  def self.init
    a= BotList.new
  a.define_start_station
  station = Station.new(gets.chomp)
  initial_station = station
  a.define_end_station
  station = Station.new(gets.chomp)
  end_station = station
    @@train_track = Route.new(initial_station, end_station)
  puts "Путь со станциями #{@@train_track.station_list}  создан успешно."

  remove = nil
  while remove != 0
    a.define_add_station
    remove = gets.to_i
    case remove
    when 1
      a.define_station_name
      station = Station.new(gets.chomp)
      intermediate_station = station
      @@train_track.add_intermediate_station(intermediate_station)
      puts "Путь со станциями #{@@train_tracktrain_track.station_list}  изменен успешно."

    when 2
      a.define_remote_station
      station = Station.new(gets.chomp)
      intermediate_station = station

      if route.station_list[1..-2].include?(intermediate_station)
        @@train_track.delete_intermediate_station(intermediate_station)
        puts "Путь со станциями #{@@train_track.station_list}  изменен успешно."
      else
        a.define_absence_station
      end

    when 0
      break
    end
  end
  end
end