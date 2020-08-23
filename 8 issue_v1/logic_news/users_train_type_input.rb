class UsersTrainTypeInput
  attr_accessor :type_train
  def initialize(type_train)
    @type_train=type_train.to_i

  end

end