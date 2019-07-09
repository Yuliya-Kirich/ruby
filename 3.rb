  print "Введите длинну трех сторон треугольника, по порядку, где 1 сторона = "
  b_side = gets.to_f
  print "2 сторона = "
  c_side = gets.to_f
  print "3 сторона = "
  a_side = gets.to_f
  a_side, b_side, c_side = [a_side,b_side,c_side].sort!
if [a_side, b_side, c_side].any? {|length| length == 0}
  puts "Это не треугольник"
elsif a_side == b_side && b_side == c_side && b_side == c_side
  puts "Это равносторонний треугольник"
elsif a_side == b_side || b_side == c_side || c_side == b_side
  puts "Это равнобедренный треугольник"
elsif a_side**2 + b_side**2 == c_side**2
  puts "Это прямоугольный треугольник"
else
  puts "Этот треугольник не равносторонний, не равнобедренный, и не прямоугольный"
  end

