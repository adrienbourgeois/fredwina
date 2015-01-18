class Position
  attr_accessor :x, :y

  def initialize(x,y)
    @x = x
    @y = y
  end

  def equal?(position)
    @x == position.x && @y == position.y
  end
end