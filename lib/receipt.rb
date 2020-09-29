require 'date'
require './lib/voucher'

class Receipt
  attr_reader :dateTime, :name, :address, :number, :voucher, :customer_order

  def initialize(name, address, number, voucher, table, customers, customer_order)
    @name = name
    @address = address
    @number = number
    @voucher = voucher
    @dateTime = DateTime.now().strftime("%Y.%m.%d %H:%M:%S")
    @table = table
    @customers = customers
    @customer_order = customer_order
  end

  def table_details 
    "Table #{@table} / #{@customers.length}" + "\n" + "#{@customers.join(',')}"
  end
end