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
    x = @x
    y = @y
    case @orientation
    when 'N' then y += 1
    when 'S' then y -= 1
    when 'E' then x += 1
    when 'W' then x -= 1
    end
    return [x,y]
  end

  def move!(paddock)
    new_coord = self.move
    raise "Dogs have to stay inside of the paddock" if paddock.out_of_bound?(new_coord)
    raise "Dogs cannot bump into each other" unless paddock.free?(new_coord)
    @x = new_coord[0]
    @y = new_coord[1]
  end

  def execute(paddock,order)
    if order == 'M' then self.move!(paddock)
    else self.turn(order)
    end
  end

end