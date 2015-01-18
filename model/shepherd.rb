class Shepherd
  def initialize(paddock)
    @paddock = paddock
  end

  def give_order_to(dog_id,order)
    raise "Dog with id #{dog_id} does not exist" unless dog = @paddock.dogs[dog_id]
    dog.execute(self,order)
  end

  def execute_orders(orders)
    orders.each do |sequence_orders|
      sequence_orders.each_with_index do |dog_order,dog_index|
        self.give_order_to(dog_index,dog_order)
      end
    end
  end

end