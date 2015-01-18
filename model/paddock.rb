class Paddock
  def initialize(paddock_coord,dogs)
    @paddock_coord = Position.new(paddock_coord)
    @dogs = []
    dogs.each do |dog|
      raise "Dogs initial position have to be inside the paddock" if self.out_of_bound?(dog.position)
      raise "Dogs cannot have the same initial position" unless self.free?(dog.position)
      @dogs << dog 
    end
  end

  def give_order_to(dog_id,order)
    @dogs[dog_id].execute(self,order)
  end

  def execute_orders(orders)
    orders.each do |sequence_orders|
      sequence_orders.each_with_index do |dog_order,dog_index|
        self.give_order_to(dog_index,dog_order)
      end
    end
  end

  def helicopter_view
    return @dogs.inject("") do |str,dog|
      str + "#{dog.position.x} #{dog.position.y} #{dog.position.direction.value}\n"
    end
  end

  def free?(position)
    @dogs.each { |dog| return false if dog.position.equal?(position) }
    return true
  end

  def out_of_bound?(position)
    return true if @paddock_coord.x < position.x || @paddock_coord.y < position.y
    return false
  end

end