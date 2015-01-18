class Direction
  # Intialization:
  # direction has to be a valid cardinal point
  def initialize(direction)
    raise "Invalid cardinal point" unless ['N','E','S','W'].include?(direction)
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

  # Turn to the left and change the state of direction accordingly
  def left
    case @direction
    when 'W' then @direction = 'S'
    when 'N' then @direction = 'W'
    when 'E' then @direction = 'N'
    when 'S' then @direction = 'E'
    end
  end

  # Turn to the right and change the state of direction accordingly
  def right
    case @direction
    when 'W' then @direction = 'N'
    when 'N' then @direction = 'E'
    when 'E' then @direction = 'S'
    when 'S' then @direction = 'W'
    end
  end

  # Return the current direction
  def value
    @direction
  end

end