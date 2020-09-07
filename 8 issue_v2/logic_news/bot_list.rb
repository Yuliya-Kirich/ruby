# frozen_string_literal: true

class BotList
  attr_reader  :hello, :first, :second, :third, :fourth, :fifth, :sixth, :seventh, :eigth, :zero, :station_name_bot,
               :train_type_bot, :train_number_bot, :train_carriage_seats_bot, :train_value_bot, :denger_type_train_bot,
               :start_station_bot, :end_station_bot, :add_station_bot, :remote_station_name_bot, :absence_station,
               :error_bot, :wrong_train_type, :wrong_train_type_second, :moving_train_bot, :viewing_station_list_bot,
               :end_bot, :imiting_input, :occupied_place; :occupied_volume; :warning_volume; :stations_train_list;
               :end_operation

  def initialize
    @hello = 'Привет, это программа-абстракция железной дороги.'
    @first = 'Введите 1, если вы хотите создать станцию.'
    @second = 'Введите 2, если вы хотите создать поезд.'
    @third = 'Введите 3, если вы хотите создать маршрут и управлять станциями в нем (добавлять, удалять).'
    @fourth = 'Введите 4, если вы хотите назначить маршрут поезду.'
    @fifth = 'Введите 5, если вы хотите добавлять вагоны к поезду.'
    @sixth = 'Введите 6, если вы хотите отцеплять вагоны от поезда.'
    @seventh = 'Введите 7, если вы хотите перемещать поезд по маршруту вперед и назад.'
    @eigth = 'Введите 8, если вы хотите просматривать список станций и список поездов на станции.'
    @zero = 'Введите 0, если хотите закончить программу.'
    @station_name_bot = 'Введите наименование станции, которую хотите добавить.'
    @train_type_bot = "Если вы хотите создать поезд, типа: 'пассажирский'- нажмите 1; грузовой - 2."
    @train_number_bot = 'Введите номер поезда.'
    @train_carriage_seats_bot = 'Введите общее количество мест в вагоне.'
    @train_value_bot = 'Введите общий объем вагонов.'
    @denger_type_train_bot = 'Выбор типа поезда должен быть только из перечня.'
    @start_station_bot = 'Введите начальную станцию.'
    @end_station_bot = 'Введите конечную станцию.'
    @add_station_bot = 'Хотите добавить станцию - нажмите 1; удалить станцию - нажмите 2; закончить процесс добавления - нажмите 0.'
    @remote_station_name_bot = 'Введите наименование станции, которую хотите удалить.'
    @absence_station = 'Нет такой станции в составе пути.'
    @error_bot = 'Произошла ошибка.'
    @wrong_train_type = 'Нельзя данному типу поезда добавить вагоны.'
    @wrong_train_type_second = 'Нельзя данному типу поезда удалить вагоны.'
    @moving_train_bot = 'Если хотите перемещать поезд по маршруту вперед - нажмите 1; назад - нажмите 2; закончить процесс - нажмите 0.'
    @viewing_station_list_bot = 'Если хотите просмотреть список станций - нажмите 1; список поездов на станции - нажмите 2; закончить процесс - нажмите 0.'
    @end_bot = 'Программа завершена.'
    @limiting_input = 'Введите значение из списка .'
    @quantify = 'Введите общее количество мест в вагоне. '
    @book_a_seat = 'Если Вы хотите занять место в вагоне, нажмите 1.'
    @completed_landing = 'Если хотите завершить действие, нажмите 0. '
    @occupied_place = 'Если Вы хотите занять объем в вагонах, нажмите 1. '
    @occupied_volume = 'Укажите объем, который хотите занять, в м3 '
    @warning_volume = 'Вы хотите занять больший объем, чем возможно'
    @stations_train_list = 'Если хотите посмотреть список поездов на станции, нажмите 1; закончить процесс - нажмите 0.'
    @end_operation = 'Завершаю процедуру ...'
  end

  def begin
    puts @hello
  end

  def bot
    puts @first, @second, @third, @fourth, @fifth, @sixth, @seventh, @eigth, @zero
  end

  def define_station_name
    puts @station_name_bot
  end

  def define_train_type
    puts @train_type_bot
  end

  def define_train_number
    puts @train_number_bot
  end

  def define_carriage_seats
    puts @train_carriage_seats_bot
  end

  def define_train_value
    puts @train_value_bot
  end

  def denger_type_train
    puts @denger_type_train_bot
  end

  def define_start_station
    puts @start_station_bot
  end

  def define_end_station
    puts @end_station_bot
  end

  def define_add_station
    puts @add_station_bot
  end

  def define_remote_station
    puts @remote_station_name_bot
  end

  def define_absence_station
    puts @absence_station
  end

  def define_error
    puts @error_bot
  end

  def denger_wrong_type_train
    puts @wrong_train_type
  end

  def denger_wrong_type_train_second
    puts @wrong_train_type_second
  end

  def define_moving_train
    puts @moving_train_bot
  end

  def define_viewing_station_list
    puts @viewing_station_list_bot
  end

  def define_end
    puts @end_bot
  end

  def denger_limiting_input
    puts @limiting_input
  end

  def define_quantify
    puts @quantify
  end

  def define_book_a_seat
    puts @book_a_seat
  end

  def define_completed_landing
    puts @completed_landing
  end

  def define_occupied_place
    puts @occupied_place
  end

  def define_occupied_volume
    puts @occupied_volume
  end

  def denger_warning_volume
    puts @warning_volume
  end

  def define_stations_train_list
    puts @stations_train_list
  end

  def end_current_operation
    puts @end_operation
  end
end