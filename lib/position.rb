class Position
  attr_accessor :x, :y

  def initialize(x,y)
    @x = x
    @y = y
  end

  def equal?(position)
    @x == position.x && @y == position.y
  end

  def move(direction)
    if direction.north? then @y += 1
    elsif direction.south? then @y -= 1
    elsif direction.east? then @x += 1
    elsif direction.west? then @x -= 1
    end
    return self
  end
end