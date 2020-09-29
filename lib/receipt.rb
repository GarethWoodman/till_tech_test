require 'date'

class Receipt
  attr_reader :dateTime

  def initialize
   @dateTime = DateTime.now().strftime("%Y.%m.%d %H:%M:%S")
  end
end