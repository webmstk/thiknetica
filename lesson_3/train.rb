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
  attr_accessor :speed, :qnt_wagon, :route, :current_route
  attr_reader   :name, :type

  def initialize(name, number, type, qnt_wagon, speed: 0)
    @name           = name
    @number         = number
    @type           = type
    @qnt_wagon      = qnt_wagon
    @speed          = speed
    @route          = []
  end
  # Может набирать скорость
  def gain_speed
    @speed += 10
    "Скорость увеличина на #{@speed} км\\ч"
  end
  # Может показывать текущую скорость
  def current_speed
    "Текущуая скорость: #{@speed} км\\ч"
  end
  # Может тормозить (сбрасывать скорость до нуля)
  def stop
    @speed = 0
    "Поезд остановлен"
  end
  # Может показывать количество вагонов
  def show_qnt_wagon
    "Количество вагонов у #{@name} = #{@qnt_wagon}"
  end
  # Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов).
  # Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
  def hitch_wagon
    @qnt_wagon += 1 if @speed.zero?
    "Вагон присоединен"
  end
  def unhook_wagon
    @qnt_wagon -= 1 if @speed.zero? && @qnt_wagon != 0
    "Вагон отсоединен"
  end
  # Может принимать маршрут следования (объект класса Route)
  def take_routes(station)
    @route          = station
    @index_stsation = @route.index(station[0])
    @current_route  = @route[@index_stsation]
  end
  # Может перемещаться между станциями, указанными в маршруте. Вперед\назад
  def forward
    if @route.size > @index_stsation + 1
      @current_route = @route[@index_stsation += 1]
    else
      "Вы на конечной станции"
    end
  end
  def backward
    unless @index_stsation.zero?
      @current_route = @route[@index_stsation -= 1]
    else
      "Вы на начальной станции"
    end
  end
  # Показывать предыдущую станцию, текущую, следующую, на основе маршрута
  def what_previous_station
    "Предыдущая станция #{@route[@index_stsation - 1]}"
  end
  def current_station
    "Текущуая станция #{@current_route}"
  end
  def what_next_station
    "Следующуя станция #{@route[@index_stsation + 1]}"
  end


end
