=begin
Класс Station (Станция):
Имеет название, которое указывается при ее создании
Может принимать поезда (по одному за раз)
Может показывать список всех поездов на станции, находящиеся в текущий момент
Может показывать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
=end

class RailwayStation

  attr_reader :trains, :name
  # Имеет название, которое указывается при ее создании
  def initialize(name)
    @name = name
    @trains = []
  end
  # Может принимать поезда (по одному за раз)
  def coming_train(train)
    @trains << train
  end
  # Может показывать список всех поездов на станции, находящиеся в текущий момент
  # Может показывать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
  def show_trains_by_types(type)
    @trains.select { |train| train.type == type}
  end
  # Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
  def leave_train(train)
    @trains.delete(train)
  end

end