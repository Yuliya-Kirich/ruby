# frozen_string_literal: true

class CargoCarriage
  require_relative 'manufacture_name.rb'
  include ManufactureName
  def initialize
    @type = 'cargo'
  end
end
