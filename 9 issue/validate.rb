# frozen_string_literal: true

module Validate
  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  def station_availability_validate
    raise 'Наименование станции должно состоять из кириллические букв и цифр' if @initial_station.to_s !~ /[(а-я|ё|1-9)]/i
    raise 'Наименование станции должно состоять из кириллические букв и цифр' if @end_station.to_s !~ /[(а-я|ё|1-9)]/i
    raise 'Наименование станции не может отсутствовать' if @initial_station.nil? && @end_station.nil?

    unless @intermediate_station.nil?
      raise 'Наименование станции должно состоять из кириллические букв и цифр' if @intermediate_station.to_s !~ /[(а-я|ё|1-9)]/i
    end
  end

  def station_validate
    raise 'Наименование станции должно состоять из кириллические букв и цифр' if @name.to_s !~ /[(а-я|ё|1-9)]/i
  end

  def train_validate
    raise 'Номер должен состоять из кириллические букв и цифр' if number.to_s !~ /^[а-я|1-9]{3}-?[а-я|1-9]{2}$/i
    raise 'Номер не может быть пустым' if number.nil?
  end
  end
