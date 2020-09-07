require_relative 'train_type_initiation'
require_relative '../logic_news/bot_list'

class UncoupledWagons< TrainTypeInitiation
  def self.init
    a= BotList.new
  if @@train_type == 1
    @@passenger_train.remove_carriage
    puts "Вагоны пассажирскому поезду удалены #{@@passenger_train.carriages.count} "
  elsif @@train_type == 2
    @@cargo_train.remove_carriage
    puts "Вагоны грузовому поезду удалены #{@@cargo_train.carriages.count}"
  else
    a.denger_wrong_type_train_second
  end
  end
end