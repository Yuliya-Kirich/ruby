# frozen_string_literal: true

module Validation
  def validate!
    valid?
  end

  def validate(name_atribut, type_validation, *validation)
    send :"validate_#{type_validation}", name_atribut, validation
  end

  def validate_presence (name_atribut, validation)
    raise 'Должно быть введено значение не nil, и не пустой строкой' if name_atribut.to_s.empty?
  end

  def validate_format(name_atribut, validation)
    raise "Должно быть введено значение в соответствии с регулярным выражением #{validation.first.to_s}" unless name_atribut.match(validation.first.to_s)
  end

  def validate_type(name_atribut, validation)
    if name_atribut.class.to_s.downcase != validation.first.to_s.downcase
      raise 'Должно быть соответствие значения атрибута заданному классу'
    end
  end

  def valid?
    validate(name_atribut, type_validation, *validation)
    true
  rescue StandardError
    false
  end
end
