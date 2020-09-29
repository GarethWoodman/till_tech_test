require './lib/customer_order'
require 'json'

def get_data
  file = File.open "./hipstercoffee.json"
  @data = JSON.load file
  file.close
  @data[0]["prices"][0]
end

describe 'Customer Order' do
  subject { CustomerOrder.new}
  prices = get_data()

  it "prints single order" do
    item = "Cafe Latte"
    subject.add(item)
    expect(subject.print).to eq "#{item} 1 x #{prices[item]}"
  end

  it "prints multiple orders" do
    subject.add("Cappucino")
    2.times { subject.add("Cafe Latte") }
    3.times { subject.add("Flat White") }

    order_statement = "Cappucino 1 x #{prices["Cappucino"]}\n" 
    order_statement += "Cafe Latte 2 x #{prices["Cafe Latte"] * 2}\n"
    order_statement += "Flat White 3 x #{prices["Flat White"] * 3}"

    expect(subject.print).to eq order_statement
  end
end