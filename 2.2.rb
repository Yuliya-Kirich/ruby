#Заполнить массив числами от 10 до 100 с шагом 5

  my_array = []
  number = 5
loop do
  number += 5
  my_array += [number]
  break if number == 100
end
  puts my_array
