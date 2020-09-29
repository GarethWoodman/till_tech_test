require './lib/voucher'
require 'date'

describe 'Voucher' do
  before :each do
    @percentage = 10
    @name = 'Muffins'
    @offer = "Voucher #{@percentage}% Off All #{@name}"
  end

  subject { Voucher.new(@percentage, @name)}

  it "prints percentage" do
    expect(subject.percentage).to eq @percentage
  end

  it "prints name of offer" do
    expect(subject.name).to eq @name
  end

  it "prints full offer details" do
    expect(subject.offer).to eq @offer
  end
end