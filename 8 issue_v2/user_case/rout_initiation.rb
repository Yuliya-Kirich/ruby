# frozen_string_literal: true

require_relative '../station'
require_relative '../route'
require_relative '../logic_news/bot_list'
require_relative 'train_type_initiation'

class RoutInitiation
  def self.init
    a = BotList.new
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
        puts "Путь со станциями #{@@train_track.station_list}  изменен успешно."

      when 2
        a.define_remote_station
        intermediate_station = gets.chomp
        @@train_track.station_list[1..-2].each_with_index do |x, key|
          if x.name.include?(intermediate_station.to_s)
            @@train_track.station_list.delete_at(key + 1)
            puts "Путь со станциями #{@@train_track.station_list}  изменен успешно."
          else
            a.define_absence_station
          end
        end
      when 0
        break
      end
    end
  end
end
