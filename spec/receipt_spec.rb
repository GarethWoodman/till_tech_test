require './lib/receipt'
require './lib/voucher'
require './lib/customer_order'
require './spec/helpers'
require 'date'

RSpec.configure do |c|
  c.include Helpers
end

describe 'Receipt' do
  before :each do
    @currentDateTime = DateTime.now().strftime("%Y.%m.%d %H:%M:%S")
    @name = "The Coffee Connection"
    @address = "123 Lakeside Way"
    @number = "+1 (650) 360-0708"
    @table = '1'
    @customers = ['Max', 'Sam', 'Deb', 'Sarah']
    @table_details = "Table #{@table} / [#{@customers.length}]" + "\n" + "#{@customers.join(',')}"
  end

  subject { Receipt.new(@name, @address, @number, voucher, @table, @customers, customer_order) }

  it "prints current date and time" do
    expect(subject.dateTime).to eq @currentDateTime
  end

  it "prints name of cafe" do
    expect(subject.name).to eq @name
  end

  it "prints address" do
    expect(subject.address).to eq @address
  end

  it "prints phone number" do
    expect(subject.number).to eq @number
  end

  it "includes voucher" do
    expect(subject.voucher).to be_an_instance_of Voucher
  end

  it "prints table details" do
    expect(subject.table_details).to eq @table_details
  end

  it "includes customer orders" do
    expect(subject.customer_order).to be_an_instance_of CustomerOrder
  end

  it "prints complete receipt" do
    printed_receipt = @currentDateTime + "\n"
    printed_receipt += @name + "\n\n"
    printed_receipt += @address + "\n"
    printed_receipt += @number + "\n.\n"
    printed_receipt += subject.voucher.print + "\n"
    printed_receipt += @table_details + "\n"
    printed_receipt += "#{subject.customer_order.list}\n\n"
    printed_receipt += "Tax: #{subject.customer_order.tax}\n"
    printed_receipt += "Total: #{subject.customer_order.total}"

    puts printed_receipt

    expect(subject.print).to eq printed_receipt
  end
end