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
  attr_accessor :speed, :qnt_wagon, :train_route, :current_route

  def initialize(name, type, qnt_wagon, speed: 0)
    @name           = name
    @type           = type
    @qnt_wagon      = qnt_wagon
    @speed          = speed
    @train_routes   = []
  end
  # Может набирать скорость
  def gain_speed
    @speed += 10
    puts "Скорость увеличина на #{@speed} км\\ч"
  end
  # Может показывать текущую скорость
  def current_speed
    puts "Текущуая скорость: #{@speed} км\\ч"
  end
  # Может тормозить (сбрасывать скорость до нуля)
  def stop
    @speed = 0
    puts "Поезд остановлен"
  end
  # Может показывать количество вагонов
  def show_qnt_wagon
    puts "Количество вагонов у #{@name} = #{@qnt_wagon}"
  end
  # Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов).
  # Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
  def hitch_wagon
    @qnt_wagon += 1 if @speed.zero?
    puts "Вагон присоединен"
  end
  def unhook_wagon
    @qnt_wagon -= 1 if @speed.zero?
    puts "Вагон отсоединен"
  end
  # Может принимать маршрут следования (объект класса Route)
  def take_routes(train_route)
    @train_routes   = train_route
    @current_route  = train_route[0]
    puts "Текущуая станция #{@current_route}"
  end
  # Может перемещаться между станциями, указанными в маршруте. Вперед\назад
  def forward
    @current_route  = @train_routes[how_index_current_station + 1]
  end
  def backward
    @current_route  = @train_routes[how_index_current_station - 1]
  end
  # Показывать предыдущую станцию, текущую, следующую, на основе маршрута
  def what_next_station
    puts "Следующуя станция #{@train_routes[how_index_current_station + 1]}"
  end
  def current_station
    puts "Текущуая станция #{@current_route}"
  end
  def what_previous_station
    puts "Предыдущая станция #{@train_routes[how_index_current_station - 1]}"
  end

  private
    def how_index_current_station
      @index_stsation = @train_routes.index(@current_route)
    end

end
