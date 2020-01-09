# frozen_string_literal: true

module Cargo_details

  def user_input
    puts 'Введите общее количество мест в вагоне'
  end

  def occupy_freight_car
    if @overall_volume.to_i > 0
      seats = @overall_volume
      take = nil
      while take != 0
        puts 'Если Вы хотите занять объем в вагонах, нажмите 1'
        puts 'Если хотите завершить погрузку, нажмите 0'
        take = gets.chomp.to_i
        case take
        when 1
          puts 'Укажите объем, который хотите занять, в м3 '
          volume = gets.chomp.to_i
          if  seats >= volume
          seats -= volume
          take_seats(seats)
          else
            puts 'Вы хотите занять больший объем, чем возможно'
            take_seats(seats)
          end
        when 0
          break
        end
      end
    else
      puts 'Нет доступных действий, по вашему запросу'
    end
  end

  def read_busy_volume(block)
    @overall_volume - block.call
  end

  def read_empty_volume(block)
    block.call
  end

  def take_seats(seats)
    if seats > 0
      block = Proc.new{ seats }
      puts "Свободный объем вагонов: #{read_empty_volume(block)}"
      puts "Занятый объем вагонов: #{read_busy_volume(block)}"
    elsif seats == 0
    puts 'Весь объем занят. Свободного объема нет. '
    puts "Занятый объем вагонов: #{@overall_volume}"
    else
      puts 'Вы не можете сделать такое действие '
    end
  end


end
