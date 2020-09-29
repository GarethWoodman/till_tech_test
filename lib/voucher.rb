class Voucher
  attr_reader :percentage, :name

  def initialize(percentage, name)
    @percentage = percentage
    @name = name
  end
end