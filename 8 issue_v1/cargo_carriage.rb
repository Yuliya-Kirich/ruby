# frozen_string_literal: true

require_relative 'manufacture_name.rb'
require_relative 'cargo_details'

class CargoCarriage
  include ManufactureName
  include Cargo_details

  def initialize(overall_volume)
    @type = 'cargo'
    @overall_volume = overall_volume
    occupy_freight_car
  end
end
