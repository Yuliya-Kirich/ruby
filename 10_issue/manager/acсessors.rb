# frozen_string_literal: true

module Acсessors
  def attr_accessor_with_history(*names_atribut)
    names_atribut.each do |name|
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) do |names_value|
        instance_variable_set(var_name, names_value)
      end
    end
  end

  def method_missing(name, *args)
    self.class.send(:define_method, "#{name}_history".to_sym, proc {[*args]})
  end

  def attr_one(name)
    var_name = "@#{name}".to_sym
    define_method(name) {instance_variable_get(var_name)}
    define_method("#{name} =".to_sym) { |value| instance_variable_set(var_name, value)}
  end

  def strong_attr_accessor(class_atribut, *strong_names_atribut)
    strong_names_atribut.each do |names_atribut|
      if names_atribut.class == class_atribut
        attr_accessor_with_history(names_atribut)
      else
        puts "Ошибка"
      end
    end
  end
end
