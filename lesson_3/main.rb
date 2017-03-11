require_relative "route"
require_relative "train"
require_relative "railway_station"

# Добавление маршрутов (start_staion, end_station)
route_train1 = Route.new(["start", "end"])
route_train1.add_station("middle1")
route_train1.add_station("middle2")
route_train1.add_station("middle3")
route_train1.add_station("middle4")
route_train1.add_station("middle5")
route_train1.stations
route_train1.delete_station("middle2")
route_train1.stations

route_train2 = Route.new(["start", "end"])
route_train2.add_station("middle1")
route_train2.add_station("middle2")
route_train2.add_station("middle3")
route_train2.add_station("middle4")
route_train2.add_station("middle5")
route_train2.stations
route_train2.delete_station("middle4")
route_train2.stations

# Добавление поездов (name, type, qnt_wagon, speed: 0)
train1 = Train.new("cargo train_1", 1, :cargo, 5)
train1.take_routes(route_train1.stations)
p train1.show_qnt_wagon
p train1.current_station
p train1.gain_speed
p train1.gain_speed
p train1.gain_speed
p train1.current_speed
p train1.stop
p train1.hitch_wagon
p train1.hitch_wagon
p train1.hitch_wagon
p train1.unhook_wagon
p train1.show_qnt_wagon
p train1.forward
p train1.forward
p train1.forward
p train1.forward
p train1.current_station
p train1.forward
p train1.forward
p train1.forward
p train1.route
p train1.current_station
p train1.backward
p train1.backward
p train1.backward
p train1.backward
p train1.backward
p train1.backward
p train1.backward
p train1.backward
p train1.backward
p train1.backward
p train1.current_station





puts "индекс", train1.current_station

train2 = Train.new("passanger train_1", 2, :passanger, 8)
train3 = Train.new("passanger train_2", 3, :passanger, 8)

# Станция
puts "################################## ОБЪЯВЛЕНИЕ СТАНЦИЙ"
railway = RailwayStation.new("start")
railway.coming_train(train1)
railway.coming_train(train2)
railway.coming_train(train3)

puts "Текущие поезда"
railway.show_trains_on_station
p railway.show_types_trains_on_station(:passanger)
# railway.leave_train(train1)
# railway.show_types_trains_on_station
# railway.show_trains_on_station

