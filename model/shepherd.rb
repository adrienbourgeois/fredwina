class Shepherd
  def initialize(paddock)
    @paddock = paddock
  end

  # Give an order to the dog with id dog_id
  def give_order_to(dog_id,order)
    raise "Dog with id #{dog_id} does not exist" unless dog = @paddock.dogs[dog_id]
    dog.execute(@paddock,order)
  end

  # orders is an array of orders
  # e.g. [['M','L'],['M','R']]
  # Which means:
  # step 1:
  #   dog 1: move
  #   dog 2: turn left
  # step 2
  #   dog 1: move
  #   dog 2: turn right
  def execute_orders(orders)
    orders.each do |sequence_orders|
      sequence_orders.each_with_index do |dog_order,dog_index|
        self.give_order_to(dog_index,dog_order)
      end
    end
  end

end