# frozen_string_literal: true

# Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя).
# Найти порядковый номер даты, начиная отсчет с начала года.
# Учесть, что год может быть високосным.
# (Запрещено использовать встроенные в ruby методы для этого вроде Date#yday или Date#leap?)
# Алгоритм опредления високосного года: www.adm.yar.ru

# frozen_string_literal: true

# frozen_string_literal: true

# frozen_string_literal: true

puts 'Введите год: '
number_year = gets.chomp.to_i
puts "Введите месяц (ввод согласно названиям из списка:
January
February
March
April
May
June
July
August
September
October
November
December"
name_month = gets.chomp
puts 'Введите день (число): '
number_day = gets.chomp.to_i

sum = 0

{ January: 31, February: 28, March: 31, April: 30, May: 31, June: 30,
  July: 31, August: 31, September: 30, October: 31, November: 30,
  December: 31 }.each.with_index(0) do |my_hash_month, _number|

  if (number_year.to_i % 100 == 0) & (number_year.to_i % 400 == 0) || ((number_year.to_i % 100 != 0) & (number_year.to_i % 4 == 0))
    my_hash_month[1] = 29 if my_hash_month[0] == :February
  end

  begin
    if my_hash_month[0] == name_month.to_sym
      break my_hash_month[0] == name_month.to_sym
    end

    sum += my_hash_month[1]
  end
end
puts "\nПорядковый номер даты, начиная отсчет с начала года:
 #{sum + number_day}"
