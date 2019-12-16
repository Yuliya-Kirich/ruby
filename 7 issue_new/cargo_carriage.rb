# frozen_string_literal: true

require_relative 'manufacture_name.rb'
class CargoCarriage
  include ManufactureName
  def initialize
    @type = 'cargo'
  end
end
