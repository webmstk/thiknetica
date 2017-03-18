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
  find_route(start_s, end_s).add_station(create_station(station)) #TODO ПЕРЕДЕЛАТЬ
end

# Удалить станцию с маршрута
def del_station_in_route(station, start_s, end_s)

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
# Просматривать список станций и список поездов на станции

# Добавлять вагоны к поезду
def add_wagon(number, wagon)
  find_train(number).hitch_wagon(wagon)
end
# Отцеплять вагоны от поезда
def del_wagon(number, wagon)
  find_train(number).unhook_wagon(wagon)
end
# Поиск маршрута
def find_route(start_station, end_station)
  @routes.find { |r| r.stations.first.name == start_station && r.stations.last.name == end_station }
end
# Поиск поезда
def find_train(number)
  @trains.find { |t| t.number == number}
end
# Поиск станции
def find_station(name)
  @stations.find { |s| s.name == name}
end

end

