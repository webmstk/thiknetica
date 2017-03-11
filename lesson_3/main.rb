require_relative "route"
require_relative "train"
require_relative "railway_station"

# Добавление маршрутов (start_staion, end_station)
route_train1 = Route.new("start", "end")
route_train1.add_station("middle1")
route_train1.add_station("middle2")
route_train1.add_station("middle3")
route_train1.add_station("middle4")
route_train1.add_station("middle5")
route_train1.show_all_stations
route_train1.delete_station("middle2")
route_train1.show_all_stations

route_train2 = Route.new("start", "end")
route_train2.add_station("middle1")
route_train2.add_station("middle2")
route_train2.add_station("middle3")
route_train2.add_station("middle4")
route_train2.add_station("middle5")
route_train2.show_all_stations
route_train2.delete_station("middle4")
route_train2.show_all_stations

# Добавление поездов (name, type, qnt_wagon, speed: 0)
train1 = Train.new("cargo train", :cargo, 5)
train1.take_routes(route_train1.route_list)
train1.show_qnt_wagon
train1.current_station
train1.gain_speed
train1.gain_speed
train1.gain_speed
train1.current_speed
train1.stop
train1.hitch_wagon
train1.hitch_wagon
train1.hitch_wagon
train1.show_qnt_wagon
train1.forward
train1.forward
train1.current_station
train1.backward
train1.current_station

train2 = Train.new("passanger train", :passanger, 8)
train3 = Train.new("passanger train 3", :passanger, 8)

# Станция
railway = RailwayStation.new("start")

railway.coming_train(train1)
railway.coming_train(train2)
railway.coming_train(train3)
puts "Текущие поезда"
railway.show_trains_on_station
railway.show_types_trains_on_station
