=begin
Площадь треугольника можно вычилсить, зная его основание (a) и высоту (h) по формуле: 1/2*a*h.
Программа должна запрашивать основание и высоту треуголиника и возвращать его площадь.
=end
puts "Введите основание треуголиника"
base = gets.to_f
puts "Введите высоту треуголиника"
height = gets.to_f
area = 1/2.0 * base * height
puts "Площадь треуголиника ровна: #{area}"
