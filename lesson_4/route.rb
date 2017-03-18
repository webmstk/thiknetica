=begin
Класс Route (Маршрут):
Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
Может добавлять промежуточную станцию в список
Может удалять промежуточную станцию из списка
Может выводить список всех станций по-порядку от начальной до конечной
=end

class Route

attr_reader :stations
# Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
  end
  # Может добавлять промежуточную станцию в список
  def add_station(station)
    @stations.insert(-2, station)
  end
  # Может удалять промежуточную станцию из списка
  def delete_station(station)
    @stations.delete(station)
  end
  # Может выводить список всех станций по-порядку от начальной до конечной attr_reader :sations
end
