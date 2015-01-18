class Dog
  attr_reader :position,:direction

  def initialize(opts)
    @position = Position.new(opts)
  end

  def turn(direction)
    if direction == 'L'
      @position.direction.left
    elsif direction == 'R'
      @position.direction.right
    end
  end

  def move
    return @position.clone.move
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