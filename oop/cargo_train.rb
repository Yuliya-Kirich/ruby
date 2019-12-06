class CargoTrain < Train

  require_relative 'instance_counter.rb'
  include InstanceCounter

  attr_reader :type

  def initialize(number)
    super(number)
    @type = 'cargo'
    register_instance
  end
end


