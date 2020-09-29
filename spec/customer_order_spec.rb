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
    expect(subject.list).to eq "#{item} 1 x #{prices[item]}"
  end

  context 'calculate orders' do
    before(:each) do
      subject.add("Cappucino")
      2.times { subject.add("Cafe Latte") }
      3.times { subject.add("Flat White") }

      @order_statement = "Cappucino 1 x #{prices["Cappucino"]}\n" 
      @order_statement += "Cafe Latte 2 x #{prices["Cafe Latte"]}\n"
      @order_statement += "Flat White 3 x #{prices["Flat White"]}"

      @total = prices["Cappucino"] + (prices["Cafe Latte"] * 2) + (prices["Flat White"] * 3)
      
      @total = '%.2f' % @total 
      @tax = '%.2f' % (@total.to_f * 0.0864)
    end

    it "prints multiple orders" do
      expect(subject.list).to eq @order_statement
    end

    it "calculates total" do
      expect(subject.total).to eq @total 
    end

    it "calculates tax" do
      expect(subject.tax).to eq @tax
    end
  end
end