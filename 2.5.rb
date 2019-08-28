# Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя).
# Найти порядковый номер даты, начиная отсчет с начала года.
# Учесть, что год может быть високосным.
# (Запрещено использовать встроенные в ruby методы для этого вроде Date#yday или Date#leap?)
# Алгоритм опредления високосного года: www.adm.yar.ru

puts "Введите год: "
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
puts "Введите день (число): "
number_day = gets.chomp.to_i
year = {1 => {January: 31}, 2 => {February: 28}, 3 => {March: 31}, 4 => {April: 30}, 5 => {May: 31}, 6 => {June: 30}, 7 => {July: 31},
        8 => {August: 31}, 9 => {September: 30}, 10 => {October: 31}, 11 => {November: 30}, 12 => {December: 31}}
search_period_by_month = {}
sum = 0

year.each {|number, my_hash_month| my_hash_month.each {|month, day|
  if (number_year.to_i % 100 == 0) & (number_year.to_i % 400 == 0) || ((number_year.to_i % 100 != 0) & (number_year.to_i % 4 == 0))
    year[2] = {:February => 29}
   end
  if month.to_s == name_month
    search_period_by_month =  year.take(number-1)
  end
}
}

search_period_by_month.each {|number, my_hash_month| my_hash_month.each {|month, day| sum += day}}

puts "Порядковый номер даты, начиная отсчет с начала года: #{sum + number_day}"


