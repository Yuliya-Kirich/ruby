require_relative 'train_type_initiation'
require_relative '../logic_news/bot_list'
require_relative '../station'
require_relative '../train'
require_relative '../route'

class TrainStationConnection< TrainTypeInitiation

  def self.init
    a= BotList.new
  remove = nil

  while remove != 0
    a.define_viewing_station_list
    remove = gets.to_i

    case remove
    when 1

      puts "Список станций #{  @@train_track.show_station_list}"

    when 2
      @@train_track.show_station_list.each do |station| puts station
      if @@train_type == 1
        puts  @@passenger_train.current_station.show_trains

        #puts "Список поездов на станции #{Train.current_station.show_trains}"
      elsif @@train_type == 2
        station.add_train_in_station
      else
        a.define_error
      end
      end
    end
  end
  end
end