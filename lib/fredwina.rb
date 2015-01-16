module Fredwina
  def Fredwina.move(file_name)
    f = File.open(file_name)
    parser = Parser.new(f)
    paddock = Paddock.new(parser.paddock_coord,parser.dogs)
    paddock.execute_orders(parser.orders)
    return paddock.helicopter_view
  end
end