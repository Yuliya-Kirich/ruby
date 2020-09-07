#Для пассажирских вагонов:
#Добавить атрибут общего кол-ва мест (задается при создании вагона)

require_relative 'train_type_initiation'
require_relative '../logic_news/bot_list'

class AddingWagons < TrainTypeInitiation

  def self.init
    a= BotList.new
  if @@train_type == 1
    @@passenger_train.add_carriages(@@passenger_carriage)
    puts "Вагон пассажирскому поезду добавлен #{@@passenger_train.carriages.count} "
  elsif @@train_type == 2
    @@cargo_train.add_carriages(@@cargo_carriage)
    puts "Вагон пассажирскому поезду добавлен #{@@cargo_train.carriages.count}"
  else
    a.denger_wrong_type_train
  end
  end
end