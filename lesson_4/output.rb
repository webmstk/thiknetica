require_relative "app"
class Output

  def initialize
    @app = App.new
  end

  def create_station
    loop do
      print "Введи название станции либо оставь поле пустым для выходя в главное меню: "
      station = gets.chomp!
      break if station.empty?
      @app.create_station(station)
    end
  end

  def create_train
    loop do
      print "Введи номер поезда либо оставь поле пустым или 0 для выходя в главное меню: "
      train = gets.chomp.to_i
      break if train.zero?
      print "Введи тип поезда 1 - PassangerTrain, 2 - CargoTrain: "
      type = gets.chomp.to_i
      @app.create_train(type, train)
    end
  end

  def manipulate_routes
    loop do
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
          @app.create_route(start_station, end_station)
        when 2
          print "Введите имя станции: "
          station = gets.chomp!
          print "Введите имя начальной станции в маршруте: "
          start_station = gets.chomp!
          print "Введите имя конечной станции в маршруте: "
          end_station = gets.chomp!
          @app.add_station_to_route(station, start_station, end_station)
        when 3
          print "Введите имя станции: "
          station = gets.chomp!
          print "Введите имя начальной станции в маршруте: "
          start_station = gets.chomp!
          print "Введите имя конечной станции в марщруте: "
          end_station = gets.chomp!
          @app.del_station_in_route(station, start_station, end_station)
        when 0
          break
      end
    end
  end

  def set_route
    print "Введите номер поезда которому хотите назначить маршрут: "
    number = gets.to_i
    print "Введите имя начальной станции: "
    start_station = gets.chomp!
    print "Введите имя конечной станции: "
    end_station = gets.chomp!
    @app.set_route(number, start_station, end_station)
  end

  def add_wagon
    loop do
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
      @app.add_wagon(train, type)
    end
  end

  def del_wagon
    loop do
      print "Введите номер поезда у которого хотите отцепить вагон либо 0 для выходя в главное меню: "
      train = gets.to_i
      next if train.zero?
      @app.del_wagon(train)
    end
  end

  def move_trains
    loop do
      print "Введите номер поезда котором хотите манипулировать либо 0 для выходя в главное меню: "
      train = gets.to_i
      next if train.zero?
      print "1 - для движения вперед, 2 - для движения назад"
      chose = gets.to_i
      case chose
        when 1
          @app.forward(train)
        when 2
          @app.backward(train)
      end
    end
  end

  def showing
    loop do
      print "1 - показать все станции, 2 - показать поезда на станции по типу, 0 - выход: "
      chose = gets.to_i
      next if chose.zero?
      case chose
        when 1
          @app.stations.each.with_index(1) { |value, key| puts "#{key} - #{value.name}" }
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
          @app.show_train_on_station(station, type).each do |value|
            puts "Поезд №#{value.number}, кол-во вагонов: #{value.qnt_wagon} "
          end
          puts "#{station} - #{type}"
      end
    end
  end

  def inspects
    puts "Станции #{@app.stations.inspect}"
    puts "Маршруты #{@app.routes.inspect}"
    puts "Поезда #{@app.trains.inspect}"
  end

end
