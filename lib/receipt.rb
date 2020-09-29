require 'date'
require './lib/voucher'

class Receipt
  attr_reader :dateTime, :name, :address, :number, :voucher

  def initialize(name, address, number, voucher)
    @name = name
    @address = address
    @number = number
    @voucher = voucher
    @dateTime = DateTime.now().strftime("%Y.%m.%d %H:%M:%S")
  end
end