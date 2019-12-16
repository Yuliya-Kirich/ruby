# frozen_string_literal: true

require_relative 'manufacture_name.rb'
class PassengerCarriage
  include ManufactureName
  attr_reader :type
  def initialize
    @type = 'passenger'
  end
end
