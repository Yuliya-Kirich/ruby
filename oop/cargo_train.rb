class CargoTrain < Train
  attr_accessor :type

  def initialize(number)
    super(number)
    @type = 'passenger'
  end
end


