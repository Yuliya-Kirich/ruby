class UsersTrainNumberInput
  attr_accessor :train_number

  def initialize(train_number)
    @train_number = train_number
  end
  def define_number
    return @train_number if train_number != nil
  end

end