puts "Введите Ваше Имя "
name=gets.chomp
puts "Введите Ваш рост, в сантиметрах"
growth=gets.to_i
weight=growth-110
if 0 <= weight
puts "Ваш идеальный вес, #{name}, это #{weight} кг."
else puts "Ваш вес уже идеален"
  end
