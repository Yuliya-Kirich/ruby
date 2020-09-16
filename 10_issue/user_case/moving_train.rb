require_relative 'train_type_initiation'
require_relative '../logic_news/bot_list'

class MovingTrain < TrainTypeInitiation
  def self.init
    a = BotList.new
    remove = nil

    while remove != 0
      a.bot(:moving_train_bot)
      remove = gets.to_i

      station_selection = StationSelection.new

      case remove
      when 1
        if @@train_type == 1
          station_selection.station_selection(@@passenger_train)
        elsif @@train_type == 2
          station_selection.station_selection(@@cargo_train)
        else a.bot(:error_bot)
        end
      when 2
        if @@train_type == 1
          station_selection.selection_transit(@@passenger_train)
        elsif @@train_type == 2
          station_selection.selection_transit(@@cargo_train)
        else a.bot(:error_bot)
        end
      end
    end
  end
end
