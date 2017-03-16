=begin
Класс Train (Поезд):
Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные указываются при создании экземпляра класса
Может набирать скорость
Может показывать текущую скорость
Может тормозить (сбрасывать скорость до нуля)
Может показывать количество вагонов
Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
Может принимать маршрут следования (объект класса Route)
Может перемещаться между станциями, указанными в маршруте.
Показывать предыдущую станцию, текущую, следующую, на основе маршрута
=end

class Train
# Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные указываются при создании экземпляра класса
  # attr_accessor :speed, :qnt_wagon

  TYPE_PASSANGER  = :passanger
  TYPE_CARGO      = :cargo

  attr_reader   :number, :type, :speed, :qnt_wagon, :current_route

  def initialize(number, type, qnt_wagon)
    @number                 = number
    @type                   = type
    @qnt_wagon              = qnt_wagon
    @speed                  = 0
    @current_route_id       = 0
  end
  # Может набирать скорость
  def gain_speed
    @speed += 10
  end
  # Может показывать текущую скорость attr speed
  # Может тормозить (сбрасывать скорость до нуля)
  def stop
    @speed = 0
  end
  # Может показывать количество вагонов attr qnt_wagon
  # Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов).
  # Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
  def hitch_wagon
    @qnt_wagon += 1 if stopped?
  end
  def unhook_wagon
    @qnt_wagon -= 1 if stopped? && @qnt_wagon > 0
  end
  # Может принимать маршрут следования (объект класса Route)
  def get_route=(route)
    @route = route.stations
    @current_route = route.stations[@current_route_id]
  end

  # Может перемещаться между станциями, указанными в маршруте. Вперед\назад
  def forward
    leave
    @current_route = @route[@current_route_id += 1]
    go_to_station
  end

  def backward
    leave
    @current_route = @route[@current_route_id -= 1]
    go_to_station
  end

  # Показывать предыдущую станцию, текущую, следующую, на основе маршрута

  private

  def stopped?
    @speed.zero?
  end

  def leave
    @route[@current_route_id].leave_train(self)
  end

  def go_to_station
    @route[@current_route_id].coming_train(self)
  end

end
