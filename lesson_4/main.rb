require_relative "app"

app = App.new


app.create_station("start")
app.create_station("end")

app.create_station("start2")
app.create_station("end2")

app.create_route("start","end")
app.create_route("start2","end2")

app.create_train(1, 1)
app.create_train(2, 2)

# p app.find_train(1)
# p app.find_route("start", "end")
app.set_route(1, "start", "end")
app.add_wagon(1, PassangerWagon.new)
app.add_wagon(1, PassangerWagon.new)
app.add_wagon(1, PassangerWagon.new)
app.add_wagon(1, PassangerWagon.new)
app.del_wagon(1, PassangerWagon.new)
app.del_wagon(1, PassangerWagon.new)
app.del_wagon(1, PassangerWagon.new)
app.add_station_to_route("new_station", "start", "end")

p app.find_route("start", "end")






