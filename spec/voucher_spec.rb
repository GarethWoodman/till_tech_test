require './lib/voucher'
require 'date'

describe 'Voucher' do
  before :each do
    @percentage = 10
    @name = 'Muffins'
    @offer = "Voucher #{@percentage}% Off All #{@name}"
    @date_from = '01/06/2020'
    @date_to = '01/12/2020'
    @valid_dates = "Valid #{@date_from} to #{@date_to}"
  end

  subject { Voucher.new(@percentage, @name, @date_from, @date_to)}

  it "prints percentage" do
    expect(subject.percentage).to eq @percentage
  end

  it "prints name of offer" do
    expect(subject.name).to eq @name
  end

  it "prints full offer details" do
    expect(subject.offer).to eq @offer
  end

  it "prints date validity" do
    expect(subject.valid_dates).to eq @valid_dates
  end
end