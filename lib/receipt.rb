require 'date'

class Receipt
  attr_reader :dateTime, :name, :address

  def initialize(name, address)
    @name = name
    @address = address
    @dateTime = DateTime.now().strftime("%Y.%m.%d %H:%M:%S")
  end
end