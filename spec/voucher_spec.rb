require './lib/voucher'
require 'date'

describe 'Voucher' do
  before :each do
    @percentage = 10
    @name = 'Muffins'
  end

  subject { Voucher.new(@percentage, @name)}

  it "prints percentage" do
    expect(subject.percentage).to eq @percentage
  end

  it "prints name of offer" do
    expect(subject.name).to eq @name
  end
end