class Dog
  attr_reader :position,:direction

  def initialize(opts)
    @position = Position.new(opts[0],opts[1])
    @direction = Direction.new(opts[2])
  end

  def turn(direction)
    if direction == 'L'
      @direction.left
    elsif direction == 'R'
      @direction.right
    end
  end

  def move
    position = @position.clone
    if @direction.north? then position.y += 1
    elsif @direction.south? then position.y -= 1
    elsif @direction.east? then position.x += 1
    elsif @direction.west? then position.x -= 1
    end
    return position
  end

  def move!(paddock)
    future_position = self.move
    raise "Dogs have to stay inside of the paddock" if paddock.out_of_bound?(future_position)
    raise "Dogs cannot bump into each other" unless paddock.free?(future_position)
    @position = future_position
  end

  def execute(paddock,order)
    if order == 'M' then self.move!(paddock)
    else self.turn(order)
    end
  end

end