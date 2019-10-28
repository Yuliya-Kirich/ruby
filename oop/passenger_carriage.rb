# frozen_string_literal: true

class PassengerCarriage
  attr_reader :type
  def initialize
    @type = 'passenger'
  end

  def new_carriage
    passenger_carriage = PassengerCarriage.new
  end
end
