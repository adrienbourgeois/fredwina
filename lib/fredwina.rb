module Fredwina
  def Fredwina.move(file_name)
    f = File.open(file_name)
    parser = Parser.new(f)
    begin
      paddock = Paddock.new(parser.paddock_coord,parser.dogs)
      shepherd = Shepherd.new(paddock)
      shepherd.execute_orders(parser.orders)
    rescue Exception => e
      return e.message
    end
    return paddock.helicopter_view
  end
end