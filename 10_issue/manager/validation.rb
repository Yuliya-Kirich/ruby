# frozen_string_literal: true

module Validation
  def validate!
    valid?
  end

  def validate(name_atribut, type_validation, *validation)
    if type_validation == :presence
      raise 'Должно быть введено значение не nil, и не пустой строкой' if name_atribut.to_s.empty?
    end
    if type_validation == :format
      unless name_atribut.match(validation.first)
        raise "Должно быть введено значение в соответствии с регулярным выражением #{validation.first.to_s}"
      end
    end
    if type_validation == :type
      if name_atribut.class.to_s.downcase != validation.first.to_s.downcase
        raise 'Должно быть соответствие значения атрибута заданному классу'
      end
    end
  end

  def valid?
    validate(name_atribut, type_validation, *validation)
    true
  rescue StandardError
    false
  end
end
