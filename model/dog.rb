class Dog
  attr_reader :x,:y,:orientation

  def initialize(coords)
    @x = coords[0]
    @y = coords[1]
    @orientation = coords[2]
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
    case @orientation
    when 'N' then @y += 1
    when 'S' then @y -= 1
    when 'E' then @x += 1
    when 'W' then @x -= 1
    end
  end

  def execute(order)
    if order == 'M' then self.move
    else self.turn(order)
    end
  end

end