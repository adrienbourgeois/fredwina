class Position
  attr_accessor :x, :y, :direction

  # opts is an array containing the position definition
  # e.g. [1,2] means a position with x = 1 and y = 2
  #      [3,5,'W'] means a position with x = 3, y = 5 and direction west
  def initialize(opts)
    raise "Coordinates not valid" unless opts[0].is_a?(Integer) && opts[1].is_a?(Integer)
    @x = opts[0]
    @y = opts[1]
    if opts[2]
      @direction = Direction.new(opts[2])
    end
  end

  # Two positions are equal if they have the same x and y (no matter the direction)
  def ==(position)
    @x == position.x && @y == position.y
  end

  # The position A is greater than the position B if one of the two coord of A 
  # is greater than the one of B
  # (so with that definition it is possible that A > B and B > A at the same time)
  def >(position)
    if @x > position.x || @y > position.y
      return true
    else
      return false
    end
  end

  # Execute a movement according to the direction
  def move
    if @direction.north? then @y += 1
    elsif @direction.south? then @y -= 1
    elsif @direction.east? then @x += 1
    elsif @direction.west? then @x -= 1
    end
    return self
  end
end