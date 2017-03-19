require_relative "app"
# Возможно вьюху надо вынести в отдельный файл, мысль

app = App.new

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
        9 -
      364 - выход из программы

  hellomsg

  input = gets.chomp.to_i

  case input

  when 1
    loop do
      print "Введи название станции либо оставь поле пустым для выходя в главное меню: "
      station = gets.chomp!
      p station
      break if station.empty?
      app.create_station(station)
    end
  when 2
    loop do
      print "Введи номер поезда либо оставь поле пустым или 0 для выходя в главное меню: "
      train = gets.chomp.to_i
      break if train.zero?
      print "Введи тип поезда 1 - PassangerTrain, 2 - CargoTrain: "
      type = gets.chomp.to_i
      app.create_train(type, train)
    end
  when 3
    puts <<~crtrout
      Выберите вариант того что вы хотите сделать:
        1 - Создать маршрут
        2 - Добавить станцию к существующему маршруту
        3 - Удалить станцию из маршрута
        0 - Для выходя в главное меню либо пустая строка
    crtrout

    chose = gets.to_i

    case chose

    when 1
      print "Введите имя начальной станции: "
      start_station = gets.chomp!
      print "Введите имя конечной станции: "
      end_station = gets.chomp!
      app.create_route(start_station, end_station)
    when 2
      print "Введите имя станции: "
    when 3
      print "Введите имя станции: "
      station = gets.chomp!
      app.del_station_in_route(station)
    when 0
      next
    end

  when 4
    print "Введите номер поезда которому хотите назначить маршрут: "
    number = gets.to_i
    print "Введите имя начальной станции: "
    start_station = gets.chomp!
    print "Введите имя конечной станции: "
    end_station = gets.chomp!
    app.set_route(number, start_station, end_station)

  when 5

  when 364
    puts "poka brat"
  else
    print "Станции " app.stations.inspect
    print "Маршруты " app.routes.inspect
    print "Поезда " app.trains.inspect
  end

  break if input == 364


end




# app.set_route(1, "start", "end")
# app.set_route(2, "start", "end")
# app.add_wagon(1, PassangerWagon.new)
# app.add_wagon(1, PassangerWagon.new)
# app.add_wagon(1, PassangerWagon.new)
# app.add_wagon(1, PassangerWagon.new)
# app.del_wagon(1, PassangerWagon.new)
# app.del_wagon(1, PassangerWagon.new)
# app.del_wagon(1, PassangerWagon.new)
# app.add_station_to_route("new_station", "start", "end")

# # p app.routes
# # p app.stations

# # p app.find_train(1).current_station.name
# # p app.stations[0].trains[0].type
# app.find_train(1).forward
# # p app.find_station("start").show_trains_by_types(PassangerTrain).size
# # p app.find_station("start").show_trains_by_types(CargoTrain)
# p app.show_train_on_station("new_station", PassangerTrain)








