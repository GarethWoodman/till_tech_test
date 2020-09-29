require './lib/voucher'

module Helpers
  def voucher
    Voucher.new(10, 'Muffins', '01/06/2020', '01/12/2020')
  end
end