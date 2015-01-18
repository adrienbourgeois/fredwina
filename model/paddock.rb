class Paddock
  def initialize(paddock_coord,dogs)
    @paddock_coord = paddock_coord
    @dogs = []
    dogs.each do |dog|
      raise "Dogs initial position have to be inside the paddock" if self.out_of_bound?(dog.position)
      raise "Dogs cannot have the same initial position" unless self.free?(dog.position)
      @dogs << dog 
    end
    @dogs = dogs
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
    str = ""
    @dogs.each do |dog|
      str += "#{dog.position.x} #{dog.position.y} #{dog.orientation}\n"
    end
    return str
  end

  def free?(position)
    @dogs.each do |dog|
      return false if dog.position.equal?(position)
    end
    return true
  end

  def out_of_bound?(position)
    return true if @paddock_coord[0] < position.x || @paddock_coord[1] < position.y
    return false
  end

end