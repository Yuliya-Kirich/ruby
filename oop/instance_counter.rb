# frozen_string_literal: true

module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end
  module ClassMethods
    def self.instances
      @@instances_variable
    end
    end
  module InstanceMethods
    @@instances_variable = []

    protected

    def register_instance
      @@instances_variable << self

      class_instance_count = 0
      if @@instances_variable[-1].class == CargoTrain || @@instances_variable.at(-1).class == PassengerTrain

        @@instances_variable.each { |type_v| class_instance_count += 1 if type_v.type == self.type}
        puts class_instance_count

      elsif @@instances_variable[-1].class == Route
        @@instances_variable.each { |type_v| class_instance_count += 1 if type_v.end_station}
        puts class_instance_count

      elsif @@instances_variable[-1].class == Station
        @@instances_variable.each { |type_v| class_instance_count += 1 if type_v.name }

        puts class_instance_count
      else
        puts'no'
       end
    end
  end
end

