# frozen_string_literal: true
# Для грузовых вагонов:
# Добавить атрибут общего объема (задается при создании вагона)
# Добавить метод, которые "занимает объем" в вагоне (объем указывается в качестве параметра метода)
# Добавить метод, который возвращает занятый объем
# Добавить метод, который возвращает оставшийся (доступный) объем
#

require_relative 'logic_news/bot_list'

module Cargo_details
  a = BotList.new
  def user_input
    a.define_quantify
  end

  def occupy_freight_car
    a = BotList.new
    if @overall_volume.to_i > 0
      seats = @overall_volume
      take = nil
      while take != 0
        a.define_occupied_place
        a.define_completed_landing
        take = gets.chomp.to_i
        case take
        when 1
          a.define_occupied_volume
          volume = gets.chomp.to_i
          if seats >= volume
            seats -= volume
            take_seats(seats)
          else
            a.denger_warning_volume
            take_seats(seats)
          end
        when 0
          break
        end
      end
    else
      a.define_error
    end
  end

  def read_busy_volume(block)
    @overall_volume - block.call
  end

  def read_empty_volume(block)
    block.call
  end

  def take_seats(seats)
    a = BotList.new
    if seats > 0
      block = proc { seats }
      puts "Свободный объем вагонов: #{read_empty_volume(block)}"
      puts "Занятый объем вагонов: #{read_busy_volume(block)}"
    elsif seats == 0
      a.denger_warning_volume
      puts "Занятый объем вагонов: #{@overall_volume}"
    else
      a.define_error
    end
  end
end
