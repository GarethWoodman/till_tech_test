require './lib/receipt'
require 'date'

describe 'Receipt' do
  before :each do
    @currentDateTime = DateTime.now().strftime("%Y.%m.%d %H:%M:%S")
    @name = "The Coffee Connection"
    @address = "123 Lakeside Way"
    @number = "+1 (650) 360-0708"
  end

  subject { Receipt.new(@name, @address, @number) }

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
end