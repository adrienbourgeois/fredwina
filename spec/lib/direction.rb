class Direction
  def initialize(direction)
    @direction = direction
  end

  def west?
    @direction == 'W'
  end

  def east?
    @direction == 'E'
  end

  def north?
    @direction == 'N'
  end

  def south?
    @direction == 'S'
  end

  def left
    case @direction
    when 'W' then @direction = 'S'
    when 'N' then @direction = 'W'
    when 'E' then @direction = 'N'
    when 'S' then @direction = 'E'
    end
  end

  def right
    case @direction
    when 'W' then @direction = 'N'
    when 'N' then @direction = 'E'
    when 'E' then @direction = 'S'
    when 'S' then @direction = 'W'
    end
  end

end