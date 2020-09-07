# frozen_string_literal: true

# Класс Station (Станция):
# Имеет название, которое указывается при ее создании
# Может принимать поезда (по одному за раз)
# Может возвращать список всех поездов на станции, находящиеся в текущий момент
# Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых , пассажирских
# Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
require_relative 'instance_counter.rb'
require_relative 'validate.rb'
require_relative 'user_case/train_type_initiation'

class Station
  include InstanceCounter
  include Validate

  attr_reader :name, :trains_at_station
  @@all_station = {}

  class << self
    def all
      @@all_station
    end
  end

  def initialize(name)
    @name = name
    @trains_at_station = []
    @@all_station[name] = self
    self.class.instance_methods
    self.register_instance
    validate!
    #valid?

  end

  def add_train(train)
    #@trains_at_station << train
    key = (@trains_at_station.length + 1)
    @trains_at_station[key] = train
    # add_train_in_station {|value| puts "Номер поезда - #{value.number},тип - #{value.type}, кол-во вагонов - #{value.carriages}" }
    add_train_in_station
  end

  def add_train_in_station(&block)
    puts @@all_station
    @@all_station.each do |key, station|
      #  puts "все параметры класса #{station.methods} наименование станции -'#{key}'"
      #  puts "поезда на станции #{station.trains_at_station}"
      station.trains_at_station.find_all do| obj |
        # puts "xc #{obj[1]}"
        # each obj {|tool| puts tool
        # puts tool.number
        # puts tool.type}
       puts obj
        #puts obj{1}.number.type.carriages.length
      end
      #station.trains_at_station.find_all do| obj |
      #  puts "sdsd - #{obj[1].number}, #{obj[1].type} , #{obj[1].carriages.length}"
      #  puts  number=obj[1].number
      # puts  type = obj[1].type
      # puts carriages=obj[1].carriages.length
      #  my_method
      #  yield(number, type, carriages)
      # end
    end
  end


  def show_trains
    as=0
    @trains_at_station.each do |x|
      product = eval(x.to_s)
      puts product if (product.instance_of?Train) & (product.instance_of?Station)

      #puts as.number if train == PassengerTrain

      #puts  "поезд #{train} на станции #{Station}"

      #if Train.object_id != nil?
      #puts "поезд на станции  #{train}"
      # end
      # puts "поезд на станции #{Station.name} :  #{train}"
    end
   end
  def show_type_train(train_type)
    @trains_at_station.select { |train| train.type == train_type }.size
  end

  def delete_train(train)
    @trains_at_station.delete(train)
  end

  def validate!
    station_validate
  end

  def my_method
    add_train_in_station do |number, type, carriages|
    puts "найден hjhjhjhj!!! #{number}, #{type}, #{carriages}"
    end
  end

end
