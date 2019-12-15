# frozen_string_literal: true



class PassengerTrain < Train

  attr_accessor :type

  def initialize(number)
    super(number)
    @type = 'passenger'
  end
end
