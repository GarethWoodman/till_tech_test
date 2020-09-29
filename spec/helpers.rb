require './lib/voucher'
require './lib/customer_order'

module Helpers
  def voucher
    Voucher.new(10, 'Muffins', '01/06/2020', '01/12/2020')
  end

  def customer_order
    customer_order = CustomerOrder.new

    customer_order.add("Cafe Latte")
    2.times { customer_order.add("Cafe Latte") }
    customer_order.add("Cappuccino")
    2.times { customer_order.add("Choc Mudcake") }
    customer_order.add("Choc Mousse")
    customer_order.add("Affogato")
    customer_order.add("Tiramisu")

    customer_order
  end
end