class Paddock
  attr_reader :dogs
  
  def initialize(paddock_coord,dogs)
    @paddock_coord = Position.new(paddock_coord)
    @dogs = []
    dogs.each do |dog|
      raise "Dogs initial position have to be inside the paddock" if self.out_of_bound?(dog.position)
      raise "Dogs cannot have the same initial position" unless self.free?(dog.position)
      @dogs << dog 
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