# frozen_string_literal: true

module ManufactureName
  def new_name(manufacturer_name)
    @manufacturer_name = manufacturer_name
  end
  attr_accessor :manufacturer_name
end