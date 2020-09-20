# frozen_string_literal: true

# Для пассажирских вагонов:
# Добавить атрибут общего кол-ва мест (задается при создании вагона)
# Добавить метод, который "занимает места" в вагоне (по одному за раз)
# Добавить метод, который возвращает кол-во занятых мест в вагоне
# Добавить метод, возвращающий кол-во свободных мест в вагоне.
#
require_relative 'logic_news/bot_list'

module Passenger_boarding
  a = BotList.new

  def user_input
    a.define_quantify
  end

  def seats_left_carriage
    a = BotList.new
    if @number_of_seats.length.positive?
      seats = @number_of_seats.length
      take = nil
      while take != 0
        a.bot :book_a_seat
        a.bot :completed_landing
        take = gets.chomp.to_i
        case take
        when 1
          seats -= 1
          take_seats(seats)
        when 0
          break
        end
      end
    else
      puts 'Нет мест'
    end
  end

  def read_busy_seats(block)
    @number_of_seats.length - block.call
  end

  def read_empty_seats(block)
    block.call
  end

  def take_seats(seats)
    if seats.positive?
      block = proc { seats }
      puts "Свободно мест в вагоне: #{read_empty_seats(block)}"
      puts "Занято мест в вагоне: #{read_busy_seats(block)}"
    else
      puts 'Все места уже заняты'
    end
  end
end
