# frozen_string_literal: true
require_relative '../station'
require_relative '../route'
require_relative '../logic_news/bot_list'
require_relative 'train_type_initiation'

class RoutInitiation
  def self.init
    a = BotList.new
    a.bot :start_station_bot
    station = Station.new(gets.chomp)
    initial_station = station
    a.bot :end_station_bot
    station = Station.new(gets.chomp)
    end_station = station
    @@train_track = Route.new(initial_station, end_station)
    puts "Путь со станциями #{@@train_track.station_list}  создан успешно."

    remove = nil
    while remove != 0
      a.bot :add_station_bot
      remove = gets.to_i
      case remove
      when 1
        a.bot :station_name_bot
        station = Station.new(gets.chomp)
        intermediate_station = station
        @@train_track.add_intermediate_station(intermediate_station)
        puts "Путь со станциями #{@@train_track.station_list}  изменен успешно."

      when 2
        a.bot :remote_station_name_bot
        intermediate_station = gets.chomp
        @@train_track.station_list[1..-2].each_with_index do |x, key|
          if x.name.include?(intermediate_station.to_s)
            @@train_track.station_list.delete_at(key + 1)
            puts "Путь со станциями #{@@train_track.station_list}  изменен успешно."
          else
            a.bot :absence_station
          end
        end
      when 0
        break
      end
    end
  end
end
