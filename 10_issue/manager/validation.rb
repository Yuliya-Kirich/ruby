module Validation


  def self.validate(name_atribut, type_validation: [presence, formats, type], &validation)
    valid?(type_validation)
  end
  def validate!(type_validation)
    raise 'Должно быть введено значение' if name_atribut.to_s.empty?
    raise 'Должно быть введено значение' unless name_atribut.match validation
    raise 'Должно быть введено значение' unless name_atribut.class.to_s.downcase == validation.to_s.downcase
  end
end
def valid?(type_validation)
  validate!(type_validation)
  true
rescue StandardError
  false
end
  # def presence(take_atribute)
  # raise 'Должно быть введено значение' if parameters.to_s.empty?
  # if type_check == 'presence'
  #    presence(parameters)

  #  elsif type_check == 'format'
  #    format(name_atribute, parameters)
  # end
  # end

  # def format(take_atribute, parameters)
  #  raise 'Значение должно быть по формату' if !(take_atribute.match parameters)
  # end
  # def type(take_atribute, parameters)
  #  raise if !(take_atribute.class = parameters)
  # end
