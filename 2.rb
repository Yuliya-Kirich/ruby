  print "Введите длинну основания треугольника: "
  base = gets.to_f
  print "Введите высоту треугольника: "
  height = gets.to_f
  p = 0.50 * base * height
  area = p.to_f

if base == 0 || height == 0
  puts "Это не треугольник"
else
  puts "Площадь треугольника = #{area}"
end
