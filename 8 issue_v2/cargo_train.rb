# frozen_string_literal: true

require_relative 'instance_counter.rb'

class CargoTrain < Train
  include InstanceCounter

  attr_reader :type

  def initialize(number)
    super(number)
    @type = 'cargo'
    register_instance
  end

end


