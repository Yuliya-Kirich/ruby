require_relative 'train_type_initiation'
require_relative '../logic_news/bot_list'
require_relative '../station'
require_relative '../train'
require_relative '../route'

class TrainStationConnection< TrainTypeInitiation

  def self.init
    a = BotList.new
    remove = nil

    while remove != 0
      a.bot :viewing_station_list_bot
      remove = gets.to_i

      case remove
      when 1
        puts "Список станций #{@@train_track.show_station_list}"
      when 2
        @@train_track.show_station_list.each do |station|
          puts station
          if @@train_type == 1
            puts @@passenger_train.current_station.set_trains_each_station
          elsif @@train_type == 2
            puts @@cargo_train.current_station.set_trains_each_station
          else
            a.bot :error_bot
          end
        end
      end
    end
  end
end
