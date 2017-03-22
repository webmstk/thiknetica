=begin
Создать программу в файле main.rb, которая будет позволять пользователю через текстовый интерфейс делать следующее:
Создавать станции
Создавать поезда
Создавать маршруты и управлять станциями в нем (добавлять, удалять)
Назначать маршрут поезду
Добавлять вагоны к поезду
Отцеплять вагоны от поезда
Перемещать поезд по маршруту вперед и назад
Просматривать список станций и список поездов на станции
=end

require_relative "railway_station"
require_relative "route"
require_relative "train"
require_relative "cargo_train"
require_relative "passanger_train"
require_relative "wagon"
require_relative "cargo_wagon"
require_relative "passanger_wagon"

class App

  attr_reader :stations, :routes, :trains

  def initialize
    @stations = []
    @routes   = []
    @trains   = []
  end

  def make_station
    loop do
      print "Введи название станции либо оставь поле пустым для выходя в главное меню: "
      station = gets.chomp!
      break if station.empty?
      create_station(station)
    end
  end

  def make_train
    loop do
      print "Введи номер поезда либо оставь поле пустым или 0 для выходя в главное меню: "
      train = gets.chomp.to_i
      break if train.zero?
      print "Введи тип поезда 1 - PassangerTrain, 2 - CargoTrain: "
      type = gets.chomp.to_i
      create_train(type, train)
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
          create_route(start_station, end_station)
        when 2
          print "Введите имя станции: "
          station = gets.chomp!
          print "Введите имя начальной станции в маршруте: "
          start_station = gets.chomp!
          print "Введите имя конечной станции в маршруте: "
          end_station = gets.chomp!
          add_station_to_route(station, start_station, end_station)
        when 3
          print "Введите имя станции: "
          station = gets.chomp!
          print "Введите имя начальной станции в маршруте: "
          start_station = gets.chomp!
          print "Введите имя конечной станции в марщруте: "
          end_station = gets.chomp!
          del_station_in_route(station, start_station, end_station)
        when 0
          break
      end
    end
  end


  def giv_route
    print "Введите номер поезда которому хотите назначить маршрут: "
    number = gets.to_i
    print "Введите имя начальной станции: "
    start_station = gets.chomp!
    print "Введите имя конечной станции: "
    end_station = gets.chomp!
    set_route(number, start_station, end_station)
  end

  def add_wagons
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
      add_wagon(train, type)
    end
  end

  def del_wagons
    loop do
      print "Введите номер поезда у которого хотите отцепить вагон либо 0 для выходя в главное меню: "
      train = gets.to_i
      next if train.zero?
      del_wagon(train)
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
          forward(train)
        when 2
          backward(train)
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
          stations.each.with_index(1) { |value, key| puts "#{key} - #{value.name}" }
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
          show_train_on_station(station, type).each do |value|
            puts "Поезд №#{value.number}, кол-во вагонов: #{value.qnt_wagon} "
          end
          puts "#{station} - #{type}"
      end
    end
  end

  def inspects
    puts "Станции #{stations.inspect}"
    puts "Маршруты #{routes.inspect}"
    # puts "Поезда #{trains.inspect}"
    # puts Train.all
    # puts "Поиск: #{Train.find(364)}"
  end


  private
  # Создавать станции
  def create_station(input)
    @stations << RailwayStation.new(input)
  end

  # Создавать маршруты и управлять станциями в нем (добавлять, удалять)
  def create_route(first_station, last_statinon)
    @routes << Route.new(find_station(first_station), find_station(last_statinon))
  end

  # Добавить станции к маршруту
  def add_station_to_route(station, start_s, end_s)
    create_station(station)
    find_route(start_s, end_s).add_station( find_station(station) )
  end

  # Удалить станцию с маршрута, но не из app.stations
  def del_station_in_route(station, start_s, end_s)
    find_route(start_s, end_s).delete_station( find_station(station) )
  end

  # Создавать поезда
  def create_train(chose, number)
    if chose == 1
      @trains << PassangerTrain.new(number)
    elsif chose == 2
      @trains << CargoTrain.new(number)
    end
  end
  # Назначать маршрут поезду
  def set_route(number_t, start_s, end_s)
    find_train(number_t).get_route = find_route(start_s, end_s)
  end

  # Перемещать поезд по маршруту вперед и назад
  def forward(number)
    find_train(number).forward
  end
  def backward(number)
    find_train(number).backward
  end
  # Просматривать список станций и список поездов на станции TODO станции обработать в клиентской части по attr stations
  def show_train_on_station(station, type)
    find_station(station).show_trains_by_types(type)
  end

  # Добавлять вагоны к поезду
  def add_wagon(number, wagon)
    find_train(number).hitch_wagon(wagon)
  end
  # Отцеплять вагоны от поезда
  def del_wagon(number)
    find_train(number).unhook_wagon
  end

  # Поиск маршрута
  def find_route(start_station, end_station)
    @routes.find { |r| r.stations.first.name == start_station && r.stations.last.name == end_station }
  end
  # Поиск поезда
  def find_train(number)
    @trains.find { |t| t.number == number}
  rescue
  end
  # Поиск станции
  def find_station(name)
    @stations.find { |s| s.name == name}
  end

end

