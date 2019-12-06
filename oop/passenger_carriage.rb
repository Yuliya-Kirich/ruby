# frozen_string_literal: true

class PassengerCarriage
  require_relative 'manufacture_name.rb'

  include ManufactureName

  attr_reader :type
  def initialize
    @type = 'passenger'

  end
end
