  print "Введите длинну основания треугольника: "
  base = gets.to_f
  print "Введите высоту треугольника: "
  height = gets.to_f
  area = 0.50 * base * height.to_f

if base == 0 || height == 0
  puts "Это не треугольник"
else
  puts "Площадь треугольника = #{area}"
end
