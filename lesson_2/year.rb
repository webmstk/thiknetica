# Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя). Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным

puts "Введите число"
day = gets.chomp.to_i

puts "Введите месяц"
month = gets.chomp.to_i

puts "Введите год"
year = gets.chomp.to_i

months  = [ 31, 28, 31, 31, 30, 31, 30, 31, 30, 31, 30, 31 ]
days    = day

months.each.with_index(1) do |month_days, i|
  break if month <= i
  days += month_days
end

if ( month > 2 && day > 28 ) || ( year % 400 == 0 || year % 4 == 0 && year % 100 != 0 )
  days += 1
end

answer = ( month == 1 ) ? "=> #{day}" : "=> #{days}"

puts answer
