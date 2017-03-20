require_relative "output"

menu  = App.new

loop do

  puts <<~hellomsg
    Выберите вариант того что вы хотите сделать:
        1 - Создавать станции
        2 - Создавать поезда
        3 - Создавать маршруты и управлять станциями в нем (добавлять, удалять)
        4 - Назначать маршрут поезду
        5 - Добавлять вагоны к поезду
        6 - Отцеплять вагоны от поезда
        7 - Перемещать поезд по маршруту вперед и назад
        8 - Просматривать список станций и список поездов на станции
      364 - выход из программы

  hellomsg

  input = gets.chomp.to_i

  case input

  when 1
    menu.make_station
  when 2
    menu.make_train
  when 3
    menu.manipulate_routes
  when 4
    menu.giv_route
  when 5
    menu.add_wagons
  when 6
    menu.del_wagons
  when 7
    menu.move_trains
  when 8
    menu.showing

  when 364
    puts "Bye"
  else #для инспекции
    menu.inspects
  end

  break if input == 364

end
