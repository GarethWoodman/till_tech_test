require 'date'

class Receipt
  attr_reader :dateTime, :name, :address, :number

  def initialize(name, address, number)
    @name = name
    @address = address
    @number = number
    @dateTime = DateTime.now().strftime("%Y.%m.%d %H:%M:%S")
  end
end