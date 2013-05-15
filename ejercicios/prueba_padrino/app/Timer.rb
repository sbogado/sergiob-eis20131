class ControladorDeTiempo
  def initialize(code)
    @time = 0
  end

  attr_accessor :time

  def termina
    @time == 60
  end
end
