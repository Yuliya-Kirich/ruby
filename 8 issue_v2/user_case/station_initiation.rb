# frozen_string_literal: true

require_relative '../station'
require_relative '../logic_news/bot_list'

class StationInitiation
  def self.init
    a = BotList.new
    user_choise = nil
    a.define_station_name
    station = Station.new(gets.chomp)
    Station.all
    puts "Станция \"#{station.name}\" создана"
    a.define_stations_train_list
    user_choise = gets.to_i
    if user_choise == 1
      station.set_trains_each_station
    elsif
      a.end_current_operation
    else
      a.denger_limiting_input
    end
  end

end
