# frozen_string_literal: true
#
# Для грузовых вагонов:
# Добавить атрибут общего объема (задается при создании вагона)
# Добавить метод, которые "занимает объем" в вагоне (объем указывается в качестве параметра метода)
# Добавить метод, который возвращает занятый объем
# Добавить метод, который возвращает оставшийся (доступный) объем
#


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
