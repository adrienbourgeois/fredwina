module Fredwina
  # file_name is the address of the file containing the coords of the top right of the paddock
  # plus the dogs instructions
  def Fredwina.move(file_name)
    f = File.open(file_name)
    parser = Parser.new(f)
    begin
      paddock = parser.paddock
      shepherd = Shepherd.new(paddock)
      shepherd.execute_orders(parser.orders)
    rescue Exception => e
      return e.message
    end
    return paddock.helicopter_view
  end
end