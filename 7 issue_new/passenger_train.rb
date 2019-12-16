# frozen_string_literal: true

require_relative 'instance_counter.rb'

class PassengerTrain < Train
  include InstanceCounter

  attr_reader :type

  def initialize(number)
    super(number)
    @type = 'passenger'
    register_instance
  end
end
