require './lib/customer_order'

describe 'Customer Order' do
  subject { CustomerOrder.new}

  it "prints single order" do
    subject.add("Cafe Latte")
    expect(subject.print).to eq "Cafe Latte 1 x 4.75"
  end
end