require "json"

class CustomerOrder
  attr_reader :orders

  def initialize
    get_json
    @orders = {}
    @tax_rate = 0.0864
  end

  def add(item)
    item_prices = @data[0]["prices"][0]
    if @orders[item] 
      @orders[item][:quantity] += 1 
    else
       @orders[item] = {price: item_prices[item], quantity: 1}
    end
  end

  def list
    listed_orders = []

    @orders.each do |item, values|
      listed_orders << "#{item} #{values[:quantity]} x #{ '%.2f' % values[:price]}"
    end

    listed_orders.join("\n")
  end

  def total
    sum = 0
    @orders.each do |item, values|
      sum += ( values[:price] * values[:quantity] )
    end
    '%.2f' % sum
  end

  def tax
    '%.2f' % (total.to_f * @tax_rate)
  end

  private 
  def get_json
    file = File.open "./hipstercoffee.json"
    @data = JSON.load file
    file.close
  end
end