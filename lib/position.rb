class Position
  attr_accessor :x, :y, :direction

  def initialize(opts)
    raise "Coordinates not valid" unless opts[0].is_a?(Integer) && opts[1].is_a?(Integer)
    @x = opts[0]
    @y = opts[1]
    if opts[2]
      @direction = Direction.new(opts[2])
    end
  end

  def equal?(position)
    @x == position.x && @y == position.y
  end

  def move
    if @direction.north? then @y += 1
    elsif @direction.south? then @y -= 1
    elsif @direction.east? then @x += 1
    elsif @direction.west? then @x -= 1
    end
    return self
  end
end