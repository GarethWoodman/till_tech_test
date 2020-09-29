require './lib/receipt'
require 'date'

describe 'Receipt' do
  before :each do
    @currentDateTime = DateTime.now().strftime("%Y.%m.%d %H:%M:%S")
    @name = "The Coffee Connection"
    @address = "123 Lakeside Way"
  end

  subject { Receipt.new(@name, @address) }

  it "prints current date and time" do
    expect(subject.dateTime).to eq @currentDateTime
  end

  it "prints name of cafe" do
    expect(subject.name).to eq @name
  end

  it "prints address" do
    expect(subject.address).to eq @address
  end
end