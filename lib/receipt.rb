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
    "Table #{@table} / [#{@customers.length}]\n#{@customers.join(',')}"
  end

  def print
    printed_receipt = @dateTime + "\n"
    printed_receipt += @name + "\n\n"
    printed_receipt += @address + "\n"
    printed_receipt += @number + "\n.\n"
    printed_receipt += @voucher.print + "\n"
    printed_receipt += table_details + "\n"
    printed_receipt += "#{@customer_order.list}\n\n"
    printed_receipt += "Tax: #{@customer_order.tax}\n"
    printed_receipt += "Total: #{@customer_order.total}"

    printed_receipt
  end
end