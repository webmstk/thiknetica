require_relative "railway_station"
require_relative "route"
require_relative "train"

station1 = RailwayStation.new("Station_start")
station2 = RailwayStation.new("Station_end")
route1 = Route.new(station1, station2)

station3 = RailwayStation.new("Station1")
station4 = RailwayStation.new("Station2")
station5 = RailwayStation.new("Station3")

route1.add_station(station3)
route1.add_station(station4)
route1.add_station(station5)
route1.delete_station(station3)

train1 = Train.new(100, Train::TYPE_CARGO, 0)
train1.get_route = route1

train1.forward
train1.forward
train1.forward

p station2.show_trains_by_types(:cargo).size






