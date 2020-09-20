# frozen_string_literal: true

# Класс Station (Станция):
# Имеет название, которое указывается при ее создании
# Может принимать поезда (по одному за раз)
# Может возвращать список всех поездов на станции, находящиеся в текущий момент
# Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых , пассажирских
# Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
#
# написать метод, который принимает блок и проходит по всем поездам на станции, передавая каждый поезд в блок.

require_relative 'instance_counter.rb'
require_relative 'validate.rb'
require_relative 'user_case/train_type_initiation'
require_relative 'user_case/rout_initiation'
require_relative 'manager/acсessors'
require_relative 'manager/validation'

class Station
  include InstanceCounter
  extend Acсessors
  include Acсessors
  include Validation

  attr_accessor_with_history :daily, :holidays, :reserve, :name_non
  attr_accessor :name, :trains_at_station
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
    register_instance
    validate!
    validate @name, :presence
    validate @name, :format, /[A-Z]/
    validate @name, :type, String
  end

  def add_train(train)
    @trains_at_station << train
    # Поезд можно добавить на станцию, только через привязку пути.
    viewing_train_in_station do
      puts "Номер поезда - #{train.number},тип - #{train.type}, кол-во вагонов - #{train.carriages.length}"
    end
  end

  def viewing_train_in_station
    if trains_at_station.length.positive?
      puts "На станции #{name} следующие поезда: "
      yield
    else
      puts "На платформах станции #{name} нет поездов. "
    end
  end

  def set_trains_each_station
    @@all_station.each do |_key, value|
      if value.trains_at_station.length.positive?
        puts "На платформах станции #{value.name} следующие поезда: "
        value.trains_at_station.each do |value_train|
          puts "Поезд №#{value_train.number};
                типа - #{value_train.type};
                кол-во вагонов - #{value_train.carriages.length}. "
        end
      else
        puts "На платформах станции #{value.name} нет поездов. "
      end
    end
  end

  def show_type_train(train_type)
    @trains_at_station.select { |train| train.type == train_type }.size
  end

  def delete_train(train)
    @trains_at_station.delete(train)
  end
end
