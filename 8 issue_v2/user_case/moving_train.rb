require_relative 'train_type_initiation'
require_relative '../logic_news/bot_list'

class MovingTrain < TrainTypeInitiation
  def self.init
    a= BotList.new
  remove = nil

  while remove != 0
    a.define_moving_train
    remove = gets.to_i

     station_selection = StationSelection.new
    #SelectionModel.three_solutions


    case remove
    when 1
      if @@train_type == 1
        station_selection.station_selection(@@passenger_train)
      elsif @@train_type == 2
        station_selection.station_selection(@@cargo_train)
      else a.define_error
      end
    when 2
      if @@train_type == 1
        station_selection.selection_transit(@@passenger_train)
      elsif @@train_type == 2
        station_selection.selection_transit(@@cargo_train)
      else a.define_error
      end
    end
  end
  end
end