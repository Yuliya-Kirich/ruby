require_relative '../logic_news/bot_list'

class Navigator
  def self.navigator(user_input)
    a = BotList.new
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
