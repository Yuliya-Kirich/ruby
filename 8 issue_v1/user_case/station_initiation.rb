require_relative '../station'
require_relative '../logic_news/bot_list'

class StationInitiation
  def self.init
    a = BotList.new
    user_choise = nil
    a.define_station_name
    station = Station.new(gets.chomp)
    Station.all

  end
end
