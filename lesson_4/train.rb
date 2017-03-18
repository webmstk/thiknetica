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

  attr_reader   :number, :type, :speed, :current_routem, :wagon

  def initialize(number)
    @number                 = number
    @type                   = self.class
    @speed                  = 0
    @current_station_id     = 0
    @wagon                  = []
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

  def hitch_wagon(wagon)
    if stopped? && ( wagon.is_a?(wagon_type) )
      @wagon << wagon
    end
  end
  def unhook_wagon(wagon)
    if stopped? && ( wagon.is_a?(wagon_type) )
      @wagon.pop
    end
  end
  # Может принимать маршрут следования (объект класса Route)
  def get_route=(route)
    @route = route.stations
  end

  # Количество вагонов
  def qnt_wagon
    @wagon.size
  end

  # Может перемещаться между станциями, указанными в маршруте. Вперед\назад
  def forward
    unless current_station == last_route
      leave
      @current_station_id += 1
      go_to_station
    end
  end

  def backward
    unless current_station == first_route
      leave
      @current_station_id -= 1
      go_to_station
    end
  end

  # Показывать предыдущую станцию, текущую, следующую, на основе маршрута
  def current_station
    @route[@current_station_id]
  end

  def next_station
    @route[@current_station_id + 1] if current_station != last_route
  end
  def prev_station
    @route[@current_station_id - 1] if current_station != first_route
  end

  # protected

  def first_route
    @route.first
  end

  def last_route
    @route.last
  end

  def stopped?
    @speed.zero?
  end

  def leave
    self.current_station.leave_train(self)
  end

  def go_to_station
    current_station.coming_train(self)
  end

  def wagon_type
    # Переопределить в дочерних
  end


end
