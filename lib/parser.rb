class Parser
  attr_reader :paddock, :dogs, :orders

  def initialize(file)
    @dogs = []
    str = file
    lines = str.read.split(/\r?\n/)

    # Coord
    coords = lines[0].split(" ")
    paddock_coord = [coords[0].to_i,coords[1].to_i]

    # Dogs and orders
    lines[1..-1].each_with_index do |line,index|
      # Dog position
      if index.even?
        position = line.split(" ")
        @dogs.push(Dog.new([position[0].to_i,position[1].to_i,position[2]]))
      # Dog orders
      else
        line_orders = line.split(//)
        if @orders
          if @orders.count < line_orders.count
            @orders.fill([].fill(nil,0,@orders.first.count),@orders.count,line_orders.count-@orders.count)
          else
            line_orders.fill(nil,line_orders.count,@orders.count-line_orders.count)
          end
          @orders = @orders.zip(line_orders).map{ |e| e.flatten }
        else @orders = line_orders.map{ |e| [e] }
        end
      end
    end

    # Paddock
    @paddock = Paddock.new(paddock_coord,@dogs)
  end
end