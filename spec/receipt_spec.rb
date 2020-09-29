require './lib/receipt'
require 'date'

describe 'Receipt' do
  subject { Receipt.new }

  before :each do
    @currentDateTime = DateTime.now().strftime("%Y.%m.%d %H:%M:%S")
  end

  it "prints current date and time" do
    expect(subject.dateTime).to eq @currentDateTime
  end
end