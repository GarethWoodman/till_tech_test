require 'date'

class Receipt
  attr_reader :dateTime, :name

  def initialize(name)
    @name = name
    @dateTime = DateTime.now().strftime("%Y.%m.%d %H:%M:%S")
  end
end