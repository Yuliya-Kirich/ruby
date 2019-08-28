# frozen_string_literal: true

# Заполнить массив числами от 10 до 100 с шагом 5

my_array = []
number = 5
until number == 100
  number += 5
  my_array << number
end
puts my_array
