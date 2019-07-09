  puts "Введите Ваше Имя "
  name = gets.chomp
  puts "Введите Ваш рост, в сантиметрах"
  growth = gets.to_i
  optimal_weight = growth - 110
if optimal_weight < 0
  puts "Ваш вес уже идеален"
else
	puts "Ваш идеальный вес, #{name}, это #{optimal_weight} кг."
end
