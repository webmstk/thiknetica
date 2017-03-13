require_relative "route"
require_relative "train"
require_relative "railway_station"

p "Создание станций"
stantion_start  = RailwayStation.new("start")
stantion_end    = RailwayStation.new("end")

p "Название станций"
puts stantion_start
puts stantion_end

puts "Добавление маршрута"
route = Route.new(stantion_start.name, stantion_end.name)

puts "Добавление новой станци"
station_one = RailwayStation.new("one")

puts "Добавление нового маршрута"
puts route.add_station(station_one.name)

puts "Добавление новой станци"
station_two = RailwayStation.new("two")

puts "Добавление нового маршрута"
puts route.add_station(station_two.name)

puts "Добавление новой станци"
station_three = RailwayStation.new("three")

puts "Добавление нового маршрута"
puts route.add_station(station_three.name)

puts "###### ТЕКУЩИЕ СТАНЦИИ ######"
route.stations.each { |s| puts s }
puts "#############################"

puts "Удаление станци из маршрута"
puts route.delete_station(station_two.name)

puts "###### ТЕКУЩИЕ СТАНЦИИ ######"
route.stations.each { |s| puts s }
puts "#############################"

puts "Создание поезда"
train1 = Train.new(11, :cargo, 0)
train2 = Train.new(222, :cargo, 0)
train3 = Train.new(3333, :passanger, 8)
puts "Манипуляции со скоростью"
10.times { train1.gain_speed }
puts train1.current_speed
puts train1.stop
puts train1.current_speed
puts "Манипуляции с вагонами"
6.times { train1.hitch_wagon }
puts train1.show_qnt_wagon
puts train1.unhook_wagon
puts train1.show_qnt_wagon
puts "Инспекция объекта train1"
p train1
puts "Инспекция объекта train2"
p train2
puts "Инспекция объекта train3"
p train3

puts "Добавление поезда станции"
station_one.coming_train(train1)
station_one.coming_train(train2)
station_one.coming_train(train3)
puts "Поеазда на станци '#{station_one.name}'"
station_one.trains.each { |t| puts "№ #{t.number}" }

puts "Количество и тип поезда на станции"
puts station_one.show_trains_by_types(:cargo)
puts station_one.show_trains_by_types(:passanger)

puts "Получение маршрута train1"
train1.route = route
p train1.route
p train1.current_station
p train1.forward
p train1.forward
p train1.forward
p train1.forward
p train1.forward
p train1.current_station
p train1.backward


p train1.backward
p train1.current_station

p train1.next_stantion
p train1.current_station
p train1.prev_stantion

p station_one.show_trains_by_types(:cargo)






