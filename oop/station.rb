# frozen_string_literal: true

# Класс Station (Станция):
# Имеет название, которое указывается при ее создании
# Может принимать поезда (по одному за раз)
# Может возвращать список всех поездов на станции, находящиеся в текущий момент
# Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых , пассажирских
# Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).

class Station
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
  end

  def add_train(train)
    @trains_at_station << train
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
end
