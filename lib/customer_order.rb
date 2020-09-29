require "json"


class CustomerOrder
  attr_reader :orders

  def initialize
    get_json
    @orders = {}
  end

  def add(item)
    price = @data[0]["prices"][0]
    @orders[item] = {price: price[item], quantity: 1}
  end

  def print
    listed_orders = []

    @orders.each do |item, values|
      listed_orders << "#{item} #{values[:quantity]} x #{values[:price]}"
    end

    listed_orders.join("\n")
  end

  private 
  def get_json
    file = File.open "./hipstercoffee.json"
    @data = JSON.load file
    file.close
  end
end