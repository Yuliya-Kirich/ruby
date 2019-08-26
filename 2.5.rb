# Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя).
# Найти порядковый номер даты, начиная отсчет с начала года.
# Учесть, что год может быть високосным.
# (Запрещено использовать встроенные в ruby методы для этого вроде Date#yday или Date#leap?)
# Алгоритм опредления високосного года: www.adm.yar.ru




  a_index = 0
  sum_day = 0
  itog = 0

  year = {{:1 => {January: 31} }, {:2 => {February: 28}}, {:3 => {March: 31}}, {:4 => {April: 30}}, {May: 31}, {June: 30}, {July: 31}, {August: 31}, {September: 30}, {October: 31}, {November: 30}, {December: 31}}

  puts "Введите год: "
  number_year = gets.chomp.to_i
  puts "Введите месяц (ввод согласно названиям из списка: January, February, March, April, May, June, July, August, September, October, November, December): "
  number_month = gets.chomp
  puts "Введите день (число): "
  number_day = gets.chomp.to_i

if (number_year.to_i % 100 == 0) & (number_year.to_i % 400 == 0)
  year[1] = {"February" => 29}
elsif (number_year.to_i % 100 != 0) & (number_year.to_i % 4 == 0)
  year[1] = {"February" => 29}
end

  year.each {|elem| elem.each {|key, value|
if key == number_month
  a_index = year.index(elem)
end
  }
  }

  year.each { |number|
  s = year.index(number)
unless s > (a_index-1)
  number.each {|key, value_k| sum_day += value_k }
end
  itog = sum_day.to_i + number_day.to_i
  }
  puts "Порядковый номер введенной даты: #{itog}"

