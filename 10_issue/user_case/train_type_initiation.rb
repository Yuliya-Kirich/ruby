require_relative '../train'
require_relative '../logic_news/bot_list'
require_relative '../validate'
require_relative 'rout_initiation'
require_relative '../passenger_train'
require_relative '../passenger_carriage'

class TrainTypeInitiation < RoutInitiation
  @@train_type = nil
  @@cargo_train = nil
  @@passenger_train = nil
  @@passenger_carriage = nil
  def initialize
    super
    passenger_train = nil
  end
  def self.init
    a = BotList.new
    a.bot(:train_type_bot)
    @@train_type = gets.to_i
    a.bot(:train_number_bot)
    train_number = gets.chomp
    if @@train_type == 1
      passenger_train = PassengerTrain.new(train_number)
      @@passenger_train = passenger_train
      Train.find(train_number)
      puts "Пассажирский поезд под номером \"#{passenger_train.number}\" создан успешно."
      a.bot(:train_carriage_seats_bot)
      number_of_seats = gets.chomp.to_i
      @@passenger_carriage = PassengerCarriage.new(number_of_seats)
    elsif @@train_type == 2
      @@cargo_train = CargoTrain.new(train_number)
      Train.find(train_number)
      puts "Грузовой поезд под номером \"#{@@cargo_train.number}\" создан успешно."
      a.bot(:train_value_bot)
      overall_volume = gets.chomp.to_i
      @@cargo_carriage = CargoCarriage.new(overall_volume)
    else
      a.bot(:denger_type_train_bot)
    end
  end
end
