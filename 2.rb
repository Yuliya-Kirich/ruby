print "Введите длинну основания треугольника: "
a = gets.to_f
print "Введите высоту треугольника: "
h = gets.to_f
p = 0.50*a*h
area=p.to_f

if (a!=0&&h!=0)==false
  puts "Это не треугольник"
else
  puts "Площадь треугольника = #{area}"
end
