require './lib/voucher'
require 'date'

describe 'Voucher' do
  before :each do
    @percentage = 10
  end

  subject { Voucher.new(10)}

  it "prints percentage" do
    expect(subject.percentage).to eq 10
  end
end