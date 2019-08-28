# frozen_string_literal: true

# Заполнить массив числами фибоначчи до 100

my_array = []
fibonacci = 1
loop do
  my_array << fibonacci
  fibonacci += fibonacci
  break if fibonacci >= 100
end
print my_array
