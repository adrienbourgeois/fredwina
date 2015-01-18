class Dog
  attr_reader :position,:orientation

  def initialize(opts)
    @position = Position.new(opts[0],opts[1])
    @orientation = opts[2]
  end

  def turn(direction)
    if direction == 'L'
      case @orientation
      when 'N' then @orientation = 'W'
      when 'W' then @orientation = 'S'
      when 'S' then @orientation = 'E'
      when 'E' then @orientation = 'N'
      end
    elsif direction == 'R'
      case @orientation
      when 'N' then @orientation = 'E'
      when 'E' then @orientation = 'S'
      when 'S' then @orientation = 'W'
      when 'W' then @orientation = 'N'
      end
    end
  end

  def move
    position = @position.clone
    case @orientation
    when 'N' then position.y += 1
    when 'S' then position.y -= 1
    when 'E' then position.x += 1
    when 'W' then position.x -= 1
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