require "json"


class CustomerOrder
  attr_reader :orders

  def initialize
    get_json
    @orders = {}
  end

  def add(item)
    item_prices = @data[0]["prices"][0]
    if @orders[item] 
      @orders[item][:quantity] += 1 
      @orders[item][:price] = item_prices[item] * @orders[item][:quantity]
    else
       @orders[item] = {price: item_prices[item], quantity: 1}
    end
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