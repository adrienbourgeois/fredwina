class Paddock
  def initialize(paddock_coord,dogs)
    @paddock_coord = paddock_coord
    @dogs = dogs
  end

  def give_order_to(dog_id,order)
    @dogs[dog_id].execute(order)
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
      str += "#{dog.x} #{dog.y} #{dog.orientation}\n"
    end
    return str
  end

  def free?(coord)
    @dogs.each do |dog|
      return false if dog.x == coord[0] && dog.y == coord[1]
    end
    return true
  end

  def out_of_bound?(coord)
    return true if @paddock_coord[0] < coord[0] || @paddock_coord[1] < coord[1]
    return false
  end

end