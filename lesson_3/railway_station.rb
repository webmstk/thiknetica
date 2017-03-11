=begin
Класс Station (Станция):
Имеет название, которое указывается при ее создании
Может принимать поезда (по одному за раз)
Может показывать список всех поездов на станции, находящиеся в текущий момент
Может показывать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
=end

class RailwayStation
  attr_accessor :train_list
  # Имеет название, которое указывается при ее создании
  def initialize(name_station)
    @name_station = name_station
    @train_list   = []
  end
  # Может принимать поезда (по одному за раз)
  def coming_train(train)
    @train_list.push(train)
  end
  # Может показывать список всех поездов на станции, находящиеся в текущий момент
  def show_trains_on_station
    @train_list.each {|k| puts k.name}
  end
  # Может показывать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
  def show_types_trains_on_station
    types_train = Hash.new(0)
    @train_list.map do |k|
      types_train[k.type] += 1
    end
    puts "Количество грузовых, пассажирских на станции"
    types_train.each { |train, qnt| puts "#{train} = #{qnt}"}
  end
  # Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
  def leave_train(train)
    @train_list.delete(train)
  end

end
