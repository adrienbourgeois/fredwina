class Dog
  attr_reader :position

  # opts contains the definition of the position of the dog
  # e.g. [1,2,'W']
  def initialize(opts)
    @position = Position.new(opts)
  end

  # order the dog to turn
  # direction is either L for left or R for right
  def turn(direction)
    if direction == 'L'
      @position.direction.left
    elsif direction == 'R'
      @position.direction.right
    end
  end

  # returns the position that the dog would have if he would move
  def move
    return @position.clone.move
  end

  # order the dog to move according to his direction
  # paddock is the paddock containing the dog
  def move!(paddock)
    future_position = self.move
    raise "Dogs have to stay inside of the paddock" if paddock.out_of_bound?(future_position)
    raise "Dogs cannot bump into each other" unless paddock.free?(future_position)
    @position = future_position
  end

  # Execute the order that can be of 'move' type or 'turn' type
  # order has to be 'M', 'L', 'R' or nil
  # nil won't do anything
  # If the order is anything else, an error is raised
  def execute(paddock,order)
    if order == 'M' then self.move!(paddock)
    elsif ['L','R'].include?(order) then self.turn(order)
    elsif order then raise "Invalid order"
    end
  end

end