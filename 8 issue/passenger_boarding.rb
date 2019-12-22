# frozen_string_literal: true

module Passenger_boarding

  def user_input
    puts 'Введите общее количество мест в вагоне'
  end

  def seats_left_carriage
    if @number_of_seats.length > 0
      seats = @number_of_seats.length
      take = nil
      while take != 0
        puts 'Если Вы хотите занять место в вагоне, нажмите 1'
        puts 'Если хотите завершить посадку, нажмите 0'
        take = gets.chomp.to_i
        case take
        when 1
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
    if seats > 0
      seats -= 1
      block = Proc.new { seats }
      puts "Свободно мест в вагоне: #{read_empty_seats(block)}"
      puts "Занято мест в вагоне: #{read_busy_seats(block)}"
    else
      puts 'Все места уже заняты'
    end
  end
end
