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
    print "Введите номер поезда к которому хотите прицепить вагон либо 0 для выходя в главное меню: "
    train = gets.to_i
    next if train.zero?
    print "Введите тип вагона 1 - PassangerWagon, 2 - CargoWagon: "
    type = gets.to_i
    if type == 1
      type = PassangerWagon.new
    elsif type == 2
      type = CargoWagon.new
    end
    app.add_wagon(train, type)

  when 6
    print "Введите номер поезда у которого хотите отцепить вагон либо 0 для выходя в главное меню: "
    train = gets.to_i
    next if train.zero?
    app.del_wagon(train)

  when 7 
    print "Введите номер поезда котором хотите манипулировать либо 0 для выходя в главное меню: "
    train = gets.to_i
    next if train.zero?
    print "1 - для движения вперед, 2 - для движения назад"
    chose = gets.to_i
    case chose
      when 1
        app.forward(train)
      when 2
        app.backward(train)      
      end

  when 8
    print "1 - показать все станции, 2 - показать поезда на станции по типу: "
    chose = gets.to_i
    case chose
      when 1
        app.stations.each.with_index(1) { |value, key| puts "#{key} - #{value.name}" }
      when 2
        print "Веедите имя станции либо оставь поле пустым для выходя в главное меню: "
        station = gets.chomp!
        next if station.empty?
        print "Веедите тип поезда 1 - PassangerTrain, 2 - CargoTrain: "
        type = gets.to_i
        if type == 1
          type = PassangerTrain
        elsif type == 2
          type = CargoTrain
        end          
        puts "На станции #{station}"
        app.show_train_on_station(station, type).each do |value| 
          puts "Поезд №#{value.number}, кол-во вагонов: #{value.qnt_wagon} "
        end
        puts "#{station} - #{type}"
      end

  when 364
    puts "poka brat"

  else #для инспекции
    puts "Станции #{app.stations.inspect}"
    puts "Маршруты #{app.routes.inspect}"
    puts "Поезда #{app.trains.inspect}"
  end

  break if input == 364

end