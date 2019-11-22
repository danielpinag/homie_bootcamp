class Car

  def initialize(brand, color, year)
    @brand = brand
    @color = color
    @year = year
    @start_car = false
  end

  def start_car
    @start_car = true
    puts "El coche ha arrancado"
  end

  def start_trip
    raise "El coche no ha sido arrancado" unless @start_car

    @start_trip = true
    @finish_trip = false
    puts "El viaje ha iniciado"
  end

  def finish_trip
    raise "No se puede finalizar un viaje que no ha iniciado" unless @start_trip

    @finish_trip = true
    @start_car = false
    @start_trip = false
    puts "El viaje ha finalizado"
  end
end

ferrari = Car.new("Ferrari", "Red", "1997")

ferrari.start_car
ferrari.start_trip
ferrari.finish_trip