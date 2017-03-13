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
  attr_accessor :speed, :qnt_wagon
  attr_reader   :number, :type, :route

  def initialize(number, type, qnt_wagon)
    @number         = number
    @type           = type
    @qnt_wagon      = qnt_wagon
    @speed          = 0
    @route_id       = 0
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
    "Количество вагонов у поезда №#{@number} = #{@qnt_wagon}"
  end
  # Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов).
  # Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
  def hitch_wagon
    if @speed.zero?
      @qnt_wagon += 1
      "Вагон присоединен"
    end
  end
  def unhook_wagon
    if @speed.zero? && @qnt_wagon > 0
      @qnt_wagon -= 1
      "Вагон отсоединен"
    end
  end
  # Может принимать маршрут следования (объект класса Route)
  def route=(route)
    @route = route.stations
  end
  def current_station
    @current_station = @route[@route_id]
    "Текущуая станция #{@current_station}"
  end
  # Может перемещаться между станциями, указанными в маршруте. Вперед\назад
  def forward
    unless @current_station == @route.last
      @current_station = @route[@route_id += 1]
    else
      "Вперед некуда"
    end
  end
  def backward
    unless @current_station == @route.first
      @current_station = @route[@route_id -= 1]
    else
      "Назад некуда"
    end
  end

  # Показывать предыдущую станцию, текущую, следующую, на основе маршрута
  def next_stantion
    unless @current_station == @route.last
      "След станция - #{@route[@route_id + 1]}"
    else
      "Вперед некуда"
    end
  end
  def prev_stantion
    unless @current_station == @route.first
      "Предыдущуя станция - #{@route[@route_id - 1]}"
    else
      "Назад некуда"
    end
  end

end
