puts "Калькулятор предназначен для нахождения дискриминанта и корней квадратного трехчлена ax^2+bx+c=0 "
print "Введите 3 коэффициента: a = "
a=gets.to_i
print "b = "
b=gets.to_i
print "c = "
c=gets.to_i
d = b*b - 4*a*c

if d==0
	x=-b/2*a
	puts "Дискриминант D = #{d} и корень = #{x}"
elsif d>0
	x1=(-b+Math.sqrt(d))/2*a
	x2=(-b-Math.sqrt(d))/2*a
	puts "Дискриминант D = #{d}, первый корень = #{x1}, второй корень = #{x2}"
elsif d<0
	puts "Дискриминант D = #{d}, корней нет"
else
	puts "Ошибка ввода"
end
