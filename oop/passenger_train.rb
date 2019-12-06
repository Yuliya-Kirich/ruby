# frozen_string_literal: true

class PassengerTrain < Train
  require_relative 'instance_counter.rb'
  include InstanceCounter

  attr_accessor :type

  def initialize(number)
    super(number)
    @type = 'passenger'
    register_instance
  end
end
