# frozen_string_literal: true

# Класс Station (Станция):
# Имеет название, которое указывается при ее создании
# Может принимать поезда (по одному за раз)
# Может возвращать список всех поездов на станции, находящиеся в текущий момент
# Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых , пассажирских
# Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
require_relative 'instance_counter.rb'
require_relative 'validate.rb'

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
    @trains_at_station = {}
    @@all_station[name] = self
    self.class.instance_methods
    self.register_instance
    validate!
    valid?

  end

  def add_train(train)
    #@trains_at_station << train
    key = (@trains_at_station.length + 1)
    @trains_at_station[key] = train
    # add_train_in_station {|value| puts "Номер поезда - #{value.number},тип - #{value.type}, кол-во вагонов - #{value.carriages}" }
    add_train_in_station
  end

  def add_train_in_station
    puts @@all_station
    @@all_station.each do |key, station|
      #  puts "все параметры класса #{station.methods} наименование станции -'#{key}'"
      #  puts "поезда на станции #{station.trains_at_station}"
        station.trains_at_station.each do |key_number, value|
          #if value == :trains_at_station
          
          # block  if value.class == PassengerTrain || value.class == CargoTrain

           puts "найден !!! #{value.number}, #{value.type}, #{value.carriages.length}" if value.class == PassengerTrain
           puts "найден !!! #{value.number}, #{value.type}, #{value.carriages.length}" if value.class == CargoTrain

          
          
          # puts "найден !!! #{value.number}, #{value.type}, #{value.carriages.length}"
          # number = value.number
          # type = value.type
          # carriages = value.carriages.length

          # hj
          # yield
           #yield("#{value.number}", "#{value.type}", "#{value.carriages.length}")
           #  block.call
            end
          # else
          #  puts 'не найден метод'


       # station.methods.each_pair {| key_value_array | block }

       # puts value.inspect

      end
  end



  def hj
  #add_train_in_station do |number, type, carriages|
  # puts do
  #  "Номер поезда - #{number},тип - #{type}, кол-во вагонов - #{carriages}"
  #  end
  #  end
  #block = proc { puts "найден !!! #{value.number}, #{value.type}, #{value.carriages.length}" }
  end


  def show_trains
    @trains_at_station.each do |train|
      puts "поезд на станции #{train.number}"
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
end
