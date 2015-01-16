class Paddock
  def initialize(paddock_coord,dogs)
    @paddock_coord = paddock_coord
    @dogs = dogs
  end

  def give_order_to(dog_id,order)
    @dogs[dog_id].execute(order)
  end
end