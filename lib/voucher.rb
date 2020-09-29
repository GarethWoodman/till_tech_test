class Voucher
  attr_reader :percentage, :name, :date_from, :date_to

  def initialize(percentage, name, date_from, date_to)
    @percentage = percentage
    @name = name
    @date_from = date_from
    @date_to = date_to
  end

  def offer
    "Voucher #{@percentage}% Off All #{@name}"
  end

  def valid_dates
    "Valid #{@date_from} to #{@date_to}"
  end

  def print
    "#{offer}\n#{valid_dates}"
  end
end