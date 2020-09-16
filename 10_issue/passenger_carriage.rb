# frozen_string_literal: true
#Для пассажирских вагонов:
#Добавить атрибут общего кол-ва мест (задается при создании вагона)
require_relative 'manufacture_name.rb'
require_relative 'passenger_boarding.rb'

class PassengerCarriage
  include ManufactureName
  include Passenger_boarding

  attr_reader :type
  attr_accessor :number_of_seats

  def initialize(number_of_seats)
    @type = 'passenger'
    @number_of_seats = Array.new(number_of_seats) { |index| index + 1 }
    seats_left_carriage
  end
end
